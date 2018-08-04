CREATE TABLE [tmarc].[FILE_ssb_jets15_20171101_FP_cust_trace_export]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[full_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activity_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activity_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[call_reason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[call_reason_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[error_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ip_address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_name_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activity_comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [tmarc].[FILE_ssb_jets15_20171101_FP_cust_trace_export] ADD CONSTRAINT [PK__FILE_ssb__C4EA2445D07E5A77] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
