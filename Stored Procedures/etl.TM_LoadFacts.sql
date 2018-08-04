SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[TM_LoadFacts]
AS
BEGIN


	SELECT DISTINCT tkt.id 
	INTO #DupeOdsIdLoser
	FROM (
		SELECT tkt.*, sl.Seat
		, ROW_NUMBER() OVER(PARTITION BY tkt.event_id, tkt.section_id, tkt.row_id, sl.Seat ORDER BY tkt.upd_datetime DESC, tkt.UpdateDate DESC) RowRank
		FROM   ods.TM_vw_Ticket tkt
		INNER JOIN dbo.Lkp_SeatList sl ON sl.Seat BETWEEN tkt.seat_num AND (tkt.seat_num + tkt.num_seats -1)
		WHERE tkt.ticket_status = 'A' AND tkt.order_num IS NOT null
	) tkt
	WHERE tkt.RowRank > 1


	delete tkt
	FROM ods.TM_Ticket tkt
	INNER JOIN #DupeOdsIdLoser d ON tkt.id = d.id
	WHERE tkt.ticket_status = 'A'




	DECLARE @BatchId INT = 0;
	DECLARE @ExecutionId uniqueidentifier = newid();
	DECLARE @ProcedureName nvarchar(255) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID);
	DECLARE @LogEventDefault NVARCHAR(255) = 'Processing Status'

	EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Fact Load', @LogEventDefault, 'Start', @ExecutionId

	DECLARE @LoadDate DATETIME = DATEADD(DAY, -1, GETDATE())

	EXEC etl.FactTicketSales_DeleteReturns

	EXEC [etl].[TM_LoadFactTicketSales] 0, @LoadDate

	--EXEC etl.TM_Ticket_Pacing
		
	EXEC [etl].[Load_FactInventory]

	EXEC [etl].[FactAttendance_UpdateAttendance]
	EXEC [etl].[FactAttendance_UpdateAttendanceAPI]
	EXEC [etl].[FactInventory_UpdateResoldSeats]

	/*EXEC [etl].[TM_ProcessMergedAccountTransactions]*/


	EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Fact Load', @LogEventDefault, 'Complete', @ExecutionId


END




















































GO
