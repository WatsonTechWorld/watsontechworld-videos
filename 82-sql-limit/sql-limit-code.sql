-- watsontechworld.com

-- show databases;

use teaching_db;

show tables;

-- 1a. Show all data from salary table
select * from salary;

-- 2a. Show all data from salary table but limit to 5 rows
select * from salary LIMIT 5;

-- 3a. select name, gender, career, age, yearly_salary from salary table and sort by age
SELECT name, gender, career, age, yearly_salary FROM salary ORDER BY age;

-- 4a. select name, gender, career, age, yearly_salary from salary table and sort by age and limit to 10 rows
SELECT name, gender, career, age, yearly_salary 
FROM salary
ORDER BY age
LIMIT 10;

-- 5a. select name, gender, career, age, yearly_salary from salary table and sort by yearly salary descending
SELECT name, gender, career, age, yearly_salary
FROM salary
ORDER BY yearly_salary DESC;

-- 6a. select name, gender, career, age, yearly_salary from salary table and sort by yearly salary descending and limit to 7 rows
SELECT name, gender, career, age, yearly_salary
FROM salary
ORDER BY yearly_salary DESC
LIMIT 7;


-- Using star database
--  HYG Database
-- https://www.astronexus.com/projects/hyg

-- columns
-- proper_star_name, parsecs_from_earth, light_years_from_earth, constellation_full_name, apparent_magnitude
-- proper_star_name - Full name of a star, if it exists (many stars have no proper name).
-- parsecs_from_earth - distance from earth in parsecs from earth
-- light_years_from_earth (converting from parsecs. 1 parsec = roughly 3.26156 light years)
-- constellation_full_name - full constellation name. The original data just has abbreviations.
-- apparent_magnitude - Apparent magnitude (brightness as seen from Earth). The smaller the value the larger the brightness as seen from Earth.

-- 1b. Show all data from star_data table. Don't limit the number of rows in MySQL Workbench
select * from star_data;

-- 2b. Show how many rows in star_data table (there are over 100,000 rows)
select COUNT(*) from star_data;

-- 3b. Note how adding limit N for N >=1 to above will not change the number of rows;
select COUNT(*) from star_data LIMIT 5;

-- 4b. Show all data from star_data table but limit to 100 rows
select * from star_data LIMIT 100;

-- 5b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data (keeping all data)
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude FROM star_data;

-- 6b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data but limit to 100 rows
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude FROM star_data LIMIT 100;

-- 7b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and sort by light_years_from_earth ascending
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
ORDER BY light_years_from_earth ASC;

-- 8b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and sort by light_years_from_earth ascending and also limit to 100 rows
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
ORDER BY light_years_from_earth ASC
LIMIT 100;


-- 9b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and make sure it must have a proper star name (it can't be NULL)
-- sort by light_years_from_earth ascending.
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
WHERE proper_star_name IS NOT NULL
ORDER BY light_years_from_earth ASC;

-- 10b. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and make sure it must have a proper star name (it can't be NULL)
-- sort by light_years_from_earth ascending
-- and limit it to 100 rows
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
WHERE proper_star_name IS NOT NULL
ORDER BY light_years_from_earth ASC
LIMIT 100;



-- 11b.  select constellation_full_name, average light years from earth grouped by constellation_full_name sorted by average light years from earth
-- and make sure constellation name is not null
SELECT constellation_full_name, AVG(light_years_from_earth)
FROM star_data
WHERE constellation_full_name IS NOT NULL
GROUP BY constellation_full_name
ORDER BY AVG(light_years_from_earth);

-- 12b.  select constellation_full_name, average light years from earth grouped by constellation_full_name sorted by average light years from earth
-- and make sure constellation name is not null and limit to 50 rows
SELECT constellation_full_name, AVG(light_years_from_earth)
FROM star_data
WHERE constellation_full_name IS NOT NULL
GROUP BY constellation_full_name
ORDER BY AVG(light_years_from_earth)
LIMIT 50;