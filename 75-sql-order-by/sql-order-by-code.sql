-- watsontechworld.com

-- show databases;

use teaching_db;

show tables;

-- 1. Show all data from salary table
select * from salary;

-- 2. select name, gender, career, age, yearly_salary from salary table and sort by age
SELECT name, gender, career, age, yearly_salary FROM salary ORDER BY age;

-- 3. Do similarly, but instead sort by yearly salary ascending
SELECT name, gender, career, age, yearly_salary FROM salary ORDER BY yearly_salary;

-- 4. Now do similarly, but instead sort by yearly salary descending
SELECT name, gender, career, age, yearly_salary FROM salary ORDER BY yearly_salary DESC;

-- 5. Now do similarly, but instead sort by gender ascending and then yearly_salary descending
SELECT name, gender, career, age, yearly_salary FROM salary ORDER BY gender, yearly_salary DESC;


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

-- 6. Show all data from star_data table
select * from star_data;

-- 7. Show how many rows in star_data table (there are over 100,000 rows)
select COUNT(*) from star_data;

-- 8. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and sort by light_years_from_earth ascending
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
ORDER BY light_years_from_earth ASC;


-- 8.5. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and sort by light_years_from_earth descending
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
ORDER BY light_years_from_earth DESC;

-- 9. Select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- and make sure it must have a proper star name (it can't be NULL)
-- and sort by light_years_from_earth ascending.
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
WHERE proper_star_name IS NOT NULL
ORDER BY light_years_from_earth ASC;

-- 10. select proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude from star_data
-- And sort by apparent_magnitude ascending
SELECT proper_star_name, light_years_from_earth, constellation_full_name, apparent_magnitude
FROM star_data
ORDER BY apparent_magnitude;

-- Sirus should be the brightest star (aside from Sol, our own sun).


-- 11.  select constellation_full_name, average light years from earth grouped by constellation_full_name sorted by average light years from earth
-- and make sure constellation name is not null
SELECT constellation_full_name, AVG(light_years_from_earth)
FROM star_data
WHERE constellation_full_name IS NOT NULL
GROUP BY constellation_full_name
ORDER BY AVG(light_years_from_earth);


-- 12.  select constellation_full_name, average apparent_magnitude grouped by constellation_full_name sorted by average apparent_magnitude
-- and make sure constellation name is not null

SELECT constellation_full_name, AVG(apparent_magnitude)
FROM star_data
WHERE constellation_full_name IS NOT NULL
GROUP BY constellation_full_name
ORDER BY AVG(apparent_magnitude);

SELECT AVG(apparent_magnitude) FROM star_data;
