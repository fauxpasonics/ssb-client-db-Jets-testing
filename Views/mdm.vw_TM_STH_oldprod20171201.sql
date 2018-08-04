SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE VIEW [mdm].[vw_TM_STH_oldprod20171201] AS
(
SELECT dc.dimcustomerid, STH, sthmd.MaxSTHPurchaseDate, mud.MaxUpdatedDate, mincd.MinCreatedDate, texmt.TEXMaxTransaction,
			  Grp, dc.accountid, grpmud.GRPMaxUpdatedDate,mopd.MaxOverallPurchaseDate, sthmud.STHMaxUpdatedDate
FROM dbo.dimcustomer dc
LEFT JOIN (
			SELECT DISTINCT dimcustomerid, 1 AS 'STH' FROM dbo.factticketsales a
			LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
			WHERE a.DimTicketTypeId IN (1,2)
		   ) sth ON dc.dimcustomerid = sth.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(dd.CalDate) AS 'MaxSTHPurchaseDate' FROM dbo.factticketsales a
			LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
			WHERE a.DimTicketTypeId IN (1,2)
			GROUP BY a.DimCustomerId
		   ) sthmd ON dc.dimcustomerid = sthmd.dimcustomerid
--LEFT JOIN (
--	SELECT DISTINCT dimcustomerid, 1 AS 'MPH' FROM dbo.factticketsales a
--	LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
--	WHERE a.DimTicketTypeId IN (4,5,6,10,11) AND dd.CalDate > (GETDATE()-730)) mph ON dc.dimcustomerid = mph.dimcustomerid
LEFT JOIN (
			SELECT dimcustomerid, MAX(a.UpdatedDate) AS 'MaxUpdatedDate' 
			FROM dbo.DimCustomer a
			GROUP BY a.DimCustomerId
		   ) mud ON dc.dimcustomerid = mud.dimcustomerid

LEFT JOIN (
			SELECT fts.dimcustomerid, MAX(a.UpdatedDate) AS 'STHMaxUpdatedDate' 
			FROM dbo.DimCustomer a
			JOIN dbo.FactTicketSales fts ON a.DimCustomerId = fts.DimCustomerId
			WHERE fts.DimTicketTypeId IN (1,2)
			GROUP BY fts.DimCustomerId
		   ) sthmud ON dc.dimcustomerid = sthmud.dimcustomerid


LEFT JOIN (
			SELECT fts.dimcustomerid, MAX(a.UpdatedDate) AS 'GRPMaxUpdatedDate' 
			FROM dbo.DimCustomer a
			JOIN dbo.FactTicketSales fts ON a.DimCustomerId = fts.DimCustomerId
			WHERE fts.DimTicketTypeId IN (3,4,5)
			GROUP BY fts.DimCustomerId
		   ) grpmud ON dc.dimcustomerid = grpmud.dimcustomerid

LEFT JOIN (
	SELECT dimcustomerid, MIN(a.CreatedDate) AS 'MinCreatedDate' 
	FROM dbo.DimCustomer a
	GROUP BY a.DimCustomerId
		   ) mincd ON dc.dimcustomerid = mincd.dimcustomerid

LEFT JOIN (
	SELECT dimcustomerid, MAX(dd.CalDate) AS 'MaxOverallPurchaseDate' FROM dbo.factticketsales a
	LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
	GROUP BY a.DimCustomerId
		   ) mopd  ON dc.dimcustomerid = mopd.dimcustomerid
LEFT JOIN (
    SELECT dc.dimcustomerid, MAX(tex.add_datetime) 'TEXMaxTransaction'
    FROM Jets.ods.TM_Tex tex WITH (NOLOCK)
	LEFT JOIN Jets.dbo.dimcustomer dc WITH (NOLOCK) ON tex.assoc_acct_id = dc.accountid AND dc.customertype = 'Primary' AND dc.sourcesystem = 'TM'
    WHERE tex.activity = 'ES'
	GROUP BY dc.dimcustomerid
		   ) texmt ON dc.dimcustomerid = texmt.dimcustomerid




--LEFT JOIN (
--	SELECT DISTINCT dimcustomerid, 1 AS 'Suite' FROM dbo.factticketsales a
--	LEFT JOIN dbo.dimseat ds ON a.DimSeatIdStart = ds.DimSeatID
--	LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
--	WHERE ds.Config_Location LIKE '%Suite%' AND dd.CalDate >= (GETDATE()-730)) suite ON dc.dimcustomerid = suite.dimcustomerid
LEFT JOIN (
	SELECT DISTINCT dimcustomerid, 1 AS 'Grp' FROM dbo.factticketsales a
	LEFT JOIN dbo.dimdate dd ON a.DimDateId_OrigSale = dd.DimDateId
	WHERE a.DimTicketTypeId IN (3,4,5)) grp ON dc.dimcustomerid = grp.dimcustomerid




--LEFT JOIN (
--	SELECT dimcustomerid, MAX(maxtransdate) maxPurchaseDate 
--	FROM (
--		SELECT f.DimCustomerID, MAX(dd.CalDate) MaxTransDate , 'Predators-TM' Team
--		--Select * 
--		FROM dbo.FactTicketSales f WITH(NOLOCK)
--		INNER JOIN dbo.DimDate  dd WITH(NOLOCK) ON dd.DimDateId = f.DimDateId
--		WHERE dd.CalDate >= (GETDATE() - 730)
--		GROUP BY f.[DimCustomerId]

--		UNION ALL 

--		SELECT f.DimCustomerID, MAX(dd.CalDate) MaxTransDate , 'Predators-TM' Team
--		--Select * 
--		FROM dbo.FactTicketSaleshistory f WITH(NOLOCK)
--		INNER JOIN dbo.DimDate  dd WITH(NOLOCK) ON dd.DimDateId = f.DimDateId
--		WHERE dd.CalDate >= (GETDATE() - 730)
--		GROUP BY f.[DimCustomerId]

--		UNION ALL
--		SELECT dc.dimcustomerid, MAX(tex.add_datetime) MaxTransDate, 'Predators-TM' Team
--		FROM Predators.ods.TM_Tex tex WITH (NOLOCK)
--		LEFT JOIN Predators.dbo.dimcustomer dc WITH (NOLOCK) ON tex.assoc_acct_id = dc.accountid AND dc.customertype = 'Primary' AND dc.sourcesystem = 'TM'
--		GROUP BY dc.dimcustomerid
--		) x
--		GROUP BY x.dimcustomerid, x.team
--	) purchasedate ON purchasedate.DimCustomerId = dc.DimCustomerId







)










GO
