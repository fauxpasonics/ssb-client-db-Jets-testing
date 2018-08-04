CREATE TABLE [tmarc].[FILE_ssb_jets13_20171101_FP_payment_schedule_payment_export]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[payment_Schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[due_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[FILE_ssb_jets13_20171101_FP_payment_schedule_payment_export] ADD CONSTRAINT [PK__FILE_ssb__C4EA244554ED46C4] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
