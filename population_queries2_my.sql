-- How many entries in the countries table are from Africa?

SELECT COUNT (*) AS ' number of enteries from Africa'
FROM countries
WHERE continent = 'Africa';

-- What was the total population of the continent of Oceania in 2005?

SELECT SUM(population_years.population) AS 'Oceania population in 2005 in mln' 
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania' 
	AND population_years.year = 2005;

--What is the average population of countries in South America in 2003?

SELECT ROUND(AVG(population_years.population), 2) AS 'Avg population South America 2003 in mln'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.continent = 'South America' AND population_years.year = 2003;

--What country had the smallest population in 2007?
SELECT countries.name, MIN(population_years.population) AS 'population in 2007 in mln'
FROM countries
JOIN population_years
	ON population_years.country_id = countries.id
WHERE population_years.year = 2007;

--What is the average population of Poland during the time period covered by this dataset?
SELECT ROUND(AVG(population_years.population), 2) AS 'AVG Poland population'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';
	
--How many countries have the word “The” in their name?
SELECT COUNT(*) AS 'Countries with the in name'
FROM countries
WHERE countries.name LIKE '%The%';

--What was the total population of each continent in 2010?
SELECT countries.continent, ROUND(SUM(population_years.population), 2) AS 'population in 2010 in mln'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE population_years.year = 2010
GROUP BY continent
ORDER BY 2 DESC;