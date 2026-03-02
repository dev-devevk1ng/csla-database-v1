/* 
	Date 25 Feb 2026

    ESL Pro League S23 Stage 1
        Legacy vs NiP, Gaimin Gladiators vs G2, PaiN vs PARIVISION, Gaimin Gladiators vs Liquid
        Legacy vs G2,
    Game of Thrones (3rd) S1 at
    Gaules - Amoung Us Ep.1 at Ep.11
*/

CREATE DATABASE CSTV_SQLServer_v1 ON PRIMARY (
NAME = 'CSTV-SQLServer-v1-Data',
FILENAME = 'C:\Development\myProjects\myDatabase\CSTV\CSTV-SQLServer-v1\CSTV-SQLServer-v1.mdf',
SIZE = 50MB,
MAXSIZE = 500MB,
FILEGROWTH = 10MB
)
LOG ON (
    NAME = 'CSTV-SQLServer-v1-Log',
    FILENAME = 'C:\Development\myProjects\myDatabase\CSTV\CSTV-SQLServer-v1\CSTV-SQLServer-v1.ldf',
    SIZE = 25MB,
    MAXSIZE = 250MB,
    FILEGROWTH = 5MB
);
GO

-- 0.1.0
CREATE TABLE dbo.Country
(
    Code CHAR(2) PRIMARY KEY,  -- ISO 3166 Alpha-2
    Name NVARCHAR(100) NOT NULL
);
SELECT * FROM dbo.Country

-- 1.0.0 - CREATE SCHEMA Player 
CREATE SCHEMA Player

-- 1.1.0 - CREATE TABLE Player.Player
CREATE TABLE Player.Player 
(
    Id INT IDENTITY PRIMARY KEY,
    Nickname NVARCHAR(40) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
SELECT * FROM Player.Player 

-- 1.2.0 - CREATE TABLE Player.Profile 
CREATE TABLE Player.Profile
(
    Id INT IDENTITY PRIMARY KEY,
    PlayerId INT NOT NULL UNIQUE,

    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    Born DATE NOT NULL,

    Status NVARCHAR(15) NOT NULL,
    ApproxTotalWinnings DECIMAL(10, 2) NOT NULL,
    YearCareerStart INT NOT NULL,
    YearCareerEnd INT NULL,

    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id),
    CONSTRAINT CHK_PlayerStatus CHECK (Status IN ('Active','Benched','Retired')),
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
)
SELECT * FROM Player.Profile

-- 1.3.0 - CREATE TABLE Player.NativeName
-- DEPENDENCIES: Player.Player
CREATE TABLE Player.NativeName
(
    PlayerId INT PRIMARY KEY NOT NULL,
    NativeFirstName NVARCHAR(30),
    NativeLastName NVARCHAR(30),

    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id),
)

-- 1.4.0 - CREATE TABLE Player.AlternateID
-- DEPENDENCIES: Player.Player
CREATE TABLE Player.AlternateID
(
    Id INT IDENTITY PRIMARY KEY,
    PlayerId INT NOT NULL,
    Nickname NVARCHAR(40) NOT NULL,

    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id)
);
DROP TABLE Player.AlternateID

-- 1.5.0 - CREATE TABLE Player.Roles | 1 Mar 2026
-- DEPENDENCIES: none
CREATE TABLE Player.Roles
(
    Id INT IDENTITY PRIMARY KEY,
    Roles NVARCHAR(30) NOT NULL,
);
DROP TABLE Player.Roles

-- 1.6.0 - CREATE TABLE Player.PlayerRoles | 1 Mar 2026 OK
-- DEPENDENCIES: Player.Player, Player.Roles
CREATE TABLE Player.PlayerRoles
(
    RoleId INT NOT NULL,
    PlayerId INT NOT NULL,

    PRIMARY KEY (PlayerId, RoleId),

    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id),
    FOREIGN KEY (RoleId) REFERENCES Player.Roles(Id)
);
DROP TABLE Player.PlayerRoles

-- 1.7.0 - CREATE TABLE Player.Nationality
-- DEPENDENCIES: Player.Player, dbo.Country
CREATE TABLE Player.Country
(
    PlayerId INT NOT NULL,
    CountryCode CHAR(2) NOT NULL,

    PRIMARY KEY (PlayerId, CountryCode),

    FOREIGN KEY (PlayerId) 
        REFERENCES Player.Player(Id),

    FOREIGN KEY (CountryCode) 
        REFERENCES dbo.Country(Code)
);

-- 1.8.0 - CREATE TABLE Player.Tournaments

-- 1.9.0 - CREATE TABLE Player.Tournaments

-- 1.10.0 - CREATE TABLE Player.Favorites
-- Admin Fav

-- 1.11.0 - CREATE TABLE Player.Medals
-- Roockie, Starplayer, ...

-- 1.12.0 - CREATE TABLE Player.MainPicture
CREATE TABLE Player.MainPicture
(
    Id INT IDENTITY PRIMARY KEY,
    PlayerId INT NOT NULL,
    MainPictureUrl NVARCHAR(750),


    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id)
)
DROP TABLE Player.MainPicture

-- 1.13.0 - CREATE TABLE Player.Achievements

-- 2.0.0 - CREATE SCHEMA Team
CREATE SCHEMA Team
GO

-- 2.1.0 - CREATE TABLE Team.Team
CREATE TABLE Team.Team 
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(40) NOT NULL,   
    ApproxTotalWinnings DECIMAL(10, 2) NULL,
    LocationISO CHAR(2) NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
);

-- 3.0.0 - CREATE SCHEMA Tournament;
CREATE SCHEMA Tournament;

-- 3.1.0 - CREATE TABLE Tournament.Tournament
CREATE TABLE Tournament.Tournament
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Game INT NOT NULL,
    LocationCountryCode CHAR(2) NULL,
    PrizePool DECIMAL(18,2) NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Teams TINYINT NOT NULL,
    Tier NVARCHAR(20) NULL,      -- S, A, B
    IsOnline BIT NOT NULL DEFAULT 0,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (LocationCountryCode)
        REFERENCES dbo.Country(Code)
);
