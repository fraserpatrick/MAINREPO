SELECT *
FROM t1_grouph
WHERE name1 = 'Saudi Arabia' or name2 = 'Saudi Arabia'
ORDER BY game_date;

UPDATE team
SET grp = 'H'
WHERE tna = 'Ukraine';

UPDATE game
SET team_1_goals = 0, team_2_goals = 0
WHERE gno = 23;

DELETE
FROM game
WHERE team_1 = (SELECT tno FROM team WHERE tna = 'Germany') and team_2 = (SELECT tno FROM team WHERE tna = 'Brazil');

ALTER TABLE team
ADD Manager char(50);

UPDATE team
SET Manager = 'Juergen Klinsmann'
WHERE tna = 'Germany';

SELECT avg(team_1_goals + team_2_goals) AS avgnum
FROM game;
