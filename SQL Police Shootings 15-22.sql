CREATE TABLE shootings_15_22 (
	id INT,
    name CHAR(50),
    date date,
    manner_of_death CHAR(50),
    armed CHAR(50),
    age INT,
    gender CHAR(1),
    race CHAR(1),
    city CHAR(50),
    state CHAR(2)
    );
    
ALTER TABLE shootings_15_22
ADD signs_of_mental_illness CHAR(5),
ADD threat_level CHAR(10),
ADD flee CHAR(20),
ADD body_camera CHAR(6),
ADD longitude DECIMAL(6,3),
ADD latitude DECIMAL (6,3),
ADD is_geocoding_exact VARCHAR(255);

SELECT *
FROM shootings_15_22
LIMIT 10;

SELECT race, COUNT(id) FROM Shootings_15_22
GROUP BY race;

SELECT gender, COUNT(id) FROM Shootings_15_22
GROUP BY gender;

SELECT state, COUNT(id) AS deaths FROM Shootings_15_22
GROUP BY state
ORDER BY deaths desc;

SELECT city, COUNT(id) AS deaths FROM Shootings_15_22
WHERE state = 'CA'
GROUP BY city
ORDER BY deaths desc;

# If the victim was armed, what were the 3 most common types of weapon they had.
SELECT armed,  COUNT(id) AS deaths FROM Shootings_15_22
GROUP BY armed
ORDER BY deaths desc
LIMIT 3;

# What is the breakdown by race of the number of people who were shot while carrying NO weapon.
SELECT race,  COUNT(id) AS deaths FROM Shootings_2015
WHERE armed = 'unarmed' 
GROUP BY race
ORDER BY deaths desc;

# NY
SELECT city, COUNT(id) AS deaths FROM Shootings_15_22
WHERE state = 'NY'
GROUP BY city
ORDER BY deaths desc;

SELECT race,  COUNT(id) AS deaths FROM Shootings_15_22
WHERE state = 'NY' AND armed = 'unarmed' 
GROUP BY race
ORDER BY deaths desc;

SELECT state, COUNT(id) AS deaths FROM Shootings_15_22
WHERE armed = 'unarmed' AND signs_of_mental_illness = 'TRUE' 
GROUP BY race
ORDER BY deaths desc;

SELECT state, race, COUNT(id) AS deaths FROM shootings_15_22
WHERE state = 'WA'
GROUP BY race
ORDER BY deaths desc;

SELECT city, state, COUNT(id) FROM shootings_15_22
WHERE state = 'WA';


    
    
    
    
    