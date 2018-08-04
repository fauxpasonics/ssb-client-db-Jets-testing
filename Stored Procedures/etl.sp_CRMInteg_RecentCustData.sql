SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Rerun
CREATE PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS
    TRUNCATE TABLE etl.CRMProcess_RecentCustData

    DECLARE @Client VARCHAR(50)
    SET @Client = 'Jets' --updateme


    SELECT   x.DimCustomerId
           , MAX(x.maxtransdate) maxtransdate
           , x.team
    INTO     #tmpTicketSales
    FROM     (   SELECT   dc.DimCustomerId
                        , MAX(fts.SSCreatedDate) maxtransdate
                        , @Client AS team
                 FROM     dbo.DimCustomer dc ( NOLOCK )
                          INNER JOIN dbo.FactTicketSales fts ON dc.DimCustomerId = fts.DimCustomerId
                                                                AND dc.SourceSystem = 'TM'
                 WHERE    dc.CustomerType = 'Primary'
                          AND YEAR(fts.SSCreatedDate) >= 2014
                 GROUP BY dc.DimCustomerId
                 UNION
                 SELECT   dc.DimCustomerId
                        , MAX(n.upd_Datetime) maxtransdate
                        , @Client AS team
                 FROM     dbo.DimCustomer dc
                          INNER JOIN ods.TM_Note n ON n.acct_id = dc.AccountId
                 WHERE    dc.CustomerType = 'Primary'
                          AND CONVERT(DATE, n.upd_Datetime) >= '1/1/16'
                 GROUP BY dc.DimCustomerId

                 UNION ALL

                 SELECT   dc.dimcustomerid
                        , MAX(tex.add_datetime) MaxTransDate
                        , @Client Team
                 FROM     Jets.ods.TM_Tex tex WITH ( NOLOCK )
                          LEFT JOIN Jets.dbo.dimcustomer dc WITH ( NOLOCK ) ON tex.assoc_acct_id = dc.accountid
                                                                                AND dc.customertype = 'Primary'
                                                                                AND dc.sourcesystem = 'TM'
                 WHERE    tex.add_datetime >= DATEADD(YEAR, -2, GETDATE() + 2)
						  AND tex.activity = 'ES'
						  AND dc.AddressPrimaryState IN ('NY', 'NJ', 'CT', 'PA')
                 GROUP BY dc.dimcustomerid
             ) x
    GROUP BY x.DimCustomerId
           , x.team



    INSERT INTO etl.CRMProcess_RecentCustData (   SSID
                                                , MaxTransDate
                                                , Team
                                              )
                SELECT b.SSID
                     , a.maxtransdate
                     , a.team
                FROM   [#tmpTicketSales] a
                       INNER JOIN dbo.vwDimCustomer_ModAcctId b ON b.DimCustomerId = a.DimCustomerId




GO
