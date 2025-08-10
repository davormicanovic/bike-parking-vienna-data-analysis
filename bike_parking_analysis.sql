-- Creates a view with cleaned column name

CREATE OR REPLACE VIEW public.bike_parking AS
SELECT
  "SE_SDO_ROWID" AS id,
  "BEZIRK"       AS bezirk, 
  "ADRESSE"      AS adresse,
  "ANZAHL"       AS anzahl,
  "ART_KAT"      AS kategorie
FROM public."Fahrrad_Parking";

-- Top 10 Districts ordered by number of Parking spots 

SELECT adresse, bezirk, anzahl
FROM public.bike_parking
ORDER BY anzahl DESC
LIMIT 10;


-- Number of stations per District

SELECT 
    bezirk,
    COUNT(*) AS station_anzahl
FROM public.bike_parking
GROUP BY bezirk
ORDER BY station_anzahl DESC;


-- Capacity per district with percentage of total
WITH per AS (
  SELECT bezirk, SUM(anzahl) AS total_spots
  FROM public.bike_parking GROUP BY bezirk
)
SELECT
  bezirk,
  total_spots,
  ROUND(100.0 * total_spots / SUM(total_spots) OVER (), 2) AS pct_of_city
FROM per
ORDER BY total_spots DESC;

-- Parking spots per Bezirk with ranking

WITH per AS (
  SELECT bezirk, COUNT(*) AS n_stanica
  FROM public.bike_parking GROUP BY bezirk
)
SELECT bezirk, n_stanica,
       RANK() OVER (ORDER BY n_stanica DESC) AS rnk
FROM per
ORDER BY rnk, bezirk;

-- Top 10 addresses with most parking spots

WITH base AS (
  SELECT 
    REGEXP_REPLACE(adresse, '\s*\d.*$', '') AS ulica, 
    bezirk,
    anzahl
  FROM public.bike_parking
)
SELECT 
  ulica,
  bezirk,
  SUM(anzahl) AS total_spots
FROM base
GROUP BY ulica, bezirk
ORDER BY total_spots DESC
LIMIT 10;

--Total number of pakring spots in Vienna

SELECT SUM(anzahl) AS total_spots
FROM public.bike_parking;
