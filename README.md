# CSTV - SQL Server Database

Database project for CSTV application.

## 📦 Structure

### Schemas
- Player
- Team (future)
- Tournament (future)


- ## Main Tables
- dbo.Country
- Player.Player
- Player.Profile
- Player.NativeName
- Player.AlternateID (future)
- Player.Roles (future)
- Player.PlayerRoles (future)
- Player.Country (future)
- Player.Pictures (future)
- Tournament.Tournament (future)

- ## 🔗 Relationships
  
- Player.Player 1:1 Player.Profile
- Player.Player 1:1 Player.NativeName
- Player.Player 1:N Player.AlternateID
- Player.Player 1:N Player.PlayerRoles
- Player.Player 1:N dbo.Country
- Player.Player 1:N Player.Pictures (future)
- Player.Player 1:N Tournament.Tournament
  
- Tournament.Tournament 1:N Player.Player
