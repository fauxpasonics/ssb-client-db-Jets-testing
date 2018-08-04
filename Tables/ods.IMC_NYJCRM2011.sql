CREATE TABLE [ods].[IMC_NYJCRM2011]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[RECIPIENT_ID] [bigint] NULL,
[Email] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Date] [datetime] NULL,
[Opted_Out] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Details] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Type] [int] NULL,
[Opted_Out_Date] [datetime] NULL,
[Opt_Out_Details] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Sync_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Enable_Sync] [bit] NULL,
[CRM_Contact_Type] [int] NULL,
[CRM_Account_ID] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACH_Last_4_Digits] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date_of_Birth] [date] NULL,
[EI_Average_read_time] [int] NULL,
[EI_Common_city] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_country] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_device] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_region] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Engagement_category] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_city] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_country] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_region] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GJ_Child_Count] [int] NULL,
[Game_Rewind_Access_Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gameday_Guide_Category] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_1_Birth_Month] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_1_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_2_Birth_Month] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_2_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_3_Birth_Month] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_3_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_4_Birth_Month] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_4_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_5_Birth_Month] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_5_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Groups_Game_Preference] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invoice_Installment_Amont] [money] NULL,
[Jets_Cash_Bonus] [int] NULL,
[Last_Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Price] [decimal] (18, 6) NULL,
[Payment_Method] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pref_Global_Subscriber] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Reduction] [decimal] (18, 6) NULL,
[Purl2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Purl3] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reward_Pick_Up_Date] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rewards_Points] [decimal] (18, 6) NULL,
[STH_Account_Owner_Email] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account_Owner_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account_Owner_Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Archtics_Account_number] [bigint] NULL,
[STH_City] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Contact_Flag] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Full_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_PSL_Count] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Phone_Number] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Primary_STH_Price_Level] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_SEAT_TYPE] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Shipment_Tracking_Number] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_State] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Street_1] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Street_2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Unsigned_Contract_PIN] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Zip] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Payment_Plan_Amount] [money] NULL,
[Segment] [int] NULL,
[Send_Hour] [int] NULL,
[Silverpop_LastClick] [date] NULL,
[Silverpop_LastOpen] [date] NULL,
[Silverpop_LastSent] [date] NULL,
[Special_Comments] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suites_Full_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suites_Passport_Expiration_Date] [date] NULL,
[Suites_Passport_Number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_3] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_4] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Date_3] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_3] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_4] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_5] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_6] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Phone_number] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_4] [int] NULL,
[Survey_Segment] [bigint] NULL,
[Survey_Text_2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_3] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_4] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_5] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_Field] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Textbox_2] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_email] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Email] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_First_Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Game_Selection] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Last_Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Num_Tix] [int] NULL,
[Survey_3GMFLEX_Phone] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Attendanotherevent] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Email] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_First_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Game_Selection] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Last_Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Num_Tix] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Phone] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_OpenEnded] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating] [int] NULL,
[Tenure] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Behavior] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Rank] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Score] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Total_Invoice_Amount] [money] NULL,
[Variable_4] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Variable_5] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_enews] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_gamedayinfo] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_jetsrewards] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_presales] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_specialeventinvites] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_specialoffers] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_sthservice] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_surveyrequest] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_1] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_2] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_6] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[IMC_NYJCRM2011] ADD CONSTRAINT [PK__IMC_NYJC__C4EA2445E1ABCE9D] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
