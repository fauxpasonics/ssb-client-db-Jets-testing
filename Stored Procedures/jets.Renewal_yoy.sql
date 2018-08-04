SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--SELECT * FROM dbo.DimPlan WHERE PlanCode LIKE '17fs%'
--DROP TABLE #tenure

CREATE PROCEDURE [jets].[Renewal_yoy] @curr_year INT, @prev_year INT 

AS

IF @curr_year <= @prev_year
throw 50000,'Current Year cannot be before previous year',1


SELECT sth.SSID_acct_id, MIN(sth.SeasonYear) AS [Beginning_Year]
INTO #tenure
FROM
(
		SELECT fts.SSID_acct_id,
		dp.PlanCode,
		ds.SeasonYear
		FROM dbo.FactTicketSales fts
		INNER JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
		INNER JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets'
		WHERE ds.dimseasonid IN (14, 467, 480, 489, 506, 518, 524, 34)
		UNION
		SELECT fts.SSID_acct_id,
		dp.PlanCode,
		ds.SeasonYear
		FROM dbo.FactTicketSalesHistory fts
		INNER JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
		INNER JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets'
		WHERE ds.dimseasonid IN (14, 467, 480, 489, 506, 518, 524, 34)
)sth
GROUP BY sth.SSID_acct_id

IF @curr_year > 2016
Begin

SELECT 
DISTINCT
CASE WHEN Renewal_Owner.acct_id IS NULL THEN 'New' ELSE 'Renewal' END AS [Acct_type],
fts.SSID_acct_id,
tenure.Beginning_Year AS [First_STH_Year],
dp.PlanCode,
Renewal_Owner.plancode AS [prev_year_plancode],
ps.add_datetime AS [payment_plan_applied],
journal.PaidDate AS [First_payment],
journal_transfer.PaidDate AS [First Transfer],
ps.payment_plan_name,
CASE WHEN CONVERT(DATE,ps.add_datetime) <= CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,ps.add_datetime)
WHEN CONVERT(DATE,ps.add_datetime) > CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NOT NULL THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NOT NULL AND journal.PaidDate IS NULL THEN CONVERT(DATE,ps.add_datetime)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NULL THEN '1900-01-01'
END AS [Renewal Date],
s.SectionName,
s.RowName,
s.Seat,
fts.QtySeat AS [Total Seats],
SUM(fts.BlockPurchasePrice) BlockPurchasePrice,
SUM(fts.PaidAmount) PaidAmount
INTO #renewal_summary
FROM dbo.FactTicketSales fts
       INNER JOIN dbo.DimSeat s ON fts.DimSeatIdStart = s.DimSeatId
	   LEFT JOIN #tenure tenure ON tenure.SSID_acct_id = fts.SSID_acct_id
	   INNER JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId AND dp.DimPlanId = fts.DimPlanId AND  dp.DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
       INNER JOIN ( --#PercentPaid paid 
                      SELECT DISTINCT 
                              DimCustomerId
                             ,'CY' AS Season
							 ,DimPlanId
                      FROM dbo.FactTicketSales 
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @curr_year AND seasonname LIKE '%Season Tickets')
                                      AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
                             AND PaidAmount > 0
              ) paid
              ON  fts.DimCustomerId = paid.DimCustomerId
       INNER JOIN dbo.DimPriceCode DimPriceCode 
              ON  DimPriceCode.DimPriceCodeId = fts.DimPriceCodeId
       INNER JOIN dbo.DimSeason DimSeason 
              ON  DimSeason.DimSeasonId = fts.DimSeasonId AND dimseason.SeasonYear = @curr_year
       LEFT JOIN 
          (
          SELECT DISTINCT SSID_acct_id AS acct_id , dp.PlanCode, dp.DimPlanId 
          FROM dbo.FactTicketSaleshistory fts
		  INNER JOIN dbo.DimPlan dp ON fts.DimPlanId = dp.DimPlanId
		  INNER JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.dimseasonid
          WHERE dp.DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE CONVERT(INT,ds.SeasonYear) = @prev_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
          ) Renewal_Owner  --Tag all accounts with ST last year
              ON  Renewal_Owner.acct_id = fts.SSID_acct_id
       LEFT JOIN ( --#Journal Journal 
                      SELECT
                                      DISTINCT
                                                  order_num
                             ,MIN(posted_date) PaidDate
                      FROM ods.TM_Journal j
                      INNER JOIN dbo.FactTicketSales fts
                             ON  j.order_num = fts.OrderNum
                      WHERE 1 = 1
                             --AND j.type IN ( 'D', 'P', 'J', 'G', 'M')
                             AND [type] = 'P'
                      GROUP BY order_num
              ) Journal
              ON  Journal.order_num = fts.OrderNum
			    LEFT JOIN ( --#Journal Journal 
                      SELECT
                                      DISTINCT
                                                  order_num
                             ,MIN(posted_date) PaidDate
                      FROM ods.TM_Journal j
                      INNER JOIN dbo.FactTicketSales fts
                             ON  j.order_num = fts.OrderNum
                      WHERE 1 = 1
                             --AND j.type IN ( 'D', 'P', 'J', 'G', 'M')
                             AND [type] IN ('J', 'M')
                      GROUP BY order_num
              ) Journal_transfer
              ON  Journal_transfer.order_num = fts.OrderNum
                      LEFT OUTER JOIN 
                      ( 
                      SELECT CONVERT(INT, ROW_NUMBER() OVER(PARTITION BY acct_id ORDER BY add_datetime DESC)) AS [Row Number]
                     ,ps.payment_plan_name, ps.acct_id, ps.add_datetime
                      FROM ods.TM_PaySchedule ps
                      WHERE payment_plan_name IN (SELECT DISTINCT ps.payment_plan_name FROM ods.TM_PaySchedule WHERE TRY_CAST( LEFT(payment_plan_name,4) AS INT) = @curr_year)
                      ) -- all valid payment plan for 2018, adjust as needed
       ps ON fts.SSID_acct_id = ps.acct_id AND ps.[Row Number] = 1
	   GROUP BY 
	   CASE WHEN Renewal_Owner.acct_id IS NULL THEN 'New' ELSE 'Renewal' END,
