/*
	Date 25 Feb 2026
*/

-- 1.4.0 - CREATE TABLE Player.AlternateID
-- DEPENDENCIES: Player.Player
CREATE TABLE Player.AlternateID
(
    Id INT IDENTITY PRIMARY KEY,
    PlayerId INT NOT NULL,
    Nickname NVARCHAR(40) NOT NULL,

    FOREIGN KEY (PlayerId) REFERENCES Player.Player(Id)
);

INSERT INTO Player.AlternateID (PlayerId, Nickname)
VALUES
	(1, 'Professor'), (1, 'Bad Fallen'), (1, 'Wallen'), -- OK
	(4, 'VACO'),
	(7, 'Boltalha'),
	(8, 'Vilão'),
	(9, 'Jaceré'),
	(12, 'Rei do bracinho'),
	(13, 'Cachorro'),
	(15, 'Vini linguição'), (15, 'Tubarão linguiça'),
	(19, 'Baby GOAT'),
	(32, 'de AK nao troca'),
	(44, 'King of Reddit'),
	(46, 'Content King'),
	(50, 'The Smoke Criminal'), (50, 'Tchutchukinha2K'), 
	(54, 'Señor Vac'),
	(56, 'Bronha'),
	(67, 'EliJão da Massa'),
	(68, 'Bicho Preguiça'),
	(72, 'Jogo deitado mesmo'),
	(73, 'The Chosen One'), (73, 'Zinedine ZywOo'),
	(75, 'Atleta da bala'),
	(79, 'Baby GOAT'),
	(80, 'Primo do huNter-'), (80, 'Nikola'), (80, 'NiKoNiKoNiKo'),
	(83, 'Lelec'),
	(86, 'sadboy'),
	(87, 'Primo do NiKo'),
	(88, 'Mago'),
	(107, 'Clutch Minister'),
	(101, 'Jabbi The Killer'),
	(102, 'Sushi'),
	(107, 'Clutch Minister'), (107, 'Xyfodase'),
	(111, 'Batman'),
	(138, 'BaiterF'),
	(156, 'Joel o cruel'),
	(158, 'Biskela'),
	(163, 'Karrigan russo'),
	(163, 'Newba pra karai')