CREATE TABLE [mdm].[PrimaryFlagRanking_Household]
(
[dimcustomerid] [int] NOT NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ssb_crmsystem_acct_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_PRIMARY_FLAG] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG] [int] NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_PRIMARY_FLAG] [int] NULL,
[Source System Priority] [int] NOT NULL,
[Season Ticket Holder] [int] NOT NULL,
[Season Ticket Holder - Max Purchase Date] [date] NOT NULL,
[Season Ticket Holder - Max Updated Date] [datetime] NOT NULL,
[Group Purchaser] [int] NOT NULL,
[Group Purchaser - Max Upadted Date] [datetime] NOT NULL,
[Max Overall Purchase Date] [date] NOT NULL,
[Max Updated Date] [datetime] NOT NULL,
[Ticket Exchange - Max Purchase Date] [datetime] NOT NULL,
[ranking] [bigint] NULL,
[SS_ranking] [bigint] NULL
)
GO
CREATE CLUSTERED INDEX [ix_tmpRanking] ON [mdm].[PrimaryFlagRanking_Household] ([dimcustomerid])
GO
