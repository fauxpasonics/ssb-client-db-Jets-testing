SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
    (
      @BatchId INT = 0
    , @LoadDate DATETIME = NULL
    , @Options NVARCHAR(MAX) = NULL
    )
AS
    BEGIN


	
				






--------------------------------------------------------------------------------------------------------------------------------------------------
                                                             --TICKET TYPE--
--------------------------------------------------------------------------------------------------------------------------------------------------

----------------2017 Season Ticket NEW----------------


				 UPDATE fts
				 SET    fts.DimTicketTypeId = 1
				  ,	   	fts.DimPlanTypeId = 1
				  

--SELECT DISTINCT
--       DimPlan.DimSeasonId
--     , PriceCode.PriceCode
--	 , PriceCode.PriceCodeDesc
--     , PriceCode.PC1
--     , PriceCode.PC2
--     , PlanCode
--	 , PlanName
        
		FROM    #stgFactTicketSales fts
                INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
                INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanId
       
	    WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND (PriceCode.PC1 LIKE ( '[A-X]' )
                  AND PriceCode.PC2 = 'N'
                  AND PlanCode LIKE '%FS')
				  OR plancode LIKE '17FS_GM'
                )
				
				
			
----------------- 2017 Season Ticket RENEWAL ------------


		
        UPDATE  fts
        SET     fts.dimtickettypeid = 1
              , fts.dimplantypeid = 2

	
--SELECT DISTINCT
--       DimPlan.DimSeasonId
--     , PriceCode.PriceCode
--     , PriceCode.PC1
--     , PriceCode.PC2
--     , PlanCode
        FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
        WHERE   --2017
                ( fts.DimSeasonId = 14
                 AND ((PriceCode.PC1 like ( '[A-X]' ) and pricecode.pc2 is null)
						OR (PriceCode.PC1 like ( '[A-X]' ) and isnull(PriceCode.PC2, '') = 't' ))
                 AND PlanCode LIKE '%FS'
                )



--------------2017 Large Broker Season Ticket---------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 2
						,	fts.dimplantypeid = 10

--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode

		
		FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID

        WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				  AND PriceCode.PC2 = 'K'
				  AND PlanCode like '%FS'
                )
				--OR
				----2016
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 = 'K'
				--  And PriceCode.PC3 like ( '[1-4]' )
				--  AND PlanCode like '%FS'
    --            )

				----2015
				--OR
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 LIKE ('[J-K]')
				--  And PriceCode.PC3 LIKE ( '[1-7]' )
				--  AND (PriceCode.PC4 LIKE 'A' or PriceCode.PC4 is null)
				--  AND PlanCode like '%FS'
    --            )

				----2014
				--OR
				--(FTS.DimSeason = --seasonID--
				-- AND PriceCode.PC1 LIKE ( '[A-X]' )
				-- AND PriceCode.PC2 LIKE ( '[J,K]' )
				-- And PriceCode.PC3 LIKE ( '[1-9,A,C]' )
				-- AND PlanCode like '%FS'
				-- )



-----------------------2017 Non PSL Add On-----------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 15
						,	fts.dimplantypeid = 3

--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode

		
		FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
        WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND PriceCode.PC1 LIKE ( '[A-X]' )
				  AND PriceCode.PC2 = 'S'
				  AND PlanCode like '%FS'
                )
				--OR
				----2016
				--( fts.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[A-X]' )
				--  AND PriceCode.PC2 = 'S'
				--  and PlanCode LIKE '%FS'
				--)


-------------------------------2017 PSL Comeback------------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 16
						,	fts.dimplantypeid = 4

--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode

		
		FROM   #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
        WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND ((PriceCode.PC1 LIKE ( '[A-X]' )
				  AND PriceCode.PC2 = 'C'
				  AND PlanCode like '%FS')
				  or (plancode = 'none' and pricecode.pricecode in ('R','T','X','V','LC','QC','RC','L','U','PC')))
                )

----------------------------------2017 Boarding Pass-----------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 18
						,	fts.dimplantypeid = 5
