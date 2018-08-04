SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[TM_LoadDims]
AS
BEGIN
		
	EXEC [etl].[TM_LoadDimArena]
	EXEC [etl].[TM_LoadDimSeason]
	EXEC [etl].[TM_LoadDimItem]
	EXEC [etl].[TM_LoadDimEvent]
	EXEC [etl].[TM_LoadDimPlan]

	EXEC [etl].[TM_LoadDimLedger] 
	EXEC [etl].[TM_LoadDimClassTM]
	EXEC [etl].[TM_LoadDimPromo]
	EXEC [etl].[TM_LoadDimSalesCode]

	EXEC [etl].[TM_LoadDimPriceCode]
	EXEC [etl].[TM_LoadDimPriceCodeMaster] 

	EXEC [etl].[TM_LoadDimSeat]


	--EXEC etl.TM_LoadDimCustomer		-- replaced by following execution DCH 2018-01-26
	EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = 'etl.vw_Load_DimCustomer_TM', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

END


GO
