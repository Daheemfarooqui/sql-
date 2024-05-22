-- 1. Retrieve all records from the dataset.
		select * from adultcsv;
        
-- 2. Select the first 10 records from the dataset.
		select * from adultcsv
        limit 10;
        
-- 3. Count the number of records in the dataset.
		select count(*) as"number of records in the dataset."
        from adultcsv;
        
-- 4. Find the average age of individuals in the dataset.
		select avg(age) as avg_age
        from adultcsv;adultcsv
        
-- 5. Count the number of individuals in each workclass.
		select workclass,count(workclass)
        from adultcsv
        group by workclass;
        
-- 6. Retrieve the distinct education levels present in the dataset.
		select distinct education
        from adultcsv;
        
-- 7. Find the maximum and minimum age in the dataset.
		select max(age), min(age)
        from adultcsv;
        
-- 8. Calculate the average hours per week worked by individuals grouped by sex.
		select gender, avg(hoursperweek)
        from adultcsv
        group by gender;
        
-- 9. List the top 5 most common occupations in the dataset.
		select occupation, count(occupation)
        from adultcsv
        group by occupation
        order by count(occupation) desc
        limit 5;
        
-- 10. Find the total capital gain and capital loss for each marital status.
		select marital_status, sum(capital_gain),
        sum(capital_loss)
        from adultcsv
        group by marital_status;
        
-- 11. Count the number of individuals by race.
		select race, count(race) as count_race
        from adultcsv 
        group by race;
        
-- 12. Retrieve all individuals who work more than 40 hours per week.
		select * from adultcsv
        where hoursperweek > 40;
        
-- 13. Find the average age of individuals grouped by their relationship status.
		select marital_status , avg(age) as avg_age
        from adultcsv
        group by marital_status;
        
-- 14. Count the number of individuals from each native country.
		select native_country, count(*) as "number of individuals"
        from adultcsv
        group by native_country;
        
-- 15. Retrieve individuals with a capital gain greater than 10,000.
		select * from adultcsv
        where capital_gain > 10000;
        
-- 16. Find the proportion of individuals earning more than 50K.
        select 
			(select count(*) from adultcsv where income = '>50k')
            * 1.0 / count(*) as proportion
            from adultcsv;
            
-- 17. List the occupations with more than 100 individuals.
		select occupation, count(*)
        from adultcsv
        group by occupation
        having count(*) > 100;
     
-- 18. Retrieve individuals aged between 30 and 40 years.
		select * from adultcsv
        where age between 30 and 40;
        
-- 19. Calculate the total number of hours worked per week by individuals with a higher education degree.
		select sum(hoursperweek)
        from adultcsv
        where  education IN ('Bachelors', 'Masters', 'Doctorate');
        
-- 20. Find the average capital gain and capital loss for each workclass.
		select workclass, avg(capital_gain) as "avg capital_gain" , 
        avg(capital_loss) as "avg capital_loss"
        from adultcsv
        group by workclass;