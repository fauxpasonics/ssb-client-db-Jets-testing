SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[Load_IMC_RawRecipient_Dev]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS 
BEGIN

SELECT s.ETL__Source, s.ETL__DeltaHashKey
, s.[Recipient_Id], s.[Recipient_Type], s.[Mailing_Id], s.[Report_Id], s.[Campaign_Id], s.[Email], s.[Event_Type], s.[Event_Timestamp], s.[Body_Type], s.[Content_Id], s.[Click_Name], s.[URL], s.[Conversion_Action], s.[Conversion_Detail], s.[Conversion_Amount], s.[Suppression_Reason]
INTO #DeltaSet
FROM stg.IMC_RawRecipient s
LEFT OUTER JOIN ods.IMC_RawRecipient t
    ON s.[Recipient_Id] = t.[Recipient_Id] AND s.[Mailing_Id] = t.[Mailing_Id] AND s.[Report_Id] = t.[Report_Id] AND s.[Event_Type] = t.[Event_Type] AND s.[Event_Timestamp] = t.[Event_Timestamp] AND ISNULL(s.[Body_Type], 'DBNULL') = ISNULL(t.[Body_Type], 'DBNULL') AND ISNULL(s.[Click_Name], 'DBNULL') = ISNULL(t.[Click_Name], 'DBNULL')
WHERE ISNULL(s.ETL__DeltaHashKey, -1) <> ISNULL(t.ETL__DeltaHashKey, -1);


;WITH d AS (
	SELECT ROW_NUMBER() OVER(PARTITION BY Recipient_Id, Mailing_Id, Report_Id, Event_Type, Event_Timestamp, Body_Type, Click_Name ORDER BY ETL__Source desc) AS RowRank
	FROM dbo.#DeltaSet
) 
DELETE FROM d
WHERE RowRank > 1;



MERGE ods.IMC_RawRecipient AS t

USING #DeltaSet s
    
    ON s.[Recipient_Id] = t.[Recipient_Id] AND s.[Mailing_Id] = t.[Mailing_Id] AND s.[Report_Id] = t.[Report_Id] AND s.[Event_Type] = t.[Event_Type] AND s.[Event_Timestamp] = t.[Event_Timestamp] AND s.[Body_Type] = t.[Body_Type] AND s.[Click_Name] = t.[Click_Name]

WHEN MATCHED 

THEN UPDATE 
    SET

    t.ETL__Source = s.ETL__Source
    , t.ETL__UpdatedDate = GETDATE()
    , t.ETL__DeltaHashKey = s.ETL__DeltaHashKey  
    , t.[Recipient_Id] = s.[Recipient_Id]
, t.[Recipient_Type] = s.[Recipient_Type]
, t.[Mailing_Id] = s.[Mailing_Id]
, t.[Report_Id] = s.[Report_Id]
, t.[Campaign_Id] = s.[Campaign_Id]
, t.[Email] = s.[Email]
, t.[Event_Type] = s.[Event_Type]
, t.[Event_Timestamp] = s.[Event_Timestamp]
, t.[Body_Type] = s.[Body_Type]
, t.[Content_Id] = s.[Content_Id]
, t.[Click_Name] = s.[Click_Name]
, t.[URL] = s.[URL]
, t.[Conversion_Action] = s.[Conversion_Action]
, t.[Conversion_Detail] = s.[Conversion_Detail]
, t.[Conversion_Amount] = s.[Conversion_Amount]
, t.[Suppression_Reason] = s.[Suppression_Reason]
  

WHEN NOT MATCHED BY Target

THEN INSERT
(
    ETL__Source
    , ETL__CreatedDate
    , ETL__UpdatedDate	
    , ETL__DeltaHashKey
    , [Recipient_Id]
, [Recipient_Type]
, [Mailing_Id]
, [Report_Id]
, [Campaign_Id]
, [Email]
, [Event_Type]
, [Event_Timestamp]
, [Body_Type]
, [Content_Id]
, [Click_Name]
, [URL]
, [Conversion_Action]
, [Conversion_Detail]
, [Conversion_Amount]
, [Suppression_Reason]
)

VALUES
(
    s.ETL__Source
    , GETDATE() --ETL__CreatedDate
    , GETDATE() --ETL__UpdatedDate	
    , s.ETL__DeltaHashKey
    , [Recipient_Id]
, [Recipient_Type]
, [Mailing_Id]
, [Report_Id]
, [Campaign_Id]
, [Email]
, [Event_Type]
, [Event_Timestamp]
, [Body_Type]
, [Content_Id]
, [Click_Name]
, [URL]
, [Conversion_Action]
, [Conversion_Detail]
, [Conversion_Amount]
, [Suppression_Reason]
)
;

END

GO
