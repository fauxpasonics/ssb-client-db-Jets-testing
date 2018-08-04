CREATE TABLE [bkp].[IMC_RawRecipient_20180328]
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
[Click_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Action] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Detail] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Amount] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suppression_Reason] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_ods__IMC_RawRecipient] ON [bkp].[IMC_RawRecipient_20180328]
GO
CREATE NONCLUSTERED INDEX [IX_ETL__UpdatedDate] ON [bkp].[IMC_RawRecipient_20180328] ([ETL__UpdatedDate] DESC)
GO
CREATE NONCLUSTERED INDEX [IX_Key] ON [bkp].[IMC_RawRecipient_20180328] ([Recipient_Id], [Mailing_Id], [Report_Id], [Event_Type], [Event_Timestamp], [Body_Type], [Click_Name]) INCLUDE ([ETL__DeltaHashKey])
GO
