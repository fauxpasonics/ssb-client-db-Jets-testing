CREATE TABLE [ods].[IMC_MailingsByName]
(
[MailingId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MailingName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReportId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduledTS] [datetime2] NULL,
[UserName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SentTS] [datetime2] NULL,
[NumSent] [int] NULL,
[Visibility] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentTemplateId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[IMC_MailingsByName] ADD CONSTRAINT [PK__IMC_Mail__224CB6BADA0E4464] PRIMARY KEY CLUSTERED  ([MailingId])
GO
