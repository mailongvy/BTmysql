CREATE DATABASE NVDB
ON (
	NAME= 'nvdb_data',
	FILENAME = 'C:\Users\Admin\Desktop\MYSQL\Create_table\NVDB\nvdb.mdf',
	SIZE = 100MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 100MB
)

LOG ON (
	NAME= 'nvdb_log',
	FILENAME = 'C:\Users\Admin\Desktop\MYSQL\Create_table\NVDB\nvdb.ldf',
	SIZE = 50MB,
	MAXSIZE = 250MB,
	FILEGROWTH = 100MB
)