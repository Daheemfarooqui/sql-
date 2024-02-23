create database tatanic_project;
use titanic
-- 1. Show the first 10 rows of the dataset.
select * from titanic 
limit 10;
-- 2. Find the number of passengers who survived.
select	count(Survived) as survived_passenger
from titanic
where survived = 1;

-- 3. Find the average age of all passengers.
select avg(age) as average_age
from titanic;

-- 4. Find the number of passengers in each class.
select Pclass ,count(Pclass)as number_of_passenger from titanic
group by pclass;

-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
select * from titanic
order by Pclass desc
limit 10;
-- 6. Find the number of passengers in each class sorted by class in ascending order.
select pclass , count(pclass) as number_of_class
from titanic
group by pclass
order by pclass asc;
-- 7. Find the average fare paid by passengers in each class.
select pclass ,avg(fare) 
from titanic
group by  Pclass;
-- 8. Find the name of the passenger with the highest fare.
select Name ,fare
from titanic
where fare = ( select max(fare) from titanic);

-- 9. Find the name of the passenger who had the highest age among the survivors.
select name , age 
from titanic
order by age desc
limit 1;

-- 10. Find the number of passengers who paid more than the average fare.
select count(*) as " number of passenger "
from titanic
where fare > (select avg(fare) from titanic);


-- 11. Find the name of the passenger who had the most parents or children on board.
select NAME , Parch from titanic
WHERE Parch = (SELECT MAX(parch) from titanic);

-- 12. Find the number of male and female passengers who survived, 
select Sex,count(*) as num_survived
 from titanic
 where Survived = 1
group by Sex ;

-- 13. Find the name, age, and fare of the oldest passenger who survived.

select name ,age,fare 
from titanic
where Survived = 1
order by age desc 
limit 1;

-- 14. Find the name and age of the youngest female passenger who survived in third class.

select name , age 
from titanic
where age = (select min(age) from titanic where sex  = "female"
and survived = 1
and pclass = 3
);

-- 15. Find Number of male and female passengers.

select  sex, count(*) as "m/f"
from titanic
group by sex;
