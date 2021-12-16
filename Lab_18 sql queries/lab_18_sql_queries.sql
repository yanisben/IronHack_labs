select * from lab_18_sql.applestore;

-- 1. What are the different genres?
select distinct(prime_genre) from lab_18_sql.applestore;

-- 2. Which is the genre with the most apps rated? games = '8717381'
select prime_genre, sum(rating_count_tot) as applestorerating
from lab_18_sql.applestore
group by prime_genre
order by applestorerating desc;

-- 3. Which is the genre with most apps? games = 169
select prime_genre, count(prime_genre) as count
from lab_18_sql.applestore
group by prime_genre
order by count desc;

-- 4. Which is the one with least? medical = 1
select prime_genre, count(prime_genre) as count
from lab_18_sql.applestore
group by prime_genre
order by count;

-- 5. Find the top 10 apps most rated.
select track_name, rating_count_tot
from lab_18_sql.applestore
group by track_name, rating_count_tot
order by rating_count_tot desc
limit 10;

-- 6. Find the top 10 apps best rated by users.
select track_name, avg(user_rating) as rating
from lab_18_sql.applestore
group by track_name
order by rating desc
limit 10;

-- 7. Take a look at the data you retrieved in question 5. Give some insights : Most popular apps are also the most rated ones, and they're usually the social networking apps

-- 8. Take a look at the data you retrieved in question 6. Give some insights : The results are mostly games

-- 9. Now compare the data from questions 5 and 6. What do you see? The most popular apps don't appear in the best rated ones

-- 10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, rating_count_tot, user_rating
from lab_18_sql.applestore
order by rating_count_tot desc, user_rating desc
limit 3;

-- 11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

