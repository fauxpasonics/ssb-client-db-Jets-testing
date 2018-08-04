CREATE TABLE [bkp].[ods__IMC__RawRecipient]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__UpdatedDate] [datetime] NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[Recipient_Id] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Recipient_Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mailing_Id] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Report_Id] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Campaign_Id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Timestamp] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Body_Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Content_Id] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Action] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Detail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Amount] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suppression_Reason] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_bkp__ods__IMC__RawRecipient] ON [bkp].[ods__IMC__RawRecipient]
GO
