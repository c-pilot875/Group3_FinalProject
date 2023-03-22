-- Find all players, their school & conference, and whether or not they were drafted
SELECT N.player
	  ,N.school
	  ,S.conference
	  ,N.drafted
FROM public.nfl N
JOIN public.school_by_conference S
ON S.school = N.school;

-- Find the number of each player_type represented at the NFL combine
SELECT N.player_type
	  ,COUNT(N.player) AS player_count
FROM public.nfl N
GROUP BY N.player_type;

-- Find the number of each position_type represented at the NFL combine
SELECT N.position_type
	  ,COUNT(N.player) AS player_count
FROM public.nfl N
GROUP BY N.position_type;

-- Find the average stats of each player_type
SELECT N.player_type
	  ,ROUND(AVG(N.height),2) AS avg_height
	  ,ROUND(AVG(N.weight),2) AS avg_weight
	  ,ROUND(AVG(N.sprint_40yd),2) AS avg_sprint_40yd
	  ,ROUND(AVG(N.vertical_jump),2) AS avg_vertical_jump
	  ,ROUND(AVG(N.bench_press_reps),2) AS avg_bench_press_reps
	  ,ROUND(AVG(N.broad_jump),2) AS avg_broad_jump
	  ,ROUND(AVG(N.agility_3cone),2) AS avg_agility_3cone
	  ,ROUND(AVG(N.shuttle),2) AS avg_shuttle
	  ,ROUND(AVG(N.bmi),2) AS avg_bmi
FROM public.nfl N
GROUP BY N.player_type;

-- Find the average stats of each position_type
SELECT N.position_type
	  ,ROUND(AVG(N.height),2) AS avg_height
	  ,ROUND(AVG(N.weight),2) AS avg_weight
	  ,ROUND(AVG(N.sprint_40yd),2) AS avg_sprint_40yd
	  ,ROUND(AVG(N.vertical_jump),2) AS avg_vertical_jump
	  ,ROUND(AVG(N.bench_press_reps),2) AS avg_bench_press_reps
	  ,ROUND(AVG(N.broad_jump),2) AS avg_broad_jump
	  ,ROUND(AVG(N.agility_3cone),2) AS avg_agility_3cone
	  ,ROUND(AVG(N.shuttle),2) AS avg_shuttle
	  ,ROUND(AVG(N.bmi),2) AS avg_bmi
FROM public.nfl N
GROUP BY N.position_type;

-- Find the average stats of each conference
SELECT S.conference
	  ,ROUND(AVG(N.height),2) AS avg_height
	  ,ROUND(AVG(N.weight),2) AS avg_weight
	  ,ROUND(AVG(N.sprint_40yd),2) AS avg_sprint_40yd
	  ,ROUND(AVG(N.vertical_jump),2) AS avg_vertical_jump
	  ,ROUND(AVG(N.bench_press_reps),2) AS avg_bench_press_reps
	  ,ROUND(AVG(N.broad_jump),2) AS avg_broad_jump
	  ,ROUND(AVG(N.agility_3cone),2) AS avg_agility_3cone
	  ,ROUND(AVG(N.shuttle),2) AS avg_shuttle
	  ,ROUND(AVG(N.bmi),2) AS avg_bmi
FROM public.nfl N
JOIN public.school_by_conference S
ON S.school = N.school
GROUP BY S.conference
ORDER BY S.conference;

-- Find the number of drafted and undrafted players from each conference
SELECT S.conference
	  ,N.drafted
	  ,COUNT(N.player) AS player_count
FROM public.nfl N
JOIN public.school_by_conference S
ON S.school = N.school
GROUP BY S.conference
	    ,N.drafted
ORDER BY S.conference
		,N.drafted;