--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode

		
		FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
        WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				  AND PriceCode.PC2 = 'U'
				  AND PlanCode like 'EXP%'
                )

-----------------------------2017 ADA---------------------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 17
						,	fts.dimplantypeid = 6

--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode

		
		FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
        WHERE   --2017
                ( fts.DimSeasonId = 14
                  AND ((PriceCode.PC1 LIKE ( '[A-X]' )
						AND PriceCode.PC2 = 'A')
				  OR (PriceCode.PC1 LIKE ( '[A-X]' )
						AND PriceCode.PC2 = 'N'
						AND PriceCode.PC3 = 'A')
						AND PlanCode like '%FS')
                )
				
				----2016
				--OR
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 = 'A'
				--  AND (PriceCode.PC3 LIKE ( '[1,2,3]' ) or PriceCode.PC3 is null)
				--  AND PlanCode like '%FS'
    --            )
				
				----2015
				--OR
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 like ( '[A,V,Z]' )
				--  AND PriceCode.PC3 LIKE ( '[A,B,C,D]' ) 
				--  AND (PriceCode.PC4 = 'A' or PriceCode.PC4 is null)
				--  AND PlanCode like '%FS'
    --            )

				----2014
				--OR
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 = 'A'
				--  AND PriceCode.PC3 = 'D'
				--  AND PriceCode.PC4 = 'A'
				--  AND PlanCode like '%FS'
    --            )

				----2013
				--OR
				--( fts.DimSeasonId = --seasonID--
    --              AND PriceCode.PC1 LIKE ( '[A-X]' )
                
				--  AND PriceCode.PC2 = 'A'
				--  AND PriceCode.PC3 = 'D'
				--  AND PriceCode.PC4 = 'A'
				--  AND PlanCode like '%FS'
    --            )

				----2012
				--OR
				--( fts.DimSeasonId = --seasonID--
				--  AND (PriceCode.PC1 LIKE ( '[A-Z]' ) or PriceCode.PC1 like '1')
				--  And PriceCode.PC2 = 'A'
				--  AND PriceCode.PC3 = 'D'
				--  AND PriceCode.PC4 = 'A'
				--  AND PlanCode LIKE '%FS'
			 --   )



--------------------------2017 Group Ticket---------------------------


					UPDATE  fts
				    SET     fts.dimtickettypeid = 3
						,	fts.dimplantypeid = 8



--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID
			
			WHERE --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'G'
					 AND fts.dimplanid = 0
					 AND EventCode like 'NYJ%'
					 )

				 ----2016
				 --OR
				 --   (fts.DimSeasonId = --seasonID--
					-- AND PriceCode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 LIKE ( '[G,L]' )
					-- AND PriceCode.PC3 LIKE ( '[1-9,A,B,C,S,Y]' )
					-- AND PlanCode is null
					-- And EventCode like 'NYJ%'
					-- )

				 ----2015
				 --OR
				 --   (fts.DimSeasonId = --seasonID--
					-- AND PriceCode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 LIKE ( '[G,M,X]' )
					-- AND PriceCode.PC3 LIKE ( '[1-8]' )
					-- AND PlanCode is null
					-- And EventCode like 'NYJ%'
					-- )

     --            --2014
				 --OR
				 --   (fts.DimSeasonId = --seasonID--
					-- AND PriceCode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 LIKE ( '[G,J]' )
					-- AND PriceCode.PC3 LIKE ( '[1-7,B,D]' )
					-- AND PlanCode is null
					-- And EventCode like 'NYJ%'
					-- )

     --             --2013
				 -- OR
				 --   (fts.DimSeasonId = --seasonID--
					-- AND PriceCode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 LIKE ( '[A,G,M]' )
					-- AND (PriceCode.PC3 LIKE ( '[1-7,B,D]' or PriceCode.PC3 is null)
					-- AND PlanCode is null
					-- And EventCode like 'NYJ%'
					-- )

				 -- --2012
				 -- OR
				 --   (fts.DimSeasonId = --seasonID--
					-- AND PriceCode.PC1 like ( '[S,T,U,V]' )
					-- AND PriceCode.PC2 LIKE ( '[G,N,M,V]' )
					-- AND (PriceCode.PC3 LIKE ( '[1-3]') or PriceCode.PC3 is null)
					-- AND PlanCode is null
					-- And EventCode like 'NYJ%'
					-- )


----------------------------2017 Early Deposit Discount----------------------

					UPDATE  fts
				    SET     fts.dimtickettypeid = 12
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'X'
					 AND (PriceCode.PC3 LIKE ( '[1-9]') or PriceCode.PC3 is null)
					 AND (PlanCode is NULL OR PlanCode = 'none')
					 AND EventCode like 'NYJ%'
					 )