fts.SSID_acct_id,
tenure.Beginning_Year,
dp.PlanCode,
Renewal_Owner.plancode,
ps.add_datetime,
journal.PaidDate,
journal_transfer.PaidDate,
ps.payment_plan_name,
CASE WHEN CONVERT(DATE,ps.add_datetime) <= CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,ps.add_datetime)
WHEN CONVERT(DATE,ps.add_datetime) > CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NOT NULL THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NOT NULL AND journal.PaidDate IS NULL THEN CONVERT(DATE,ps.add_datetime)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NULL THEN '1900-01-01'
END,
s.SectionName,
s.RowName,
s.Seat,
fts.QtySeat


	SELECT
	DISTINCT
		Acct_type,
           SSID_acct_id,
           First_STH_Year,
		   CASE WHEN Acct_type = 'New' AND First_STH_year < @curr_year THEN 'Returning Rookie'
		   WHEN  Acct_type = 'New' AND First_STH_year = @curr_year THEN 'New Rookie'
		   ELSE 'Renewal STH' END AS [acct_type_subcategory],
           PlanCode,
           prev_year_plancode,
           payment_plan_applied,
           First_payment,
           [First Transfer],
           payment_plan_name,
           [Renewal Date],
           SectionName,
           RowName,
           Seat,
           [Total Seats],
           SUM(BlockPurchasePrice) BlockPurchasePrice  ,
           SUM(PaidAmount) PaidAmount
		   INTO #all_renewals
		   FROM #renewal_summary
		   GROUP BY Acct_type,
           SSID_acct_id,
           First_STH_Year,
		   CASE WHEN Acct_type = 'New' AND First_STH_year < @curr_year THEN 'Returning Rookie'
		   WHEN  Acct_type = 'New' AND First_STH_year = @curr_year THEN 'New Rookie'
		   ELSE 'Renewal STH' END,
           PlanCode,
           prev_year_plancode,
           payment_plan_applied,
           First_payment,
           [First Transfer],
           payment_plan_name,
           [Renewal Date],
           SectionName,
           RowName,
           Seat,
           [Total Seats]
		   ORDER BY SSID_acct_id, SectionName, RowName, Seat


SELECT COUNT(DISTINCT py.DimCustomerId) AS [Previous Year STH], COUNT(DISTINCT cy.DimCustomerId) AS [Current Year STH],
CAST (COUNT(DISTINCT cy.DimCustomerId) AS DECIMAL(18,2))/ CAST (COUNT(DISTINCT py.DimCustomerId) AS DECIMAL(18,2)) AS [Renewal Percentage]
INTO #renewal_pct
FROM
(
		   SELECT DISTINCT 
                      DimCustomerId
                      FROM dbo.FactTicketSalesHistory 
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @prev_year AND seasonname LIKE '%Season Tickets')
                     AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @prev_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
) py
LEFT JOIN 
(
SELECT DISTINCT 
                      DimCustomerId
                      FROM dbo.FactTicketSales
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @curr_year AND seasonname LIKE '%Season Tickets')
                     AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')

) cy ON py.DimCustomerId = cy.DimCustomerId


			SELECT COUNT(DISTINCT SSID_acct_id) AS [Total_STH], SUM([Total Seats]) AS [Total Seats], SUM(BlockPurchasePrice) AS [Total Revenue] INTO #renewal_full_summary FROM #all_renewals

			SELECT Total_STH,
                   [Total Seats],
                   [Total Revenue],
				   [Renewal Percentage]
				    FROM #renewal_full_summary CROSS JOIN #renewal_pct

		   SELECT * FROM #all_renewals

