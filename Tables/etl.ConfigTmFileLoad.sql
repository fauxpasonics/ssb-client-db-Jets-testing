CREATE TABLE [etl].[ConfigTmFileLoad]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[FileQualifier] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileDelimiter] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StageTableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OdsTableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchiveTableName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OdsLoadProcedure] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IgnoreColumnList] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreateStageTable] [bit] NOT NULL,
[LoadArchiveTable] [bit] NOT NULL,
[DedupeStage] [bit] NOT NULL,
[DedupeSortPriority] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorOnStageTableSchemaDifference] [bit] NOT NULL,
[PartitionedKeyDelete] [bit] NOT NULL,
[PartitionedKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[UpdatedDate] [datetime] NULL
)
GO
ALTER TABLE [etl].[ConfigTmFileLoad] ADD CONSTRAINT [PK__ConfigTm__3214EC072C691896] PRIMARY KEY CLUSTERED  ([Id])
GO
