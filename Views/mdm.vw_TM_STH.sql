SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [mdm].[vw_TM_STH] AS (


SELECT dc.dimcustomerid, STH, sth.MaxSTHPurchaseDate, mud.MaxUpdatedDate, mud.MinCreatedDate, texmt.TEXMaxTransaction,
			  grp.Grp, dc.accountid, grp.GRPMaxUpdatedDate,mopd.MaxOverallPurchaseDate, sthmud.STHMaxUpdatedDate
FROM dbo.dimcustomer dc


LEFT JOIN (
			SELECT a.dimcustomerid, 1 AS 'STH', MAX(dd.CalDate) AS 'MaxSTHPurchaseDate'
			FROM dbo.factticketsales a (nolock)
			LEFT JOIN dbo.dimdate dd (nolock)
				ON a.DimDateId_OrigSale = dd.DimDateId
			WHERE a.DimTicketTypeId IN (1,2)
			GROUP BY a.dimcustomerid
		   ) sth
	ON dc.dimcustomerid = sth.dimcustomerid

/*	DCH 2017-12-01:		combined these two derived tables above 
LEFT JOIN (
			SELECT a.dimcustomerid, 1 AS 'STH'
			FROM dbo.factticketsales a (nolock)
			LEFT JOIN dbo.dimdate dd (nolock)
				ON a.DimDateId_OrigSale = dd.DimDateId
			WHERE a.DimTicketTypeId IN (1,2)
			GROUP BY a.dimcustomerid
		   ) sth
	ON dc.dimcustomerid = sth.dimcustomerid
LEFT JOIN (
			SELECT a.dimcustomerid, MAX(dd.CalDate) AS 'MaxSTHPurchaseDate'
			FROM dbo.factticketsales a (nolock)
			LEFT JOIN dbo.dimdate dd (nolock)
				ON a.DimDateId_OrigSale = dd.DimDateId
			WHERE a.DimTicketTypeId IN (1,2)
			GROUP BY a.DimCustomerId
		   ) sthmd
	ON dc.dimcustomerid = sthmd.dimcustomerid
*/


LEFT JOIN (
			SELECT a.dimcustomerid, MAX(a.UpdatedDate) AS 'MaxUpdatedDate', MIN(a.CreatedDate) AS 'MinCreatedDate'  
			FROM dbo.DimCustomer a (nolock)
			GROUP BY a.DimCustomerId
		   ) mud
	ON dc.dimcustomerid = mud.dimcustomerid

/*	DCH 2017-12-01:		combined these two derived tables above 
LEFT JOIN (
			SELECT a.dimcustomerid, MAX(a.UpdatedDate) AS 'MaxUpdatedDate'
			FROM dbo.DimCustomer a (nolock)
			GROUP BY a.DimCustomerId
		   ) mud
	ON dc.dimcustomerid = mud.dimcustomerid
LEFT JOIN (
			SELECT a.dimcustomerid, MIN(a.CreatedDate) AS 'MinCreatedDate' 
			FROM dbo.DimCustomer a (nolock)
			GROUP BY a.DimCustomerId
		   ) mincd
	ON dc.dimcustomerid = mincd.dimcustomerid
*/


LEFT JOIN (
			SELECT fts.dimcustomerid, MAX(a.UpdatedDate) AS 'STHMaxUpdatedDate' 
			FROM dbo.DimCustomer a (nolock)
			JOIN dbo.FactTicketSales fts (nolock)
				ON a.DimCustomerId = fts.DimCustomerId
			WHERE fts.DimTicketTypeId IN (1,2)
			GROUP BY fts.DimCustomerId
		   ) sthmud
	ON dc.dimcustomerid = sthmud.dimcustomerid


LEFT JOIN (
			SELECT fts.dimcustomerid, 1 AS 'Grp', MAX(a.UpdatedDate) AS 'GRPMaxUpdatedDate' 
			FROM dbo.DimCustomer a (nolock)
			JOIN dbo.FactTicketSales fts (nolock)
				ON a.DimCustomerId = fts.DimCustomerId
			WHERE fts.DimTicketTypeId IN (3,4,5)
			GROUP BY fts.DimCustomerId
		   ) grp
	ON dc.dimcustomerid = grp.dimcustomerid


LEFT JOIN (
			SELECT a.dimcustomerid, MAX(dd.CalDate) AS 'MaxOverallPurchaseDate'
			FROM dbo.factticketsales a (nolock)
			LEFT JOIN dbo.dimdate dd (nolock)
				ON a.DimDateId_OrigSale = dd.DimDateId
			GROUP BY a.DimCustomerId
		   ) mopd
	ON dc.dimcustomerid = mopd.dimcustomerid


LEFT JOIN (
		    SELECT dc.dimcustomerid, MAX(tex.add_datetime) 'TEXMaxTransaction'
		    FROM ods.TM_Tex tex (nolock)
			LEFT JOIN Jets.dbo.dimcustomer dc (nolock)
				ON tex.assoc_acct_id = dc.accountid
				AND dc.customertype = 'Primary'
				AND dc.sourcesystem = 'TM'
		    WHERE tex.activity = 'ES'
			GROUP BY dc.dimcustomerid
		   ) texmt
	ON dc.dimcustomerid = texmt.dimcustomerid


)











GO
