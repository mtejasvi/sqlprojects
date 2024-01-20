use training
select * from olympics
-- How many olympics games have been held?
select count(distinct games) from olympics
---------- List down all Olympics games held so far. Order the result by year.
SELECT DISTINCT year,Season,city FROM olympics order by year;
-- Mention the total number of nations who participated in each olympics game?. Order the results by games.
select * from noc
 select count( distinct Region),games from olympics group by games order by games

 SELECT oh.Games, count(distinct ohnr.region)
	FROM olympics oh
	JOIN noc ohnr
	on oh.NOC=ohnr.NOC
	GROUP by oh.Games
	order by oh.Games

	---- Which nation has participated in all of the olympic games? and order the output by first column which is fetched

--(Hint: To find the nation that has participated in all Olympic games, you can calculate the total number of distinct games in the dataset and count the number of games each country has participated in. Then, join these two subqueries based on the total number of games. Finally, sort the output by the first column fetched.)




SELECT
    t2.region,
    t1.total
FROM
    (
    SELECT
        COUNT(DISTINCT games) 'total'
    FROM
        olympics
) t1
JOIN(
    SELECT
        COUNT(DISTINCT a.games) 'total',
        b.region
    FROM
        olympics a,
        noc b
    WHERE
        a.NOC = b.NOC
    GROUP BY
        b.region
) t2
ON
    t1.total = t2.total
	--------------How many unique athletes have won a gold medal in the Olymp
select count(distinct name),medal from olympics where medal ='Gold' group by medal

select count(DISTINCT name) from olympics where medal='Gold'
--Which Sports were just played only once in the olympics? and Order the output by Sports. output should include number of games.
--select sport,count(games) from olympics  group by sport having count(games)=1

SELECT
    t1.sport,t2.count,
    t1.games
FROM
    (
    SELECT DISTINCT
        games,
        sport
    FROM
        olympics
) t1
JOIN(
    SELECT
        COUNT(DISTINCT Games) 'count',
        sport
    FROM
        olympics
    GROUP BY
        Sport
) t2
ON
    t1.sport = t2.sport AND t2.count = 1

----Fetch the total number of sports played in each olympic games. Order by no of sports by descending.
select count(distinct sport),games from olympics group by games order by count(distinct sport) desc

--Fetch oldest athlete to win a gold medal

select * from olympics
select top 1 * from olympics where medal='Gold' order by Age desc 

--Top 5 athletes who have won the most gold medals. Order the results by gold medals in descending.

select top 5 name,region,count(medal)'count' from olympics where medal='GOLD' GROUP by name,region order by count desc 
-- Top 5 athletes who have won the most medals (gold/silver/bronze). Order the results by medals in descending.

select name,region,count(medal) 'count_of_medals' from olympics where medal in ('Gold','Silver','Bronze') group by name,region order by count(medal) desc
--Top 5 most successful countries in olympics. Success is defined by no of medals won.

SELECT top 5 region,
       COUNT(*) AS TotalMedals
FROM olympics
WHERE Medal != 'Medal-less'
GROUP BY region
ORDER BY TotalMedals DESC

--In which Sport/event, India has won highest medals.
select sport,count(medal) from olympics where medal!='Medal-less' and region ='India' group by Sport
SELECT Sport, COUNT(*) AS TotalMedals
FROM olympics
WHERE region = 'India' AND Medal IS NOT NULL
GROUP BY Sport
ORDER BY TotalMedals DESC
WITH t1 AS (
    SELECT
        COUNT(medal) AS india_medal,
        sport
    FROM
        olympics
    WHERE
        region = 'india' AND medal != 'Medal-less'
    GROUP BY
        sport
)
,rank_medal as(
SELECT
    sport,
    india_medal,
    RANK() OVER (ORDER BY india_medal DESC) AS r
FROM
    t1)
   
select sport,india_medal from rank_medal where r=1
----- Break down all olympic games where india won medal for Hockey and how many medals in each olympic games and order the result by no of medals in descending.

select sport,games,count(medal) from olympics where medal !='Medal-less' and region ='India' group by sport,games having sport ='Hockey' 

SELECT Games, COUNT(*) AS TotalMedals
FROM olympics
WHERE region = 'India' AND Medal IS NOT NULL AND Sport = 'Hockey'
GROUP BY Games
ORDER BY TotalMedals DESC;

SELECT
    games,sport,
    COUNT(medal) 'total_medal',
    region
FROM
    olympics
WHERE
    region = 'india' AND medal != 'medal-less' AND sport = 'Hockey'
GROUP BY
    region,
    games,sport
ORDER BY
    total_medal
DESC
    