SELECT name, population
FROM city
WHERE population = (SELECT min(population) FROM city);

SELECT name
FROM country
WHERE name LIKE '__r%'
ORDER BY name DESC;

SELECT A.name AS name, B.Name AS name
FROM country A, country B
WHERE A.name <> B.name and A.continent LIKE '%Europe%' and B.continent LIKE '%Europe%'
ORDER BY A.name, B.name ASC;

SELECT continent, count(name), round(avg(gnp))
FROM country
GROUP BY continent
ORDER BY ROUND(Avg(gnp)) DESC;

SELECT country.name
FROM country, countrylanguage
WHERE country.code = countrylanguage.countrycode
GROUP BY country.name
HAVING count(*) >8
ORDER BY country.name ASC;
