-- Primer vistazo a la tabla de vinos españoles
SELECT * FROM vinos.wines_spa;

-- Primer vistazo a la tabla de vinos de todo el mundo
SELECT * FROM vinos.wines_all_world1;

-- Conteo de valores únicos de cada tabla
SELECT COUNT(*) FROM wines_spa;
SELECT COUNT(*) FROM wines_all_world1;

-- Conteo de valores distintos en la tabla wines_spa
SELECT 
    COUNT(DISTINCT winery),
    COUNT(DISTINCT wine),
    COUNT(DISTINCT year),
    COUNT(DISTINCT rating),
    COUNT(DISTINCT num_reviews),
    COUNT(DISTINCT country),
    COUNT(DISTINCT region),
    COUNT(DISTINCT price),
    COUNT(DISTINCT type),
    COUNT(DISTINCT body),
    COUNT(DISTINCT acidity)
FROM wines_spa;

-- Conteo de valores distintos en la tabla wines_all_world1
SELECT 
    COUNT(DISTINCT country),
    COUNT(DISTINCT description),
    COUNT(DISTINCT designation),
    COUNT(DISTINCT points),
    COUNT(DISTINCT price),
    COUNT(DISTINCT province),
    COUNT(DISTINCT region_1),
    COUNT(DISTINCT region_2),
    COUNT(DISTINCT taster_name),
    COUNT(DISTINCT taster_twitter_handle),
    COUNT(DISTINCT title),
    COUNT(DISTINCT variety),
    COUNT(DISTINCT winery)
FROM wines_all_world1;

-- Vino con el precio más alto de cada tabla
SELECT * FROM wines_spa WHERE price = (SELECT MAX(price) FROM wines_spa);
SELECT * FROM wines_all_world1 WHERE price = (SELECT MAX(price) FROM wines_all_world1);

-- Vino con el precio más bajo de cada tabla
SELECT * FROM wines_spa WHERE price = (SELECT MIN(price) FROM wines_spa);
SELECT * FROM wines_all_world1 WHERE price = (SELECT MIN(price) FROM wines_all_world1);

-- Vino más antiguo de la tabla wines_spa
SELECT * FROM wines_spa WHERE year = (SELECT MIN(year) FROM wines_spa);

-- Vino más moderno de la tabla wines_spa
SELECT * FROM wines_spa WHERE year = (SELECT MAX(year) FROM wines_spa);

-- Vino con el puntaje más alto
SELECT * FROM wines_spa WHERE rating = (SELECT MAX(rating) FROM wines_spa);
SELECT * FROM wines_all_world1 WHERE points = (SELECT MAX(points) FROM wines_all_world1);

-- Vino con el puntaje más bajo
SELECT * FROM wines_spa WHERE rating = (SELECT MIN(rating) FROM wines_spa);
SELECT * FROM wines_all_world1 WHERE points = (SELECT MIN(points) FROM wines_all_world1);

-- Winerys (Bodegas) que tienen la mayor cantidad de vinos en cada tabla
SELECT winery, COUNT(*) AS cantidad_de_vinos
FROM wines_spa
GROUP BY winery
ORDER BY cantidad_de_vinos DESC
LIMIT 1;

SELECT winery, COUNT(*) AS cantidad_de_vinos
FROM wines_all_world1
GROUP BY winery
ORDER BY cantidad_de_vinos DESC
LIMIT 1;