----------------------------2017 Fevo----------------------

					UPDATE  fts
				    SET     fts.dimtickettypeid = 13
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'V'
					 AND PlanCode is NULL
					 AND EventCode like 'NYJ%'
					 )


----------------------------2017 Group Broker----------------------

					UPDATE  fts
				    SET     fts.dimtickettypeid = 4
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'H'
					 AND Pricecode.PC3 like ( '[0-9]' )
					 AND(Plancode is null or PlanCode = 'none')
					 AND EventCode like 'NYJ%'
					 )

					 ----2016
					 --OR
					 --(fts.DimSeasonId = 1--seasonID--
					 -- AND PriceCode.PC1 LIKE ( '[A-X]' )
					 -- AND PriceCode.PC2 LIKE ( '[H,K]' )
					 -- and (PriceCode.PC3 LIKE ( '[1-9]' ) or PriceCode.PC3 LIKE ( '[A,C]' ))
					 -- AND PlanCode is null
					 -- and EventCode is 'NYJ%'
					 --)

					 ----2015
					 --OR
					 --(fts.DimSeasonId = --seasonID--
					 -- AND PriceCode.PC1 LIKE ( '[A-X]' )
					 -- AND PriceCode.PC2 LIKE ( '[H,J]' )
					 -- and PriceCode.PC3 LIKE ( '[1-7]' ) 
					 -- AND PlanCode is null
					 -- and EventCode is 'NYJ%'

					 -- --2014
					 -- OR
					 -- ( fts.DimSeasonId = --seasonID--
					 --   AND PriceCode.PC1 like ( '[A-X]' )
						--AND PriceCode.PC2 = 'J'
						--AND PriceCode.PC3 LIKE ( '[5-8]' )
						--AND PlanCode is null
						--AND EventCode LIKE 'NYJ%'
					 -- )



---------------------------2017 Large Group Broker------------------ 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 5
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 like 'L'
					 AND PlanCode is NULL
					 AND EventCode like 'NYJ%'
					 )



--------------2017 Online Promo Code---------------------
					UPDATE  fts
				    SET     fts.dimtickettypeid = 6
						,	fts.dimplantypeid = 8

