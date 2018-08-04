SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












 
/*****Hash Rules for Reference******
WHEN 'int' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_INT'')'
WHEN 'bigint' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIGINT'')'
WHEN 'datetime' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')' 
WHEN 'datetime2' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'
WHEN 'date' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ',112)),''DBNULL_DATE'')'
WHEN 'bit' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIT'')' 
WHEN 'decimal' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')'
WHEN 'numeric' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')'
ELSE 'ISNULL(RTRIM(' + COLUMN_NAME + '),''DBNULL_TEXT'')'
*****/

CREATE VIEW [etl].[vw_Load_DimCustomer_DyamicsContact] AS 

(

	SELECT *
	/*Name*/
	, HASHBYTES('sha2_256',
							ISNULL(RTRIM(FullName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Prefix),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(FirstName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(LastName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Suffix),'DBNULL_TEXT')
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							) AS [NameDirtyHash]
	, 'Dirty' AS [NameIsCleanStatus]
	, NULL AS [NameMasterId]

	/*Address*/
	/*Address*/
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
							) AS [AddressPrimaryDirtyHash]
	, 'Dirty' AS [AddressPrimaryIsCleanStatus]
	, NULL AS [AddressPrimaryMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressOneStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressOneSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressOneCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressOneState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressOneZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressOneCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressOneCountry),'DBNULL_TEXT')
							) AS [AddressOneDirtyHash]
	, 'Dirty' AS [AddressOneIsCleanStatus]
	, NULL AS [AddressOneMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressTwoStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressTwoSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressTwoCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressTwoState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressTwoZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressTwoCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressTwoCountry),'DBNULL_TEXT')
							) AS [AddressTwoDirtyHash]
	, 'Dirty' AS [AddressTwoIsCleanStatus]
	, NULL AS [AddressTwoMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressThreeStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressThreeSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressThreeZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressThreeCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressThreeCountry),'DBNULL_TEXT')
							) AS [AddressThreeDirtyHash]
	, 'Dirty' AS [AddressThreeIsCleanStatus]
	, NULL AS [AddressThreeMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressFourStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressFourSuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressFourZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressFourCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressFourCountry),'DBNULL_TEXT')
							) AS [AddressFourDirtyHash]
	, 'Dirty' AS [AddressFourIsCleanStatus]
	, NULL AS [AddressFourMasterId]

	/*Contact*/
	, HASHBYTES('sha2_256', ISNULL(RTRIM(Prefix),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(FirstName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(LastName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Suffix),'DBNULL_TEXT')+ ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT') 
							--+ ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')
							--+ ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
							) AS [ContactDirtyHash]

	/*Phone*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhonePrimary),'DBNULL_TEXT')) AS [PhonePrimaryDirtyHash]
	, 'Dirty' AS [PhonePrimaryIsCleanStatus]
	, NULL AS [PhonePrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneHome),'DBNULL_TEXT')) AS [PhoneHomeDirtyHash]
	, 'Dirty' AS [PhoneHomeIsCleanStatus]
	, NULL AS [PhoneHomeMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneCell),'DBNULL_TEXT')) AS [PhoneCellDirtyHash]
	, 'Dirty' AS [PhoneCellIsCleanStatus]
	, NULL AS [PhoneCellMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneBusiness),'DBNULL_TEXT')) AS [PhoneBusinessDirtyHash]
	, 'Dirty' AS [PhoneBusinessIsCleanStatus]
	, NULL AS [PhoneBusinessMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneFax),'DBNULL_TEXT')) AS [PhoneFaxDirtyHash]
	, 'Dirty' AS [PhoneFaxIsCleanStatus]
	, NULL AS [PhoneFaxMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneOther),'DBNULL_TEXT')) AS [PhoneOtherDirtyHash]
	, 'Dirty' AS [PhoneOtherIsCleanStatus]
	, NULL AS [PhoneOtherMasterId]

	/*Email*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailPrimary),'DBNULL_TEXT')) AS [EmailPrimaryDirtyHash]
	, 'Dirty' AS [EmailPrimaryIsCleanStatus]
	, NULL AS [EmailPrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailOne),'DBNULL_TEXT')) AS [EmailOneDirtyHash]
	, 'Dirty' AS [EmailOneIsCleanStatus]
	, NULL AS [EmailOneMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailTwo),'DBNULL_TEXT')) AS [EmailTwoDirtyHash]
	, 'Dirty' AS [EmailTwoIsCleanStatus]
	, NULL AS [EmailTwoMasterId]

	
	/*Attributes*/
, HASHBYTES('sha2_256', ISNULL(RTRIM(customerType),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CustomerStatus),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AccountType),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AccountRep),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(SalutationName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(DonorMailName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(DonorFormalName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(Birthday),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(Gender),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AccountId),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedRecordFlag),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedIntoSSID),'DBNULL_TEXT')
							+ ISNULL(RTRIM(IsBusiness),'DBNULL_TEXT')) AS [contactattrDirtyHash]

, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute1),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute2),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute3),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute4),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute5),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute6),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute7),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute8),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute9),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute10),'DBNULL_TEXT') 
							) AS [extattr1_10DirtyHash]

							, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute11),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute12),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute13),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute14),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute15),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute16),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute17),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute18),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute19),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute20),'DBNULL_TEXT') 
							) AS [extattr11_20DirtyHash]

							
, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute21),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute22),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute23),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute24),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute25),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute26),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute27),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute28),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute29),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute30),'DBNULL_TEXT') 
							) AS [extattr21_30DirtyHash]

							
, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute31),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute32),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute33),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute34),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute35),'DBNULL_TEXT')
							) AS [extattr31_35DirtyHash]




    FROM (
--base set
        SELECT
            'Jets_Reporting' AS [SourceDB] --Client Source Database such as Raiders or Raiders_Reporting
            , 'CRM_Contact' AS [SourceSystem] --Put source name such as TM or CRM_Contact
            , NULL AS [SourceSystemPriority] --Depends on if client uses sourcesystem/sourcesystempriority tables for MDM Rules
 
            /*Standard Attributes*/
            , CAST(z.ContactID AS NVARCHAR(50)) [SSID] -- Required
            , CAST(NULL AS NVARCHAR (50)) AS [CustomerType]
            , CAST(NULL AS NVARCHAR (50)) AS [CustomerStatus]
            , CAST(NULL AS NVARCHAR (50)) AS [AccountType] 
            , CAST(ownerid AS NVARCHAR (50)) AS [AccountRep] 
            , CAST(z.parentcustomeridname AS NVARCHAR (50)) AS [CompanyName] 
            , Salutation AS [SalutationName]
            , NULL AS [DonorMailName]
            , NULL AS [DonorFormalName]
            , CONVERT(VARCHAR(30),birthdate, 102) AS [Birthday] -- field is sensitive see writup in sharepoint for an example of how complicated it can get
            , gendercode AS [Gender] 
            , 0 [MergedRecordFlag]
            , NULL [MergedIntoSSID]
 
            /**ENTITIES**/
            /*Name*/
            , NULL AS [Prefix]
            , firstname AS [FirstName]
            , middlename AS [MiddleName]
            , lastname AS [LastName]
            , suffix AS [Suffix]
			, CASE WHEN suffix IS NULL THEN fullname ELSE fullname + ' ' + suffix END AS [Fullname]
            --, c.name_title as [Title]
 
            /*AddressPrimary*/
            , ISNULL(address1_line1,'') AS [AddressPrimaryStreet] -- dont load suites combine addresses with multiple lines and load to street
            , address1_city AS [AddressPrimaryCity] 
            , address1_stateorprovince  AS [AddressPrimaryState] 
            , address1_postalcode AS [AddressPrimaryZip] 
            , address1_county AS [AddressPrimaryCounty]
            , address1_country  AS [AddressPrimaryCountry] 
             
            , NULL AS [AddressOneStreet]
            , NULL AS [AddressOneCity] 
            , NULL AS [AddressOneState] 
            , NULL AS [AddressOneZip] 
            , NULL AS [AddressOneCounty] 
            , NULL AS [AddressOneCountry] 
            , NULL AS [AddressTwoStreet]
            , NULL AS [AddressTwoCity] 
            , NULL AS [AddressTwoState] 
            , NULL AS [AddressTwoZip] 
            , NULL AS [AddressTwoCounty] 
            , NULL AS [AddressTwoCountry] 
            , NULL AS [AddressThreeStreet]
            , NULL AS [AddressThreeCity] 
            , NULL AS [AddressThreeState] 
            , NULL AS [AddressThreeZip] 
            , NULL AS [AddressThreeCounty] 
            , NULL AS [AddressThreeCountry] 
            , NULL AS [AddressFourStreet]
            , NULL AS [AddressFourCity] 
            , NULL AS [AddressFourState] 
            , NULL AS [AddressFourZip] 
            , NULL AS [AddressFourCounty]
            , NULL AS [AddressFourCountry] 
			, NULL AS [AddressPrimarySuite]
			, NULL AS [AddressOneSuite]
			, NULL AS [AddressTwoSuite]
			, NULL AS [AddressThreeSuite]
			, NULL AS [AddressFourSuite]
 
 
            /*Phone*/
            , COALESCE(NULLIF(LEFT(telephone1,25),''),NULLIF(LEFT(telephone2,25),'')) AS [PhonePrimary]
            , LEFT(telephone2,25) AS [PhoneHome]
            , LEFT(z.mobilephone,25) AS [PhoneCell]--
            , LEFT(telephone1,25) AS [PhoneBusiness]--
            , LEFT(z.fax,25) AS [PhoneFax]
            , LEFT(z.telephone3,25) AS [PhoneOther]
 
            /*Email*/
            , CAST(emailaddress1 AS NVARCHAR(256)) AS [EmailPrimary]
            , CAST(emailaddress2 AS NVARCHAR(256)) AS [EmailOne]
            , CAST(emailaddress3 AS NVARCHAR(256)) AS [EmailTwo]
 
            /*Extended Attributes*/
            , CAST(str_number AS NVARCHAR(100)) AS[ExtAttribute1] --nvarchar(100)
            , z.contactid AS[ExtAttribute2] --nvarchar(100)
            , NULL AS[ExtAttribute3] --nvarchar(100)
            , NULL AS[ExtAttribute4] --nvarchar(100)
            , NULL AS[ExtAttribute5] --nvarchar(100)
            , NULL AS[ExtAttribute6] --nvarchar(100)
            , NULL AS[ExtAttribute7] --nvarchar(100)
            , NULL AS[ExtAttribute8] --nvarchar(100)
            , NULL AS[ExtAttribute9] --nvarchar(100)
            , NULL AS[ExtAttribute10] --nvarchar(1000)
 
            , NULL AS [ExtAttribute11] --decimal(18,6)
            , NULL AS [ExtAttribute12] --decimal(18,6)
            , NULL AS [ExtAttribute13] --decimal(18,6)
            , NULL AS [ExtAttribute14] --decimal(18,6)
            , NULL AS [ExtAttribute15] --decimal(18,6)
            , NULL AS [ExtAttribute16] --decimal(18,6)
            , NULL AS [ExtAttribute17] --decimal(18,6)
            , NULL AS [ExtAttribute18] --decimal(18,6)
            , NULL AS [ExtAttribute19] --decimal(18,6)
            , NULL AS [ExtAttribute20] --decimal(18,6) 
 
            , NULL AS [ExtAttribute21] --datetime
            , NULL AS [ExtAttribute22] --datetime
            , NULL AS [ExtAttribute23] --datetime
            , NULL AS [ExtAttribute24] --datetime
            , NULL AS [ExtAttribute25] --datetime
            , NULL AS [ExtAttribute26] --datetime
            , NULL AS [ExtAttribute27] --datetime
            , NULL AS [ExtAttribute28] --datetime
            , NULL AS [ExtAttribute29] --datetime
            , NULL AS [ExtAttribute30] --datetime 
            , NULL AS [ExtAttribute31] --nvarchar(max)
            , NULL AS [ExtAttribute32] --nvarchar(max)
            , NULL AS [ExtAttribute33] --nvarchar(max)
            , NULL AS [ExtAttribute34] --nvarchar(max)
            , NULL AS [ExtAttribute35] --nvarchar(max)
 
            /*Source Created and Updated*/
            , createdby [SSCreatedBy] --createdby
            , modifiedby [SSUpdatedBy] --lastmodifiedbyid
            , createdon [SSCreatedDate] --createddate
            , modifiedon [SSUpdatedDate] --lastmodifiedbyid
            , GETDATE () AS createddate 
            , GETDATE () AS updateddate
            , CASE WHEN (SELECT value FROM [dbo].[fn_Split](str_number,'|') WHERE position = 1) IS NOT NULL
				THEN (SELECT RTRIM(value) FROM [dbo].[fn_Split](str_number,'|') WHERE position = 1) ELSE NULL END AS  [AccountId]
			, statecode AS IsDeleted
            , 0 AS IsBusiness
            , CASE WHEN ISNULL(z.new_SSBSSIDWinnerSourceSystem,'') = '' OR ISNULL(z.new_SSBCRMSystemSSIDWinner,'') = '' THEN NULL
					WHEN z.new_SSBSSIDWinnerSourceSystem = 'TM' THEN 'TM-' + z.new_SSBCRMSystemSSIDWinner
					WHEN z.new_SSBSSIDWinnerSourceSystem = 'CRM_Contact' THEN NULL
					ELSE NULL
					END AS customer_matchkey

--		select top 100 *           
        FROM Jets_Reporting.prodcopy.vw_contact z WITH (NOLOCK) 
--LEFT JOIN jets.dbo.tmp_ContactReload cr ON z.contactid = cr.contactid
        WHERE (1=1
		AND (z.createdon > DATEADD(DAY,-3,GETDATE()) OR z.modifiedon > DATEADD(DAY,-3,GETDATE()) OR z.copyloaddate >DATEADD(DAY,-3,GETDATE()) )
		AND z.copyloaddate > '2017-10-07 15:34:57.077'  -- After 1st incremental
			)
			--OR cr.contactid IS NOT NULL
		

    ) a
 
)












GO
