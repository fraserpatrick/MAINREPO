

create view t1_groupH
	as
select t1.tna name1, game_date, team_1_goals, t2.tna as name2, team_2_goals
from team t1, team t2, game
where t1.tno = team_1 AND t2.tno = team_2
and t1.grp = 'H'
and round = 'first';

