CREATE TABLE [qa].[IMC_SSBDB]
(
[RECIPIENT_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Details] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_Out_Details] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_City] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_State] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Street_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Zip_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_Account_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_GUID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Click] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Open] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Send] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Phone_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salesperson_Phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Send_Time_Optimiziation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Event_Invites] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Newsletter] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Promotions_Offers] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_qa__IMC_SSBDB] ON [qa].[IMC_SSBDB]
GO
