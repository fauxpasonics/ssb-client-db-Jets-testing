SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [etl].[Load_IMC_EmailSummary_MSCRM]
AS

/*========================================================================================================
	Create distinct list of SSB_CRMSYSTEM_CONTACT_IDs and Email Addresses
========================================================================================================*/
IF OBJECT_ID('tempdb..#EmailMatches') IS NOT NULL
    DROP TABLE #EmailMatches
SELECT DISTINCT dc.SSB_CRMSYSTEM_CONTACT_ID, dc.EmailPrimary
INTO #EmailMatches
FROM dbo.vwDimCustomer_ModAcctId dc
WHERE dc.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL
	AND dc.EmailPrimary IS NOT NULL
	AND dc.EmailPrimary <> ''
	AND dc.EmailPrimaryIsCleanStatus = 'Valid'


/*========================================================================================================
	Map SSBID to mailing summary on email address
========================================================================================================*/
IF OBJECT_ID('tempdb..#DeliveryResult') IS NOT NULL
	DROP TABLE #DeliveryResult
SELECT Recipient_ID, Mailing_ID, Report_ID, Email, Event_Type, Event_Timestamp
INTO #DeliveryResult
FROM ods.IMC_RawRecipient
WHERE Event_Type IN ('Hard Bounce','Soft Bounce','Sent','Suppressed')

IF OBJECT_ID('tempdb..#Open') IS NOT NULL
	DROP TABLE #Open
SELECT Recipient_ID, Mailing_ID, Report_ID, Email, Event_Type, Event_Timestamp
INTO #Open
FROM ods.IMC_RawRecipient
WHERE Event_Type = 'Open'

IF OBJECT_ID('tempdb..#Clicks') IS NOT NULL
	DROP TABLE #Clicks
SELECT Recipient_ID, Mailing_ID, Report_ID, Email, Event_Type, Event_Timestamp, URL
INTO #Clicks
FROM ods.IMC_RawRecipient
WHERE Event_Type = 'Click Through'

IF OBJECT_ID('tempdb..#MappedGUIDs') IS NOT NULL
    DROP TABLE #MappedGUIDs
SELECT e.SSB_CRMSYSTEM_CONTACT_ID,
	   rd.Recipient_ID AS MemberId,
       rd.Email,
       m.MailingId,
       m.MailingName,
       c.URL PublicWebViewURL,
       CASE
           WHEN rd.Event_Type IN ( 'Hard Bounce', 'Soft Bounce' ) THEN
               'Bounce'
           WHEN rd.Event_Type = 'Sent' THEN
               'Sent'
           WHEN rd.Event_Type = 'Suppressed' THEN
               'Suppressed'
       END AS DeliveryResult,
       SUM(   CASE
                  WHEN rd.Event_Type IN ( 'Hard Bounce', 'Soft Bounce' ) THEN
                      1
                  WHEN rd.Event_Type = 'Sent' THEN
                      1
                  WHEN rd.Event_Type = 'Suppressed' THEN
                      1
                  ELSE
                      0
              END
          ) AS DeliveryCount,
       MIN(rd.Event_Timestamp) MinDeliveryTime,
       SUM(   CASE
                  WHEN o.Event_Type = 'Open' THEN
                      1
                  ELSE
                      0
              END
          ) AS OpenCount,
       MIN(o.Event_Timestamp) AS MinOpenTime,
       SUM(   CASE
                  WHEN c.Event_Type = 'Click Through' THEN
                      1
                  ELSE
                      0
              END
          ) AS ClickCount,
       MIN(c.Event_Timestamp) AS MinClickTime
INTO #MappedGUIDs
FROM #DeliveryResult rd (NOLOCK)
    JOIN ods.IMC_Mailingsbyname m (NOLOCK)
        ON m.MailingId = rd.Mailing_ID
    LEFT JOIN #Open o
        ON o.Email = rd.Email
           AND o.Mailing_ID = rd.Mailing_ID
           AND o.Recipient_ID = rd.Recipient_ID
    LEFT JOIN #Clicks c
        ON c.Email = rd.Email
           AND c.Mailing_ID = rd.Mailing_ID
           AND c.Recipient_ID = rd.Recipient_ID
	JOIN #EmailMatches e
		ON rd.Email = e.EmailPrimary
