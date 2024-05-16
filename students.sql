-- 1. Retrieve all students along with their corresponding class names.
		select s.student_name, c.class_name
        from students s
		inner join classes c on s.class_id = c.class_id;

-- 2. List all classes along with their respective teacher names.
		select c.class_name, c.teacher_name
        from classes c;
        
-- 3. Retrieve the class name for a specific student (e.g., John).
		select s.student_name, c.class_name
        from students s
        inner join classes c on s.class_id = c.class_id
        where student_name = 'John';
        
-- 4. List all students along with their ages.
		select s.student_name , age
        from students s;

-- 5. Retrieve the teacher name for a specific class (e.g., Mathematics).
		select c.class_name, c.teacher_name
        from classes c
        where class_name = 'Mathematics';
        
-- 6. List all students along with their corresponding class names and teacher names.
		select s.student_name, c.class_name, c.teacher_name
        from students s 
        inner join classes c on s.class_id = c.class_id;
        
-- 7. Retrieve the number of students enrolled in each class.
		select c.class_name , count(s.student_id) as number_of_student
        from classes c
        inner join students s on c.class_id = s.class_id
        group by c.class_name;
        
-- 8. List all classes along with the total number of students enrolled in each class.
		select c.class_name, count(s.student_id) as student_num
        from classes c
        left join students s on c.class_id = s.class_id
        group by c.class_name;
        
-- 9. Retrieve the names of all students who are enrolled in the 'Science' class.
		select s.student_name,c.class_name
        from students s 
        inner join classes c on s.class_id = c.class_id
        where c.class_name = 'Science';
        
-- 10. List all students along with their corresponding class names, and if a student does not belong to any class, display 'N/A' as the class name.
        select s.student_name, COALESCE(c.class_name, 'N/A') AS class_name 
        from students s 
        left join classes c on s.class_id = c.class_id;
        
-- 11. Retrieve all students along with their class IDs.
		 select s.student_name,s.class_id
		 from students s;
         
-- 12. List all classes along with their class IDs.
		select  c.class_name,s.class_id
        from classes c
        inner join students s on c.class_id = s.class_id;
        
-- 13. Retrieve the teacher name for each student based on their class.
		select c.class_name, c.teacher_name, s.student_name
        from classes c
        inner join students s on c.class_id = s.class_id;
        
-- 14. List all students along with their class names, sorted by student name.
		select s.student_name , c.class_name
        from students s
        join classes c on s.class_id = c.class_id
        order by student_name ;
        
-- 15. Retrieve the student names and their corresponding teacher names.
		select s.student_name , c.teacher_name
        from students s 
        join classes c on s.class_id = c.class_id;
        
-- 16. List all classes along with their class names, sorted by teacher name.
		select c.class_name , c.teacher_name
        from classes c
        order by teacher_name;
        
-- 17. Retrieve the names of students and the class names they are enrolled in, only for students aged 16.
		select s.student_name, c.class_name, s.age
        from students s 
       join classes c on s.class_id = c.class_id
       where s.age = 16;
       
-- 18. List all students along with their class names and ages, sorted by age.
		select s.student_name, c.class_name, s.age
        from students s
        join classes c on s.class_id = c.class_id
        order by s.age;
        
-- 19. Retrieve the class names along with the number of students who are exactly 15 years old.
		select c.class_name, count(s.student_id) as Num_student
        from classes c 
        join students s on c.class_id = s.class_id 
        where age = 15
        group by c.class_name;

-- 20. List all students along with their class names and teacher names, sorted by class name and student name.
		select s.student_name, c.class_name, c.teacher_name
        from students s
        join classes c on s.class_id = c.class_id
        order by c.class_name,s.student_name;

-- 21. Retrieve the list of all students who are not enrolled in any class.
		select s.student_name 
        from students s
        left join classes c on s.class_id = c.class_id
        where s.student_name is null;
        
-- 22. Find the average age of students in each class.
		select c.class_name, round(avg(s.age)) as AVG_age
        from classes c
        join students s on c.class_id = s.class_id
        group by c.class_name;
        
-- 23. List all classes that have more than 5 students enrolled.
		select c.class_name, count(s.class_id) as num_student
        from classes c
        join students s on c.class_id = s.class_id
        group by c.class_name
        having count(s.class_id) > 5;
        
-- 24. Retrieve the details of the class with the highest number of students.
	select c.class_id, c.class_name, count(s.student_id) as number_student
    from classes c
    left join students s on c.class_id = s.class_id
    group by c.class_id,c.class_name
    order by number_student desc
    limit 1;
    
-- 25. List all teachers along with the names of students they teach, even if a teacher has no students.
		select c.teacher_name, s.student_name
        from classes c
        join students s on c.class_id = s.class_id;

-- 26. Find the total number of students and the average age of students 
select count(s.student_id) as num_student , avg(age) avg_age
from students s;

-- 27. Retrieve the names of all students who are older than the average age of students in their class.
     select  c.class_name, s.student_name, s.age 
     from students s 
     join classes c on s.class_id = c.class_id
     where age < (select avg(age) from students);
     
-- 28. List the class names and the total number of students, sorted by the number of students in descending order.
		select c.class_name, count(s.student_id) as num_student
        from classes c
        join students s on c.class_id = s.class_id
        group by c.class_name
        order by num_student desc ;
        
-- 29. Retrieve the names of students and their class names, including those students who have not been assigned a class yet, sorted by class name.
		select s.student_name, coalesce(c.class_name, "NO class assigned") as class_name
        from students s 
        left join classes c on s.class_id = c.class_id
        order by c.class_name,s.student_name;

-- 30 . Retrieve the names of students who are enrolled in more than one class.
		SELECT student_name
		FROM students
		GROUP BY student_name
		HAVING COUNT(DISTINCT class_id) > 1;

-- 31. Find the class with the highest average student age.
		select c.class_name, s.age
        from classes c
        join students s  on c.class_id = s.class_id
        where s.age > (select avg(age) from students)
        order by s.age desc
        limit 1;

-- 32. Retrieve the names of students who have the same age as the average age of students in their class.
		select student_name, age
        from students
        where student_name = (select avg(age) from students);
        
-- 33. Find the students who are enrolled in classes that have fewer students than the average number of students per class.
	   select student_name
        from students  
        where student_id < (select avg(student_id) from students);
        
-- 34. List all students and their respective class names, including a row number partitioned by class and ordered by student name.
		select s.student_name, c.class_name,
        row_number() over (partition by c.class_id order by s.student_name) as row_num
        from students s 
        join classes c on s.class_id = c.class_id
        order by s.student_name;

-- 35. Retrieve the names of students who are the youngest in their class.
		select  s.student_name, s.age
        from classes c
        join students s on c.class_id = s.class_id
        where s.age = (select min(age) from students 
        where class_id = class_id);
	
-- 36. List each student along with the total number of students in their class (using a window function).
		select s.student_name, c.class_name, count(*)
        over (partition by s.class_id) as Total_student
        from students s
        join classes c on s.class_id = c.class_id;
	

-- 38. Rank students within each class based on their age, where the oldest student gets rank 1.
		select s.student_name,c.class_name,
        rank() over(partition by s.class_id order by s.age desc) as Age_rank
        from students s 
        join classes c on s.class_id = c.class_id;

