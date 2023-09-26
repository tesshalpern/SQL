-- Creating the table: 
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL 
);

-- Then I inserted the Spotify data from https://www.kaggle.com/datasets/equinxx/spotify-top-50-songs-in-2021.

-- Next, I explored the data using the following SQL. 

-- Show the top ten popular tracks and artist names. Show the most popular first
SELECT artist_name, track_name, popularity
FROM BIT_DB.SpotifyData
ORDER BY popularity DESC
LIMIT 10;

-- Show the average danceability of all songs 
SELECT AVG(danceability) FROM BIT_DB.SpotifyData
ORDER BY danceability;

-- Show artits where loudness is greater than -6, showing highest numbers first
SELECT id, artist_name, loudness
FROM SpotifyData 
WHERE loudness < -6 
ORDER BY loudness asc;

-- Show me all tracks by Doja Cat
SELECT artist_name, track_name
FROM SpotifyData
WHERE artist_name = "Doja Cat";

-- Give me the average 
SELECT artist_name, track_name, AVG(energy), AVG(liveness), AVG(danceability)
FROM SpotifyData 
GROUP BY artist_name, track_name; 

-- Show artists in order of popularity
SELECT artist_name, popularity
FROM SpotifyData
ORDER BY popularity DESC