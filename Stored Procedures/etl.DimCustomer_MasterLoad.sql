SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]

AS
BEGIN



--	Data Uploader
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = 'api.UploadDimCustomerStaging', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '1'


-- TM
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_TM]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


 --CRM Contact
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_DyamicsContact]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


 --CRM Account
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_DynamicsAccount]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

 --Fanatics
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_Fanatics]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

 --Fancentric
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_Fancentric]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

 --Silverpop Old DB
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Jets', @LoadView = '[etl].[vw_Load_DimCustomer_IMC_NYJCRM2011]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

END


GO
