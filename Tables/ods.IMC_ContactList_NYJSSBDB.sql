CREATE TABLE [ods].[IMC_ContactList_NYJSSBDB]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[RECIPIENT_ID] [bigint] NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Date] [datetime] NULL,
[Opted_Out] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Details] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Type] [int] NULL,
[Opted_Out_Date] [datetime] NULL,
[Opt_Out_Details] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_City] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_State] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street_2] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Zip_Code] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_Account_Number] [int] NULL,
[Birthday] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_GUID] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company_Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Click] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Open] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Send] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Phone_Number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_ID] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Email] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Phone] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Send_Time_Optimiziation] [int] NULL,
[Sub_Event_Invites] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Newsletter] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Promotions_Offers] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[IMC_ContactList_NYJSSBDB] ADD CONSTRAINT [PK_ods__IMC_ContactList_NYJSSBDB] PRIMARY KEY NONCLUSTERED  ([ETL__ID])
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__IMC_ContactList_NYJSSBDB] ON [ods].[IMC_ContactList_NYJSSBDB]
GO
CREATE NONCLUSTERED INDEX [IX_ETL__UpdatedDate] ON [ods].[IMC_ContactList_NYJSSBDB] ([ETL__UpdatedDate])
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [ods].[IMC_ContactList_NYJSSBDB] ([RECIPIENT_ID]) INCLUDE ([ETL__DeltaHashKey])
GO