END

ELSE 

BEGIN


SELECT 
DISTINCT
CASE WHEN Renewal_Owner.acct_id IS NULL THEN 'New' ELSE 'Renewal' END AS [Acct_type],
fts.SSID_acct_id,
tenure.Beginning_Year AS [First_STH_Year],
dp.PlanCode,
Renewal_Owner.plancode AS [prev_year_plancode],
ps.add_datetime AS [payment_plan_applied],
journal.PaidDate AS [First_payment],
journal_transfer.PaidDate AS [First Transfer],
ps.payment_plan_name,
CASE WHEN CONVERT(DATE,ps.add_datetime) <= CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,ps.add_datetime)
WHEN CONVERT(DATE,ps.add_datetime) > CONVERT(DATE,journal.PaidDate) THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NOT NULL THEN CONVERT(DATE,journal.PaidDate)
WHEN ps.add_datetime IS NOT NULL AND journal.PaidDate IS NULL THEN CONVERT(DATE,ps.add_datetime)
WHEN ps.add_datetime IS NULL AND journal.PaidDate IS NULL THEN '1900-01-01'
END AS [Renewal Date],
de.EventName,
s.SectionName,
s.RowName,
s.Seat,
fts.QtySeat AS [Total Seats],
fts.DimEventId,
fts.BlockPurchasePrice,
fts.PaidAmount
INTO #renewal_summary_hist
FROM dbo.FactTicketSalesHistory fts
       INNER JOIN dbo.DimSeat s ON fts.DimSeatIdStart = s.DimSeatId
	   INNER JOIN dbo.DimEvent de ON de.DimEventId = fts.DimEventId AND de.DimEventId > 0
	   LEFT JOIN #tenure tenure ON tenure.SSID_acct_id = fts.SSID_acct_id
	   INNER JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId AND dp.DimPlanId = fts.DimPlanId AND  dp.DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
       INNER JOIN ( --#PercentPaid paid 
                      SELECT DISTINCT 
                              DimCustomerId
                             ,'CY' AS Season
							 ,DimPlanId
                      FROM dbo.FactTicketSalesHistory 
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @curr_year AND seasonname LIKE '%Season Tickets')
                                      AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanCode LIKE '%FS%')
                             AND PaidAmount > 0
              ) paid
              ON  fts.DimCustomerId = paid.DimCustomerId
       INNER JOIN dbo.DimPriceCode DimPriceCode 
              ON  DimPriceCode.DimPriceCodeId = fts.DimPriceCodeId
       INNER JOIN dbo.DimSeason DimSeason 
              ON  DimSeason.DimSeasonId = fts.DimSeasonId AND dimseason.SeasonYear = @curr_year
       LEFT JOIN 
          (
          SELECT DISTINCT SSID_acct_id AS acct_id , dp.PlanCode, dp.DimPlanId,
		  s.SectionName, s.RowName, s.Seat
          FROM dbo.FactTicketSaleshistory fts
		  INNER JOIN dbo.DimPlan dp ON fts.DimPlanId = dp.DimPlanId AND dp.IsDeleted <> 1
		  INNER JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.dimseasonid
		  INNER JOIN dbo.DimSeat s ON fts.DimSeatIdStart = s.DimSeatId
          WHERE dp.DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE CONVERT(INT,ds.SeasonYear) = @prev_year AND dp.PlanClass = 'FS'AND dp.PlanCode LIKE '%FS%') 
		  --AND fts.SSID_acct_id = 10328922
          ) Renewal_Owner  --Tag all accounts with ST last year
              ON  Renewal_Owner.acct_id = fts.SSID_acct_id
			  --AND Renewal_Owner.RowName = s.RowName
			  --AND Renewal_Owner.SectionName = s.SectionName
			  --AND Renewal_Owner.Seat = s.Seat
       LEFT JOIN ( --#Journal Journal 
                      SELECT
                                      DISTINCT
                                                  order_num
                             ,MIN(posted_date) PaidDate
                      FROM ods.TM_Journal j
                      INNER JOIN dbo.FactTicketSalesHistory fts
                             ON  j.order_num = fts.OrderNum
                      WHERE 1 = 1
                             --AND j.type IN ( 'D', 'P', 'J', 'G', 'M')
                             AND [type] = 'P'
                      GROUP BY order_num
              ) Journal
              ON  Journal.order_num = fts.OrderNum
			    LEFT JOIN ( --#Journal Journal 
                      SELECT
                                      DISTINCT
                                                  order_num
                             ,MIN(posted_date) PaidDate
                      FROM ods.TM_Journal j
                      INNER JOIN dbo.FactTicketSalesHistory fts
                             ON  j.order_num = fts.OrderNum
                      WHERE 1 = 1
                             --AND j.type IN ( 'D', 'P', 'J', 'G', 'M')
                             AND [type] IN ('J', 'M')
                      GROUP BY order_num
              ) Journal_transfer
              ON  Journal_transfer.order_num = fts.OrderNum
                      LEFT OUTER JOIN 
                      ( 
                      SELECT CONVERT(INT, ROW_NUMBER() OVER(PARTITION BY acct_id ORDER BY add_datetime DESC)) AS [Row Number]
                     ,ps.payment_plan_name, ps.acct_id, ps.add_datetime
                      FROM ods.TM_PaySchedule ps
                      WHERE payment_plan_name IN (SELECT DISTINCT payment_plan_name FROM ods.TM_PaySchedule WHERE TRY_CAST( LEFT(payment_plan_name,4) AS INT) = @curr_year)
                      ) -- all valid payment plan for 2018, adjust as needed
       ps ON fts.SSID_acct_id = ps.acct_id AND ps.[Row Number] = 1