WHERE DATEDIFF(DAY,m.SentTS,GETDATE())<=30
GROUP BY e.SSB_CRMSYSTEM_CONTACT_ID,
		 CASE
             WHEN rd.Event_Type IN ( 'Hard Bounce', 'Soft Bounce' ) THEN
                 'Bounce'
             WHEN rd.Event_Type = 'Sent' THEN
                 'Sent'
             WHEN rd.Event_Type = 'Suppressed' THEN
                 'Suppressed'
         END,
         rd.Recipient_ID,
         rd.Email,
         m.MailingId,
         m.mailingName,
        m.MailingName,
         c.URL
--	ORDER BY rd.Email, e.SSB_CRMSYSTEM_CONTACT_ID




/*========================================================================================================
	Merge into 
========================================================================================================*/

BEGIN

	MERGE etl.IMC_EmailSummary_MSCRM AS TARGET
	USING
		(
			SELECT SSB_CRMSYSTEM_CONTACT_ID
				, MemberID
				, Email
				, MailingID
				, MailingName
				, PublicWebviewURL
				, DeliveryResult
				, DeliveryCount
				, MinDeliveryTime
				, OpenCount
				, MinOpenTime
				, ClickCount
				, MinClickTime
			FROM #MappedGUIDs
		) AS SOURCE
	ON (TARGET.SSB_CRMSYSTEM_CONTACT_ID = SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		AND TARGET.MemberID = SOURCE.MemberID
		AND TARGET.EmailAddress = SOURCE.Email
		AND TARGET.MailingID = SOURCE.MailingID
		AND TARGET.MailingName = SOURCE.MailingName
		AND TARGET.PublicWebviewURL = SOURCE.PublicWebViewURL
		AND TARGET.DeliveryResult = SOURCE.DeliveryResult
		)
	WHEN MATCHED AND (TARGET.DeliveryCount <> SOURCE.DeliveryCount OR TARGET.MinDeliveryTime <> source.MinDeliveryTime
						OR TARGET.OpenCount <> SOURCE.OpenCount	OR TARGET.MinOpenTime <> SOURCE.MinOpenTime
						OR TARGET.ClickCount <> SOURCE.ClickCount OR TARGET.MinClickTime <> SOURCE.MinClickTime
						)
	THEN
		UPDATE SET
			  TARGET.MailingName = SOURCE.MailingName
			, TARGET.PublicWebviewURL = SOURCE.PublicWebviewURL
			, TARGET.DeliveryResult = SOURCE.DeliveryResult
			, TARGET.DeliveryCount = SOURCE.DeliveryCount
			, TARGET.MinDeliveryTime = SOURCE.MinDeliveryTime
			, TARGET.OpenCount = SOURCE.OpenCount
			, TARGET.MinOpenTime = SOURCE.MinOpenTime
			, TARGET.ClickCount = SOURCE.ClickCount
			, TARGET.MinClickTime = SOURCE.MinClickTime
			, TARGET.ETL_UpdatedDate = GETDATE()
	
	WHEN NOT MATCHED THEN
	INSERT (SSB_CRMSYSTEM_CONTACT_ID, MemberID, EmailAddress, MailingID, MailingName, PublicWebviewURL
			, DeliveryResult, DeliveryCount, MinDeliveryTime, OpenCount, MinOpenTime, ClickCount
			, MinClickTime, ETL_CreatedDate, ETL_UpdatedDate)
	
	VALUES (
		SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		, SOURCE.MemberID
		, SOURCE.Email
		, SOURCE.MailingID
		, SOURCE.MailingName
		, SOURCE.PublicWebviewURL
		, SOURCE.DeliveryResult
		, SOURCE.DeliveryCount
		, SOURCE.MinDeliveryTime
		, SOURCE.OpenCount
		, SOURCE.MinOpenTime
		, SOURCE.ClickCount
		, SOURCE.MinClickTime
		, GETDATE()
		, GETDATE()
		);

END
GO
