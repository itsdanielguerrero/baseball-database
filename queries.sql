UPDATE teams SET abbreviation = 'WAS' WHERE abbreviation = 'WSH';

SELECT startTime, homeScore, awayScore FROM games WHERE startTime >= '2019-06-06 00:00:00' AND startTime <= '2019-06-06 17:00:00';

SELECT * FROM teams WHERE league = 'NL';

/* List all the players for the Red Sox (Full Name, Position, Hits, Throws, Team Abbreviation) */
SELECT CONCAT(players.firstName, ' ', players.lastName) AS fullName, 
		players.position, 
		players.hits, 
		players.throws, 
		teams.abbreviation
FROM players 
		JOIN teams 
		ON players.currentTeamId = teams.id
WHERE teams.abbreviation = 'BOS';
    
/* Who are the top 5 home run hitters for games played on June 6th? (Full Name, Position, Team Abbreviation, HomeRuns) */   
SELECT CONCAT(players.firstName, ' ', players.lastName) AS fullName,
		players.position,
        teams.abbreviation,
        hittingStats.homeRuns
FROM players
		INNER JOIN teams
        ON players.currentTeamId = teams.id
		INNER JOIN hittingStats
        ON hittingStats.playerId = players.id
        INNER JOIN games
		ON hittingStats.gameId = games.id
WHERE games.startTime > '2019-06-06' AND games.startTime < '2019-07-06'
ORDER BY hittingStats.homeRuns DESC
LIMIT 5;
 
/* Who are the top 5 pitchers in ERA (earnedRuns) for games played on June 6th who have at least 4 innings pitched in that game? 
   (Full Name, Team Abbreviation, ERA) */ 
SELECT CONCAT(players.firstName, ' ', players.lastName),
		teams.abbreviation,
        pitchingStats.earnedRuns
FROM players
		INNER JOIN teams
        ON players.currentTeamId = teams.id
        INNER JOIN pitchingStats
        ON pitchingStats.playerId = players.id
        INNER JOIN games
        ON pitchingStats.gameId = games.id
WHERE games.startTime > '2019-06-06' AND games.startTime < '2019-07-06' AND pitchingStats.inningsPitched > 4
ORDER BY pitchingStats.earnedRuns DESC
LIMIT 5;

/* Which player hit the most doubles on June 6th? (Full Name, Position, Team Abbreviation, Doubles, 
   Game Start Time, Home Team, Away Team) */
SELECT CONCAT(players.firstName, ' ', players.lastName) AS fullName,
		players.position,
        teams.abbreviation,
        hittingStats.doubles,
        games.startTime,
        games.homeTeamId,
        games.awayTeamId
FROM players
		JOIN teams
        ON players.currentTeamId = teams.id
		JOIN hittingStats
        ON players.id = hittingStats.playerId
        JOIN games
		ON hittingStats.gameId = games.id
WHERE games.startTime > '2019-06-06' AND games.startTime < '2019-07-06' 
ORDER BY hittingStats.doubles DESC
LIMIT 1;