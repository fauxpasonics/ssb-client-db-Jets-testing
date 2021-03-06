CREATE TABLE [jets].[FortressRollover_ToArchtics]
(
[SSID_acct_id] [int] NULL,
[OrderNum] [bigint] NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCode] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Level] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[payment_plan_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payment_Plan_Type] [varchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tenure] [int] NULL,
[Tenure_Classification] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSL Flag] [int] NOT NULL,
[SectionName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RowName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat] [int] NULL,
[Comp Flag] [int] NOT NULL,
[add_datetime] [datetime] NULL,
[First Payment] [date] NULL,
[Renewal Classification] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PointsBonus_EarlyRenewal] [int] NOT NULL,
[CashBonus_EarlyRenewal_AutoRenew] [int] NOT NULL,
[CashBonus_EarlyRenewal_NonAutoRenew] [int] NOT NULL,
[CashBonus_StandardRenewal_AutoRenew] [int] NOT NULL,
[CashBonus_NewSeat] [int] NOT NULL,
[CashBonus_NoPSLSeat] [int] NOT NULL,
[PointBonus_Tenure] [int] NOT NULL,
[PointBonus_NewEnrollmentBonus] [int] NOT NULL,
[PointBonus_SeatLocation] [int] NOT NULL
)
GO
