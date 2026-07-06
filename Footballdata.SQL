select *
from [dbo].['Football Players Data$']

--Write a query to find all the players in the "Arizona" team.
select *
from [dbo].['Football Players Data$']
where [Team] = 'ARIZONA'

--Write a query to find all the players who play as a "WR" (Wide Receiver).

select *
from [dbo].['Football Players Data$']
where [Pos] = 'WR'


--Write a query to list all players taller than 6 feet 2 inches.

select *
from [dbo].['Football Players Data$']
where [Ht] > '6-2'

--Write a query to find all players who attended the "Washington" college.
select *
from [dbo].['Football Players Data$']
where  [College] = 'Washington'


--Write a query to list players who are 25 years old or younger.
select *
from [dbo].['Football Players Data$']
where [Age] <= '25'


--Write a query to find all players with missing Age data.
SELECT *
FROM[dbo].['Football Players Data$']
WHERE [Age] = 'NULL'



--Write a query to find players who are rookies (Exp = 'R').
SELECT *
FROM[dbo].['Football Players Data$']
WHERE [Exp] = 'R'


--Write a query to find the tallest player on the "New Orleans" team.

SELECT *
,MAX([Ht]) OVER(PARTITION BY [Team])
FROM[dbo].['Football Players Data$']
WHERE [Team] = 'New Orleans'

SELECT [Ht]
       ,[Team]
       ,MAX([Ht])
       FROM [dbo].['Football Players Data$']
       GROUP BY [Team]
                ,[Ht]
       HAVING [Team] IN ('New Orleans')

--Write a query to find players weighing more than 250 pounds.

select *
from [dbo].['Football Players Data$']
where [Wt] > '250'

--Write a query to calculate the average height of players at each position.

SELECT *
,AVG([Inches]) OVER(PARTITION BY [Pos])
FROM [dbo].['Football Players Data$'] 




--Write a query to find the heaviest player for each position.


SELECT *
,MAX([Wt]) OVER(PARTITION BY [Pos])
FROM[dbo].['Football Players Data$']


SELECT [Wt]
       ,[Pos]
       ,MAX([Wt])
       FROM [dbo].['Football Players Data$']
       GROUP BY [Wt]
                ,[Pos]
       






--Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.

    select *
    ,rank() over(partition by [Team] order by[Age] ) as [Age1]
    ,case
    when [Age] = [Age] then 
    rank() over(partition by [Team] order by[Wt] )
    end as [age2]
    from [dbo].['Football Players Data$']



--Write a query to calculate the average height (in inches) for all players older than 25 years.

select *
,Avg([Inches]) over(partition by  [Age])
from [dbo].['Football Players Data$']
where [Age] > '25'

--Write a query to find the players with the minimum height for each position.
SELECT *
,MIN([Ht]) OVER(PARTITION BY [Pos])
FROM [dbo].['Football Players Data$']



--Write a query to get the number of players for each team grouped by their experience level.
SELECT *
,COUNT([Exp]) OVER(PARTITION BY [Team])
FROM [dbo].['Football Players Data$']

--Write a query to find the tallest and shortest players from each college.

SELECT *
,RANK() OVER(PARTITION BY [College] ORDER BY [Ht] DESC)
FROM [dbo].['Football Players Data$']



--Write a query to find all players whose weight is above the average weight for their respective position.
CREATE VIEW AVERAGE_WT AS
(
SELECT *
,AVG([Wt]) OVER(PARTITION BY [Pos]) AS AVERAGR_WT
FROM [dbo].['Football Players Data$']
)
SELECT *
FROM[dbo].[AVERAGE_WT]
WHERE  [Wt] > [AVERAGR_WT]




