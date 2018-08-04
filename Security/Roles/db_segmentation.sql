CREATE ROLE [db_segmentation]
AUTHORIZATION [svcsegmentation]
GO
EXEC sp_addrolemember N'db_segmentation', N'svcsegmentation'
GO
GRANT CREATE TABLE TO [db_segmentation]
