-- Query 1: Find the total number of medals won by each country.
SELECT noc, COUNT(medal) AS total_medals
FROM olympic_data
WHERE medal IS NOT NULL
GROUP BY noc
ORDER BY total_medals DESC;


-- Query 2: Find the total number of gold medals won by each country in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) AS gold_medals
FROM olympic_data
WHERE medal = 'Gold'
  AND year = 2016
  AND season = 'Summer'
GROUP BY noc
ORDER BY gold_medals DESC;


-- Query 3: Find the average age of male and female athletes in the 2012 Summer Olympics.
SELECT sex, AVG(age) AS average_age
FROM olympic_data
WHERE year = 2012
  AND season = 'Summer'
GROUP BY sex;


-- Query 4: Find the number of medals won by Michael Phelps in each Olympics he competed in.
SELECT games, COUNT(medal) AS total_medals
FROM olympic_data
WHERE name = 'Michael Phelps'
  AND medal IS NOT NULL
GROUP BY games;


-- Query 5 : Find the top 10 countries with the most number of female athletes in the 2016 Summer Olympics.
SELECT noc, COUNT(*) AS total_female_athletes
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND sex = 'F'
GROUP BY noc
ORDER BY total_female_athletes DESC
LIMIT 10;


-- Query 6 : Find the number of medals won by Usain Bolt in each Olympics he competed in.
SELECT games, COUNT(*) AS total_medals
FROM olympic_data
WHERE name = 'Usain Bolt' AND medal IS NOT NULL
GROUP BY games;


-- Query 7 : Find the average height of male and female athletes in the 2016 Summer Olympics.
SELECT sex, AVG(height) AS average_height
FROM olympic_data
WHERE year = 2016 AND season = 'Summer'
GROUP BY sex;


-- Query 8 : Find the countries that won the most number of medals in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) AS total_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL
GROUP BY noc
ORDER BY total_medals DESC;


-- Query 9 : Find the average age of medal-winning athletes in the 2016 Summer Olympics.
SELECT AVG(age) AS average_age
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL;


-- Query 10 : Find the athletes who won more than 5 medals in the 2016 Summer Olympics.
SELECT name, COUNT(medal) AS total_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL
GROUP BY name
HAVING COUNT(medal) > 5
ORDER BY total_medals DESC;


-- Query 11 : Find the top 5 countries with the most gold medals in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) AS gold_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal = 'Gold'
GROUP BY noc
ORDER BY gold_medals DESC
LIMIT 5;


-- Query 12 : Find the athletes who won gold medals in multiple events in the 2016 Summer Olympics.
SELECT name, COUNT(DISTINCT event) AS gold_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal = 'Gold'
GROUP BY name
HAVING COUNT(DISTINCT event) > 1
ORDER BY gold_medals DESC;


-- Query 13 : Find the number of medals won by each country in the gymnastics events in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) AS total_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND sport = 'Gymnastics' AND medal IS NOT NULL
GROUP BY noc
ORDER BY total_medals DESC;


-- Query 14 : Find the number of female athletes who won medals in the 2016 Summer Olympics.
SELECT COUNT(DISTINCT name) AS total_female_medalists
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND sex = 'F' AND medal IS NOT NULL;


-- Query 15 : Find the athletes who won medals in both the 2012 and 2016 Summer Olympics.
SELECT name
FROM olympic_data
WHERE year IN (SELECT name
FROM olympic_data
WHERE year = 2012 AND medal IS NOT NULL)
INTERSECT
(SELECT name
FROM olympic_data
WHERE year = 2016 AND medal IS NOT NULL);

-- Query 16 : Find the countries that won medals in both the 2012 and 2016 Summer Olympics.
SELECT noc
FROM olympic_data
WHERE year IN (2012, 2016) AND medal IS NOT NULL
GROUP BY noc
HAVING COUNT(DISTINCT year) = 2;

-- Query 17 : Find the athletes who won more than one medal in a single event in the 2016 Summer Olympics.
SELECT name, event, COUNT() AS num_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL
GROUP BY name, event
HAVING COUNT() > 1
ORDER BY num_medals DESC;


-- Query 18 : Find the top 5 countries with the highest average number of medals per athlete in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) * 1.0 / COUNT(DISTINCT name) AS avg_medals_per_athlete
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL
GROUP BY noc
ORDER BY avg_medals_per_athlete DESC
LIMIT 5;

-- Query 19 : Find the number of medals won by each country in the athletics events in the 2016 Summer Olympics.
SELECT noc, COUNT(medal) AS total_medals
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND sport = 'Athletics' AND medal IS NOT NULL
GROUP BY noc
ORDER BY total_medals DESC;

-- Query 20 : Find the athletes who won medals in the most number of different events in the 2016 Summer Olympics.
SELECT name, COUNT(DISTINCT event) AS num_events
FROM olympic_data
WHERE year = 2016 AND season = 'Summer' AND medal IS NOT NULL
GROUP BY name
ORDER BY num_events DESC
LIMIT 10;
