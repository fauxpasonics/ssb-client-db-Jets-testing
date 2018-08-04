SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW  [segmentation].[vw__Source_System] AS (

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID
		, dc.SourceSystem CustomerSourceSystem

FROM   [dbo].[vwDimCustomer_ModAcctId] dc WITH ( NOLOCK )

WHERE dc.SourceSystem NOT IN ('CI Model', 'TM', 'CRM_Account'
, 'CRM_Contact', 'Fanatics', 'FanCentric', 'Silverpop_nyj2011') --added by AMEITIN 11/16/2017 to limit record count


) 



































GO
