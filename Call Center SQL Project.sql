CREATE TABLE calls (
	ID CHAR(50),
    cust_name CHAR(50),
    sentiment CHAR(20),
    csat_score INT,
    call_timestamp CHAR(10),
    reason CHAR(20),
    city CHAR(20),
    state CHAR(20),
    channel CHAR(20),
    response_time CHAR(20),
    call_duration_minutes INT,
    call_center CHAR(20)
    );
    
-- Preview of table

SELECT *
FROM calls
LIMIT 10;
    
-- Converting timestamp from string to date format
    
SET SQL_SAFE_UPDATES = 0;
UPDATE calls SET call_timestamp = str_to_date(call_timestamp, '%m/%d/%Y');
UPDATE calls SET csat_score = NULL WHERE csat_Score = 0;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM calls LIMIT 10;

SELECT COUNT(*) AS rows_num FROM calls;
SELECT COUNT(*) AS cols_num FROM information_schema.columns WHERE table_name = 'calls';

SELECT DISTINCT sentiment 
FROM calls;
SELECT DISTINCT reason
FROM calls;
SELECT DISTINCT channel
FROM calls;
SELECT DISTINCT response_time
FROM calls;
SELECT DISTINCT call_center
FROM calls;

-- The count and percentage from total of each of the distinct values

SELECT sentiment, COUNT(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100 , 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT reason, COUNT(*), ROUND((COUNT(*) /  (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT channel, COUNT(*), ROUND((COUNT(*) /  (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT response_time, COUNT(*), ROUND((COUNT(*) /  (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT call_center, COUNT(*), ROUND((COUNT(*) /  (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT state, COUNT(*) FROM calls GROUP BY 1 ORDER BY 2 DESC;

-- Which day has the most calls?

SELECT DAYNAME(call_timestamp) AS Day_of_Call, COUNT(*) num_of_calls 
FROM calls 
GROUP BY 1 ORDER BY 2 DESC;

-- Aggregations

SELECT MIN(csat_score) AS min_score, MAX(csat_score) AS max_score, ROUND(AVG(csat_score),1) AS avg_score
FROM calls
WHERE csat_score != 0;

SELECT MIN(call_timestamp) AS earliest_date, MAX(call_timestamp) AS most_recent
FROM calls;

SELECT MIN(call_duration_minutes) AS min_call_duration, MAX(call_duration_minutes) AS max_call_duration,
	AVG(call_duration_minutes) AS avg_call_duration
FROM calls;

SELECT call_center, response_time, COUNT(*) AS count
FROM calls
GROUP BY 1, 2 ORDER BY 1, 3 DESC;

SELECT call_center, AVG(call_duration_minutes)
FROM calls
GROUP BY 1 ORDER BY 2 DESC;

SELECT channel, AVG(call_duration_minutes)
FROM calls 
GROUP BY 1 ORDER BY 2 DESC;

SELECT state, COUNT(*) 
FROM calls
GROUP BY 1 ORDER BY 2 DESC;

SELECT state, reason, COUNT(*)
FROM calls
GROUP BY 1, 2 ORDER BY 1, 2, 3 DESC;

SELECT state, sentiment, COUNT(*)
FROM calls
GROUP BY 1, 2 ORDER BY 1,3 DESC;

SELECT state, AVG(csat_score) AS AVG_csat_score
FROM calls
WHERE csat_score != 0 
GROUP BY 1 ORDER BY 2 DESC;

SELECT sentiment, AVG(call_duration_minutes)
FROM calls
GROUP BY 1 ORDER BY 2 DESC;

-- New York City Queries

SELECT city, AVG(call_duration_minutes)
FROM calls
WHERE city = 'New York City';

SELECT city, MAX(call_duration_minutes)
FROM calls
WHERE city = 'New York City';

SELECT city, MAX(csat_score), MIN(csat_score), ROUND(AVG(csat_Score),1)
FROM calls
WHERE city = 'New York City';

SELECT city, COUNT(reason)
FROM calls
WHERE city = 'New York City';

SELECT city, COUNT(DISTINCT reason)
FROM calls
WHERE city = 'New York City';



    
    