SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [rpt].[vw_FactTicketSales] AS (SELECT * FROM dbo.FactTicketSales (NOLOCK)) 



GO