SELECT
	DISTINCT
		Acct_type,
           SSID_acct_id,
           First_STH_Year,
		   CASE WHEN Acct_type = 'New' AND First_STH_year < @curr_year THEN 'Returning Rookie'
		   WHEN  Acct_type = 'New' AND First_STH_year = @curr_year THEN 'New Rookie'
		   ELSE 'Renewal STH' END AS [acct_type_subcategory],
           PlanCode,
           prev_year_plancode,
           payment_plan_applied,
           First_payment,
           [First Transfer],
           payment_plan_name,
           [Renewal Date],
           SectionName,
           RowName,
           Seat,
           [Total Seats],
           SUM(BlockPurchasePrice) BlockPurchasePrice  ,
           SUM(PaidAmount) PaidAmount
		   INTO #all_renewals_hist
		   FROM #renewal_summary_hist
		   GROUP BY Acct_type,
           SSID_acct_id,
           First_STH_Year,
		   CASE WHEN Acct_type = 'New' AND First_STH_year < @curr_year THEN 'Returning Rookie'
		   WHEN  Acct_type = 'New' AND First_STH_year = @curr_year THEN 'New Rookie'
		   ELSE 'Renewal STH' END,
           PlanCode,
           prev_year_plancode,
           payment_plan_applied,
           First_payment,
           [First Transfer],
           payment_plan_name,
           [Renewal Date],
           SectionName,
           RowName,
           Seat,
           [Total Seats]
		   ORDER BY SSID_acct_id, SectionName, RowName, Seat



SELECT COUNT(DISTINCT py.DimCustomerId) AS [Previous Year STH], COUNT(DISTINCT cy.DimCustomerId) AS [Current Year STH],
CAST (COUNT(DISTINCT cy.DimCustomerId) AS DECIMAL(18,2))/ CAST (COUNT(DISTINCT py.DimCustomerId) AS DECIMAL(18,2)) AS [Renewal Percentage]
INTO #renewal_pct_hist
FROM
(
		   SELECT DISTINCT 
                      DimCustomerId
                      FROM dbo.FactTicketSalesHistory 
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @prev_year AND seasonname LIKE '%Season Tickets')
                     AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @prev_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')
) py
LEFT JOIN 
(
SELECT DISTINCT 
                      DimCustomerId
                      FROM dbo.FactTicketSalesHistory
                      WHERE DimSeasonId IN (SELECT DISTINCT dimseasonid FROM dbo.DimSeason WHERE CONVERT(INT,seasonyear) = @curr_year AND seasonname LIKE '%Season Tickets')
                     AND DimPlanId IN (SELECT DISTINCT dimplanid FROM dbo.DimPlan dp INNER JOIN dbo.DimSeason ds ON dp.DimSeasonid = ds.DimSeasonId WHERE ds.SeasonYear = @curr_year AND dp.PlanClass = 'FS' AND dp.PlanDesc LIKE 'Full Season Tickets')

) cy ON py.DimCustomerId = cy.DimCustomerId

			SELECT COUNT(DISTINCT SSID_acct_id) AS [Total_STH], SUM([Total Seats]) AS [Total Seats], SUM(BlockPurchasePrice) AS [Total Revenue] INTO #renewal_full_summary_hist FROM #all_renewals_hist

			SELECT Total_STH,
                   [Total Seats],
                   [Total Revenue],
				   [Renewal Percentage]
				    FROM #renewal_full_summary CROSS JOIN #renewal_pct

		   SELECT * FROM #all_renewals

END



GO
