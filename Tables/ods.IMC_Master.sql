CREATE TABLE [ods].[IMC_Master]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[RECIPIENT_ID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Date] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Details] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Type] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out_Date] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_Out_Details] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_City] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_State] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street_2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Zip_Code] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_Account_Number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_GUID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Click] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Open] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Send] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Phone_Number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Phone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Send_Time_Optimiziation] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Event_Invites] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Newsletter] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Promotions_Offers] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[IMC_Master] ADD CONSTRAINT [PK_ods__IMC__Master] PRIMARY KEY NONCLUSTERED  ([ETL__ID])
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__IMC_Master] ON [ods].[IMC_Master]
GO
CREATE NONCLUSTERED INDEX [IX_LoadKey] ON [ods].[IMC_Master] ([RECIPIENT_ID]) INCLUDE ([ETL__DeltaHashKey])
GO
