SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vw_KeyAccounts]
AS 


SELECT dc.DimCustomerID, dc.SSB_CRMSYSTEM_CONTACT_ID SSBID, dc.SSID
FROM dbo.vwDimCustomer_ModAcctId dc
INNER JOIN Jets_Reporting.prodcopy.Contact pcc ON CAST(pcc.contactid AS NVARCHAR(100)) = dc.SSID AND dc.sourcesystem = 'crm_contact'
INNER JOIN jets_reporting.prodcopy.account pca ON pca.accountid = pcc.parentcustomerid AND pcc.parentcustomeridtype = 'account'
WHERE pca.str_category LIKE '%Partner%' OR pca.str_category LIKE '%premium%' OR pcc.contactid = 'F4449353-FF17-E611-80E1-5065F38BA161'





GO
