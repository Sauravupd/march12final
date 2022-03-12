with t1 as (select E.name,E.salary,D.name as department_name from Employee E inner join Department D on E.departmentid = D.id),
t2 as (select *,rank() over(partition by department_name order by salary DESC) as salary_rank from t1)
select name,salary,department_name from t2 where salary_rank <= 3