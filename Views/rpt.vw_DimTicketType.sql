SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [rpt].[vw_DimTicketType] AS (SELECT * FROM dbo.DimTicketType (NOLOCK))



GO
