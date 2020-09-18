SELECT DISTINCT year FROM population_years;

SELECT * FROM population_years
WHERE country = 'Gabon'
ORDER BY population DESC;

SELECT * FROM population_years
WHERE year = 2005
ORDER BY population
LIMIT 10;

SELECT * FROM population_years
WHERE population > 100 AND year = 2010;

SELECT DISTINCT COUNT(country) FROM population_years
WHERE country LIKE '%Islands%' AND year = 2000;

SELECT * FROM population_years
WHERE year = 2000 AND country = 'Indonesia' OR year = 2010 AND country = 'Indonesia';
