/*
    Date 25 Feb 2026
*/


-- 1.5.0 - CREATE TABLE Player.Roles | 1 Mar 2026
-- DEPENDENCIES: Player.Player
CREATE TABLE Player.Roles
(
    Id INT IDENTITY PRIMARY KEY,
    Roles NVARCHAR(30) NOT NULL,
);

INSERT INTO Player.Roles (Roles) VALUES
('Riffler'), ('Awper'), ('Opener'), ('Anchor'), ('IGL'), ('Closer'),
('Playmaker'), ('Lurker');