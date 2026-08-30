CREATE DATABASE Movies
ON PRIMARY (
    NAME = Movies_data,
    FILENAME = 'C:\Movies\Movies_data.mdf',
    SIZE = 25MB,
    MAXSIZE = 40MB,
    FILEGROWTH = 1MB
)
LOG ON (
    NAME = Movies_log,
    FILENAME = 'C:\Movies\Movies_log.ldf',
    SIZE = 6MB,
    MAXSIZE = 8MB,
    FILEGROWTH = 1MB
);

ALTER DATABASE Movies
ADD FILE (
    NAME = Movies_data2,
    FILENAME = '/var/opt/mssql/data/Movies_data2.ndf',
    SIZE = 10MB
);
GO

ALTER DATABASE Movies
SET SINGLE_USER;

ALTER DATABASE Movies
SET RESTRICTED_USER;

ALTER DATABASE Movies
SET MULTI_USER;

ALTER DATABASE Movies
MODIFY FILE (
    NAME = Movies_data2,
    SIZE = 15MB
);
GO

ALTER DATABASE Movies
SET AUTO_SHRINK ON;
GO

DROP DATABASE Movies;