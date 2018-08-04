CREATE TABLE [tmarc].[FILE_ssb_jets12_20171101_FP_cust_email_export]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_type_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primary_ind] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicit_email_registry] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[FILE_ssb_jets12_20171101_FP_cust_email_export] ADD CONSTRAINT [PK__FILE_ssb__C4EA24451FCAC6F4] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
