CREATE TABLE [qa].[IMC_CRM]
(
[ETL__ID] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL__DeltaHashKey] [binary] (32) NULL,
[RECIPIENT_ID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Date] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_In_Details] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email_Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opted_Out_Date] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_Out_Details] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Sync_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Enable_Sync] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Contact_Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRM_Account_ID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACH_Last_4_Digits] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date_of_Birth] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Average_read_time] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_city] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_country] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_device] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Common_region] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Engagement_category] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_city] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_country] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EI_Recent_region] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GJ_Child_Count] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Game_Rewind_Access_Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gameday_Guide_Category] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_1_Birth_Month] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_1_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_2_Birth_Month] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_2_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_3_Birth_Month] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_3_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_4_Birth_Month] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_4_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_5_Birth_Month] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GenJets_Child_5_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Groups_Game_Preference] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invoice_Installment_Amont] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jets_Cash_Bonus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PURL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Price] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payment_Method] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pref_Global_Subscriber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Reduction] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Purl2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Purl3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reward_Pick_Up_Date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rewards_Points] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account_Owner_Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account_Owner_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account_Owner_Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Archtics_Account_number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_City] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Contact_Flag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Full_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_PSL_Count] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Phone_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Primary_STH_Price_Level] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_SEAT_TYPE] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Shipment_Tracking_Number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_State] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Street_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Street_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Unsigned_Contract_PIN] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Zip] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Payment_Plan_Amount] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Segment] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Send_Hour] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Silverpop_LastClick] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Silverpop_LastOpen] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Silverpop_LastSent] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Special_Comments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suites_Full_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suites_Passport_Expiration_Date] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suites_Passport_Number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_3] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist_4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Date_3] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_2] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_4] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_5] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Dropdown_6] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Phone_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_2] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating_4] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Segment] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_2] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_4] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_5] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Text_Field] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Textbox_2] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Game_Selection] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Last_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Num_Tix] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_3GMFLEX_Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Attendanotherevent] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Checklist] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_First_Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Game_Selection] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Last_Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Num_Tix] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_IG_Phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_OpenEnded] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_Rating] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tenure] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Behavior] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Rank] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Test_SPAM_alert_Score] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Total_Invoice_Amount] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Variable_4] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Variable_5] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_enews] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_gamedayinfo] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_jetsrewards] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_presales] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_specialeventinvites] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_specialoffers] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_sthservice] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sub_surveyrequest] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_2] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variable_6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_GetDT] ON [qa].[IMC_CRM]
GO
