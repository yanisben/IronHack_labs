SELECT DISTINCT type FROM crime_scene_report;
select count(*)
FROM crime_scene_report WHERE type = 'murder';
-- Murders 
SELECT * FROM crime_scene_report 
WHERE type = 'murder' 
AND city = 'SQL City';

-- Witnesses 
SELECT * FROM person where address_street_name = 'Northwestern Dr' ORDER BY address_numb desc limit 1; 
SELECT * FROM person where address_street_name= 'Franklin Ave' 
and name like  '%Annabel%';

-- Interview
SELECT person.name, interview.transcript
FROM person JOIN interview
ON person.id = interview.person_id
WHERE person.id = 14887 OR person.id = 16371;

-- Killer

select * from get_fit_now_member where id like '%48Z%' and membership_status= 'gold';
select * from drivers_license where plate_number like 'H42W'; 
select * from person where license_id like '67318'and '67318';

-- Jeremy Bowers