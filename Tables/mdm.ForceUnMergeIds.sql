CREATE TABLE [mdm].[ForceUnMergeIds]
(
[dimcustomerid] [int] NULL,
[forced_contact_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__ForceUnMe__Creat__3318C8E5] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__ForceUnMe__Updat__340CED1E] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorGrouping] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
