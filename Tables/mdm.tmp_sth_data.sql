CREATE TABLE [mdm].[tmp_sth_data]
(
[dimcustomerid] [int] NOT NULL,
[STH] [int] NOT NULL,
[MaxSTHPurchaseDate] [date] NULL,
[MaxUpdatedDate] [datetime] NULL,
[MinCreatedDate] [datetime] NULL,
[TEXMaxTransaction] [datetime] NOT NULL,
[Grp] [int] NOT NULL,
[accountid] [int] NOT NULL,
[GRPMaxUpdatedDate] [datetime] NULL,
[MaxOverallPurchaseDate] [date] NULL,
[STHMaxUpdatedDate] [datetime] NULL
)
GO
CREATE NONCLUSTERED INDEX [ix_tmp_sth_data] ON [mdm].[tmp_sth_data] ([dimcustomerid])
GO
