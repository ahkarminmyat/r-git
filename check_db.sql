# check database size
SELECT A.DatabaseName,SUM(A.Size) Size,SUM(A.SizeGB) SizeGB,SUM(A.SizeMB) SizeMB FROM
(SELECT DB_NAME(database_id) AS DatabaseName,
       Name AS Logical_Name,
       Physical_Name,
	   size Size,
	   (size * 8) / 1024 SizeMB,
       ((size * 8) / 1024) / 1024 SizeGB
FROM sys.master_files
WHERE database_id > 4) A
GROUP BY A.DatabaseName

# check db connection
SELECT * FROM sys.dm_exec_sessions