CREATE TABLE [etl].[TM_ArchiveLoadTables]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ArcFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileRowCount] [int] NULL,
[TableRowCount] [int] NULL,
[ArcYear] [int] NULL,
[DataSet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [etl].[TM_ArchiveLoadTables] ADD CONSTRAINT [PK__TM_Archi__C4EA2445F0A21F69] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
