SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [rpt].[vw_DimSeat] AS (SELECT * FROM dbo.DimSeat (NOLOCK) WHERE IsDeleted = 0) 



GO
