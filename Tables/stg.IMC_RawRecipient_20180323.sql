CREATE TABLE [stg].[IMC_RawRecipient_20180323]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[Recipient_Id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Recipient_Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mailing_Id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Report_Id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Campaign_Id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Timestamp] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Body_Type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Content_Id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Click_Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Action] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Detail] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Conversion_Amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suppression_Reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[IMC_RawRecipient_20180323] ADD CONSTRAINT [PK__IMC_RawR__C4EA2445070E0CC7] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
