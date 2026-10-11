USE netflix_data;
SELECT * FROM netflix LIMIT 10;

SELECT count(*) AS  total_titles FROM netflix;

SELECT type, count(*) AS total_titles, round(COUNT(*) * 100 / (SELECT COUNT(*) FROM netflix), 2)
AS percentage FROM netflix GROUP BY type;

SELECT rating, count(*) AS total_titles FROM netflix 
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;

SELECT release_year, count(*)  AS total_titles FROM netflix
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

SELECT release_year, type, count(*) AS total_titles FROM netflix
WHERE release_year IS NOT NULL
GROUP BY release_year, type
ORDER BY release_year, type;

SELECT release_year, count(*) AS total_movies FROM netflix
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY type DESC
LIMIT 10;

SELECT release_year, count(*) AS total_tvshows FROM netflix
WHERE type = 'TV Show'
GROUP BY release_year
ORDER BY type DESC
LIMIT 10;

SELECT added_year, count(*) AS titles_added FROM netflix
WHERE date_added IS NOT NULL
GROUP BY added_year
ORDER BY added_year;

SELECT month_added, added_month_name, count(*) AS titles_added FROM netflix
WHERE date_added IS NOT NULL
GROUP BY month_added, added_month_name
ORDER BY month_added;

SELECT country, count(*) AS total_titles FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

SELECT type, count(*) AS total_titles FROM netflix
WHERE country LIKE '%India%'
GROUP BY type;

SELECT release_year, type, count(*) AS total_titles FROM netflix 
WHERE country LIKE '%India%'
GROUP BY release_year, type
ORDER BY release_year;

WITH yearly_content AS ( SELECT release_year, count(*) AS total_titles FROM netflix 
WHERE release_year <> 'Unknown'
GROUP BY release_year)
SELECT release_year, total_titles, RANK() OVER (ORDER BY total_titles DESC) AS release_rank
FROM yearly_content
ORDER BY  release_rank; 

SELECT release_year, count(*) AS total_titles, SUM(type = 'Movie') AS movies, SUM(type = 'TV Show') AS tv_shows,
 ROUND(SUM(type = 'Movie') * 100 / count(*), 2) AS movie_percentage,
 ROUND(SUM(type = 'TV Show') * 100 / count(*), 2) AS tv_show_percentage
FROM netflix 
WHERE release_year <> 'Unknown'
GROUP BY release_year
ORDER BY release_year;

WITH yearly_content AS ( SELECT release_year, count(*) AS total_titles FROM netflix 
WHERE release_year <> 'Unknown'
GROUP BY release_year)
SELECT release_year, total_titles FROM yearly_content 
WHERE total_titles > (SELECT AVG(total_titles) FROM yearly_content)
ORDER BY release_year;


SELECT title_country, type, count(*) AS total_titles FROM netflix 
GROUP BY title_country, type
ORDER BY title_country, total_titles DESC;

SELECT title_country, count(*) AS total_tv_shows FROM netflix 
WHERE type = 'TV Show'
GROUP BY title_country
ORDER BY total_tv_shows DESC LIMIT 10;

SELECT title_country, count(*) AS total_movies FROM netflix 
WHERE type = 'Movie'
GROUP BY title_country
ORDER BY total_movies DESC LIMIT 10;

SELECT genre, count(*) AS total_titles FROM netflix   
GROUP BY genre
ORDER BY total_titles DESC LIMIT 15;

SELECT genre, count(*) AS total_titles FROM netflix 
WHERE country LIKE '%India%'
GROUP BY genre
ORDER BY total_titles DESC LIMIT 10;

SELECT type, rating, count(*) AS total_titles FROM netflix 
GROUP BY type, rating
ORDER BY type, total_titles DESC;

SELECT ROUND(AVG(CAST(REPLACE(duration, ' min', ' ') AS UNSIGNED)), 2) AS avg_movie_duration
FROM netflix 
WHERE type = 'Movie'
AND duration LIKE '%min';

SELECT CAST(REPLACE(duration, ' min', ' ') AS UNSIGNED) AS duration_min, count(*) AS total_movies
FROM netflix 
WHERE type = 'Movie'
GROUP BY duration_min
ORDER BY duration_min;

SELECT CAST(REGEXP_SUBSTR(duration, '[0-9]+') AS UNSIGNED) AS seasons, count(*) AS total_tvshows
FROM netflix 
WHERE type = 'TV Show'
GROUP BY seasons
ORDER BY seasons;

SELECT title, duration, CAST(REGEXP_SUBSTR(duration, '[0-9]+') AS UNSiGNED) AS seasons
FROM netflix 
WHERE type = 'TV Show'
ORDER BY seasons DESC LIMIT 10;

SELECT FLOOR(release_year / 10) * 10 AS release_decade, 
ROUND(AVG(CAST(REPLACE(duration, ' min', ' ') AS UNSIGNED)),2) AS avg_duration
FROM netflix 
WHERE type = 'Movie' AND duration LIKE '%min'
GROUP BY release_decade
ORDER BY release_decade;

SELECT  director, count(*) AS total_titles FROM netflix 
WHERE director <> 'Unknown'
GROUP BY director
ORDER BY total_titles DESC LIMIT 10;

SELECT actors, count(*) AS total_titles FROM netflix 
WHERE actors <> 'Unknown'
GROUP BY actors
ORDER BY total_titles DESC LIMIT 10;

SELECT count(*) AS multi_genre FROM netflix 
WHERE listed_in LIKE '%,%';




