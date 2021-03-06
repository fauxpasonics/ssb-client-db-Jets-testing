CREATE TABLE [ods].[IMC_Mailings_QueryNames]
(
[MailingId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QueryId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QueryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [ods].[IMC_Mailings_QueryNames] ADD CONSTRAINT [PK__IMC_Mail__87DAC9C7A81A95AA] PRIMARY KEY CLUSTERED  ([MailingId], [QueryId])
GO