--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--
		
		FROM    #stgFactTicketSales fts
				INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
				INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
				INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

        WHERE   --2017
		        (FTS.DimSeasonid = 14
				 AND PriceCode.PC1 LIKE ( '[A-X]' )
				 AND PriceCode.PC2 = 'B'
				 AND (Pricecode.PC3 like ( '[0-9]' )
						or  PriceCode.PC3 like ( '[A,B]' ))
				 and fts.dimplanid = 0
				 AND eventcode like 'NYJ%'
				 )

				-- --2016 
				-- OR
				--( FTS.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[A-X]' )
				--  AND PriceCode.PC2 LIKE ( '[B,F]' )
				--  AND (PriceCode.PC3 like ( '[0-9]' ) or PriceCode.PC3 like ( '[A,B]' ))
				--  and PlanCode is null
				--  AND EventCode like 'NYJ%'
    --            )

				----2015
				--OR
				--( FTS.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[A-X]' )
				--  AND PriceCode.PC2 LIKE ( '[B,F]' )
				--  AND (PriceCode.PC3 like ( '[0-9]' ) or PriceCode.PC3 like ( '[A,B,C]' ))
				--  and PlanCode is null
				--  AND EventCode like 'NYJ%'
    --            )

				----2014
				--OR
				--( FTS.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[A-X]' )
				--  AND PriceCode.PC2 LIKE ( '[B,F,R]' )
				--  AND (PriceCode.PC3 like ( '[0-9]' ) or PriceCode.PC3 like ( '[A,B,C]' ))
				--  and PlanCode is null
				--  AND EventCode like 'NYJ%'
    --            )

				----2013
				--OR
				--( FTS.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[C,D,E,F,U,V,W,X]' )
				--  AND PriceCode.PC2 LIKE ( '[A,F,G]' )
				--  AND ((PriceCode.PC3 like ( '[0-9]' ) or PriceCode.PC3 like ( '[A,B,C,D,P]' )
				--		Or (PriceCode.PC1 LIKE ( '[C,D,E,F,U,V,W,X]' ) and PriceCode.PC2 like 'G'))

				--  and PlanCode is null
				--  AND EventCode like 'NYJ%'
				--  //*VFC is not a Group price Code*//
    --            )

				----2012
				--OR
				--( FTS.DimSeason = --seasonID--
				--  AND PriceCode.PC1 LIKE ( '[S,T,U]' )
				--  AND PriceCode.PC2 = 'G'
				--  AND PriceCode.PC3 like ( '[F,D]' )
				--  and PlanCode is null
				--  AND EventCode like 'NYJ%'
				--)

--------------------------2017 Sponsor----------------------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 14
						,	fts.dimplantypeid = 8



--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'B'
					 AND PriceCode.PC3 in ( 'S','T' )
					 AND Plancode = 'none'
					 AND EventCode like 'NYJ%'
					 )




--------------------------2017 Flight Deck----------------------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 11
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'Y'
					 AND fts.dimPlanid = 0
					 AND EventCode like 'NYJ%'
					 )

-------------------------2017 Fundraiser----------------------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 7
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'F'
					 AND PlanCode is NULL
					 AND EventCode like 'NYJ%'
					 )

					----2016
					--OR
					--(fts.DimSeasonId =--seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 = 'F'
					-- AND PriceCode.PC3 = 'C'
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )


--------------------------2017 Host Individual Game----------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 8
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 and ishost = 1
					 AND (PlanCode is NULL OR PlanCode = 'none')
					 AND EventCode like 'NYJ%'
					 )

					


--------------------------2017 Archtics Individual Game-------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 9
						,	fts.dimplantypeid = 8




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND Pricecode.PC1 like ( '[A-X]' )
					 AND (PriceCode.PC2 = 'I' or PriceCode.PC2 = '')
					 AND (PlanCode = 'none' or Plancode like'%FS')
					 AND EventCode like 'NYJ%'
					 )

                    --2016
					--OR
					--(fts.DimSeasonId = --seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 = 'I'
					-- AND PriceCode.PC3 = '1'
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )
					
					-- --2015
					-- OR
					--(fts.DimSeasonId = 1--seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 = 'I'
					-- AND PriceCode.PC3 = '1'
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )

					-- --2014
					-- OR
					--(fts.DimSeasonId = 1--seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode.PC2 = 'I'
					-- AND PriceCode.PC3 like ( '[1,2]' )
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )

					-- --2013
					-- OR
					--(fts.DimSeasonId = --seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode like '%IND'
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )

					-- --2012
					-- OR
					--(fts.DimSeasonId = --seasonID--
					-- AND Pricecode.PC1 like ( '[A-X]' )
					-- AND PriceCode like '%IND'
					-- AND PlanCode is NULL
					-- AND EventCode like 'NYJ%'
					-- )
---------------------------------2017 Flex--------------------- 

					UPDATE  fts
				    SET     fts.dimtickettypeid = 10
						,	fts.dimplantypeid = 7