-- Precio promedio de los vinos de la bodega que mas vinos registra de cada tabla
-- Esta consulta primero encuentra la bodega que produce más vinos utilizando una subconsulta en el WHERE, luego filtra los vinos de esa bodega y calcula el año promedio utilizando AVG() en la columna de años.
SELECT ROUND(AVG(price), 2) AS precio_promedio
FROM wines_spa
WHERE winery = (
    SELECT winery
    FROM wines_spa
    GROUP BY winery
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT ROUND(AVG(price), 2) AS precio_promedio
FROM wines_all_world1
WHERE winery = (
    SELECT winery
    FROM wines_all_world1
    GROUP BY winery
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Ratings promedio de los vinos de la bodega que mas vinos registra de cada tabla
SELECT ROUND(AVG(rating),2) AS rating_promedio
FROM wines_spa
WHERE winery = (
    SELECT winery
    FROM wines_spa
    GROUP BY winery
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT ROUND(AVG(points),2) AS rating_promedio
FROM wines_all_world1
WHERE winery = (
    SELECT winery
    FROM wines_all_world1
    GROUP BY winery
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Calculo del año promedio de los vinos de la bodega que produce más vinos en la tabla wines_spa
SELECT ROUND(AVG(year),2) AS año_promedio
FROM wines_spa
WHERE winery = (
    SELECT winery
    FROM wines_spa
    GROUP BY winery
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Los 10 vinos con los mejores ratings ordenados por precio en cada tabla
SELECT *
FROM wines_spa
ORDER BY rating DESC, price ASC
LIMIT 10;

SELECT *
FROM wines_all_world1
ORDER BY points DESC, price ASC
LIMIT 10;

-- Los 10 vinos según el tipo (type) ordenados por región (region) ordenado para cada tabla 
SELECT *
FROM wines_spa
ORDER BY type DESC, region ASC
LIMIT 10;

SELECT *
FROM wines_all_world1
ORDER BY variety DESC, price ASC
LIMIT 10;

-- Rank de los 10 mejores vinos por rating ordenados por type y ordenados por región para cada tabla
SELECT *,
ROW_NUMBER() OVER (ORDER BY rating DESC, type ASC, region ASC) AS ranking
FROM wines_spa
LIMIT 10;

SELECT *,
ROW_NUMBER() OVER (ORDER BY points DESC, variety ASC, province ASC) AS ranking
FROM wines_all_world1
LIMIT 10;

-- Rank de los 10 mejores vinos por rating ordenados por precio y ordenados por región para cada tabla
SELECT *,
ROW_NUMBER() OVER (ORDER BY rating DESC, price ASC, region ASC) AS ranking
FROM wines_spa
LIMIT 10;

SELECT *,
ROW_NUMBER() OVER (ORDER BY points DESC, price ASC, province ASC) AS ranking
FROM wines_all_world1
LIMIT 10;

-- Región que tenga la mayor cantidad de ratings en cada tabla
SELECT region, COUNT(*) AS cantidad_de_ratings
FROM wines_spa
GROUP BY region
ORDER BY cantidad_de_ratings DESC
LIMIT 1;

SELECT province, COUNT(*) AS cantidad_de_ratings
FROM wines_all_world1
GROUP BY province
ORDER BY cantidad_de_ratings DESC
LIMIT 1;

-- Promedio de los ratings por región de cada tabla
SELECT region, ROUND(AVG(rating),2) AS promedio_de_ratings
FROM wines_spa
GROUP BY region;

SELECT province, ROUND(AVG(points),2) AS promedio_de_ratings
FROM wines_all_world1
GROUP BY province;

-- Ranking de las 10 mejores regiones con los mayores promedios de ratings de cada tabla
SELECT region,
AVG(rating) AS promedio_de_ratings,
ROW_NUMBER() OVER (ORDER BY AVG(rating) DESC) AS ranking
FROM wines_spa
GROUP BY region
ORDER BY AVG(rating) DESC
LIMIT 10;

SELECT province,
AVG(points) AS promedio_de_ratings,
ROW_NUMBER() OVER (ORDER BY AVG(points) DESC) AS ranking
FROM wines_all_world1
GROUP BY province
ORDER BY AVG(points) DESC
LIMIT 10;

-- Joins entre las dos tablas, basandonos en las igualdades de precio y ordenando de forma descendiente por las diferentes columnas
SELECT spa.country, spa.price, spa.winery
FROM wines_spa AS spa
INNER JOIN wines_all_world1 AS world1
ON spa.price = world1.price
ORDER BY spa.price DESC
LIMIT 100;

SELECT spa.country, spa.price, spa.winery, spa.rating
FROM wines_spa AS spa
LEFT JOIN wines_all_world1 AS world1
ON spa.price = world1.price
ORDER BY spa.price DESC
LIMIT 100;

SELECT spa.country, spa.price, spa.winery, spa.rating
FROM wines_spa AS spa
INNER JOIN wines_all_world1 AS world1
ON spa.price = world1.price
ORDER BY spa.price DESC
LIMIT 100;

SELECT spa.country, spa.price, spa.winery, spa.rating, spa.region
FROM wines_spa AS spa
INNER JOIN wines_all_world1 AS world1
ON spa.price = world1.price
ORDER BY spa.price DESC
LIMIT 100;

SELECT spa.country, spa.price, spa.winery, spa.rating, spa.region
FROM wines_spa AS spa
LEFT JOIN wines_all_world1 AS world1
ON spa.price = world1.price
ORDER BY spa.price DESC
LIMIT 100;
