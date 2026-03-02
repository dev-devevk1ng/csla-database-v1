/*
	Date 2 Mar 2026
*/

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

SELECT * FROM Player.Country

INSERT INTO Player.Country (PlayerId, CountryCode)
VALUES
    (1, 'BR'),
    (2, 'BR'),
    (3, 'BR'),
    (4, 'BR'),
    (5, 'BR') --