--SELECT DISTINCT
--        DimPlan.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
--      , PlanCode
--      , EventCode


			FROM	#stgFactTicketSales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID
					INNER JOIN dbo.DimPlan ON DimPlan.DimPlanId = fts.DimPlanID
					INNER JOIN dbo.DimEvent ON DimEvent.DimEventID = fts.DimEventID

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND ((Pricecode.PC1 like ( '[A-X]' )
					 AND PriceCode.PC2 = 'E'
					 AND PlanCode is null
					 AND EventCode like 'NYJ%')
					 or (plancode = '3GMFLEX'))
					 )

					 ----2016



					 ----2015


					 ----2014
					 --OR
					 --( fts.DimSeasonId = 1--seasonID--
					 --  AND PriceCode like ( '[WE0,FE0,UE0,RE0,VE0]' )
					 --  AND EventCode like 'NYJ%'   
					 --And tickettype = Mastercard 3-game flex pack

      --               )
					 ----2013
					 --OR
					 --( fts.DimSeasonId = --seasonID--
					 --  AND PriceCode.PC2 = '3'
					 --  AND PriceCode.PC3 = 'G'
					 --  AND PlanCode like ( '[3PACK,MCFLEX]' )
					 --  AND EventCode like 'NYJ%'
					 --)



--------------------------------------------------------------------------------------------------------------------------------------------------
                                                             --SEAT TYPE RULES--
--------------------------------------------------------------------------------------------------------------------------------------------------

----------------2017 COACHES CLUB---------------
					UPDATE   fts
				    SET     fts.DimSeatTypeId = 1


--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'A'
					 )
    
	

----------------2017 Lower Prime Club---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 2

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'B'
					 )
----------------2017 MetLife 50 Club--------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 3
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'C'
					 )
----------------2017 CLUB PRIME--------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 4

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'D'
					 )

---------------Club Sideline		---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 5
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'E'
					 OR  PC1 = 'F'
					 )

---------------Club Goal Line		---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 6
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'G'
					 )

---------------Club Corner			---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 7
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2

			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'H'
					 )
---------------Green Room			---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 8

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'I'
					 )
---------------Lower Prime			---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 9

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'J'
					 )
---------------Lower Sideline Select---------------
					UPDATE    fts
				    SET     fts.dimseattypeid = 10

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'K'
					 )
---------------Lower Sideline		---------------
					UPDATE    fts
				    SET     fts.dimseattypeid = 11 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'L'
					 )
---------------Lower Goal Line		---------------
					UPDATE    fts
				    SET     fts.dimseattypeid = 12 
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'M'
					 )
---------------Lower TouchdownCorner---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 13 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'N'
					 )
---------------Lower Endzone Corner	---------------
					UPDATE    fts
				    SET     fts.dimseattypeid = 14 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'O'
					 )
---------------Lower Endzone		---------------
					UPDATE  fts
				    SET     fts.dimseattypeid = 15 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'P'
					 )
---------------Mezzanine Endzone A	---------------
					UPDATE  fts
				    SET     fts.dimseattypeid = 16 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'Q'
					 )
---------------Mezzanine Endzone B	---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 17 
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'R'
					 )
---------------Family Section 224B	---------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 18 
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'S'
					 )
---------------300-Level Prime--------------
					UPDATE fts
				    SET     fts.dimseattypeid = 19 

--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'T'
					 )
---------------300-Level Sideline--------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 20 
--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'U'
					 )
---------------300-Level Sideline/Corner--------------
					UPDATE  fts
				    SET     fts.dimseattypeid = 21 


--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'V'
					 )
---------------300-Level Endzone--------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 22 


--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'W'
					 )
---------------300-Level Corner/Endzone--------------
					UPDATE   fts
				    SET     fts.dimseattypeid = 23 


--SELECT DISTINCT
--        fts.DimSeasonId
--      , PriceCode.PriceCode
--      , PriceCode.PC1
--      , PriceCode.PC2
    


			FROM	#stgfactticketsales fts
					INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeID = fts.DimPriceCodeID AND fts.dimseasonID = pricecode.DimSeasonId
					
					

			WHERE   --2017

					(fts.DimSeasonId = 14
					 AND PC1 = 'X'
					 )



    END



























































GO
