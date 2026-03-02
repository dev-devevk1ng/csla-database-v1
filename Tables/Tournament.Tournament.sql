/*
	2 Mar 2026
*/

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