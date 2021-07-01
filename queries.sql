-- Look at all data
SELECT * FROM spotify;

-- Look at most popular song in this dataset
SELECT * FROM spotify
WHERE popularity = (
	SELECT MAX(popularity)
	FROM spotify);

-- Try to get most popular artists for the last decade
SELECT artist, title, popularity, year
FROM spotify
WHERE popularity > 50 AND year > 2009;

-- Top 5 popular songs by decade
SELECT artist, title, popularity, year
FROM spotify
WHERE year = 2000 AND popularity > 80
ORDER BY popularity DESC
LIMIT 5;

-- Creating table of top songs with popularity greater than 80
CREATE TABLE top_songs AS
SELECT 
	s1.index, s1.artist, s1.title, s1.popularity, s1.year
FROM 
	spotify s1
INNER JOIN spotify s2 
	ON s2.index = s1.index
WHERE 
	s1.popularity > 80; 

SELECT *
FROM top_songs
ORDER BY year;

--SELECT * 
--FROM spotify;

SELECT artist, title, beats_per_minute, speechiness
FROM spotify
WHERE speechiness > 4
ORDER BY speechiness DESC;

-- Top 10 dance-able songs
SELECT artist, title, beats_per_minute, danceability, year
FROM spotify
ORDER BY danceability DESC
LIMIT 10;

-- Top songs between years 1950 and 2000
SELECT artist, title, year, popularity
FROM spotify
WHERE popularity > 80 AND year > 1950 AND year < 2001
ORDER BY popularity;

-- Top 10 artists 
SELECT artist, COUNT(title) AS popular_songs
FROM spotify
WHERE popularity > 60
GROUP BY artist
ORDER BY popular_songs DESC
LIMIT 10;

-- Popular spoken word songs
SELECT artist, title, speechiness, popularity
FROM spotify
WHERE popularity > 60
ORDER BY popularity DESC
LIMIT 10;

-- Average tempo of songs as years progress
SELECT year, ROUND(AVG(beats_per_minute), 2) AS bpm
FROM spotify
GROUP BY year
ORDER BY year DESC;

-- Most popular genres by year
SELECT genre, year, MAX(popularity) AS genre_popularity
FROM spotify
GROUP BY genre, year, popularity
ORDER BY popularity DESC;

-- Artists with the most popular songs
SELECT artist, COUNT(popularity) AS artist_popularity
FROM spotify
GROUP BY artist
ORDER BY artist_popularity DESC
LIMIT 10;

-- Loudest song in this dataset
SELECT title, MAX(loudness) AS loudness
FROM spotify
GROUP BY title
ORDER BY loudness DESC
LIMIT 10;

-- Quietest songs in this dataset
SELECT title, MIN(loudness) AS quietness
FROM spotify
GROUP BY title
ORDER BY loudness
LIMIT 10;

-- Artists with the loudest songs
SELECT artist, MAX(loudness) AS loudness
FROM spotify
GROUP BY artist
ORDER BY loudness DESC
LIMIT 10;

-- Coldplay's top 5 loudest songs
SELECT title, MAX(loudness) AS song_loudness
FROM spotify
WHERE artist = 'Coldplay'
GROUP BY title
ORDER BY song_loudness DESC
LIMIT 5;