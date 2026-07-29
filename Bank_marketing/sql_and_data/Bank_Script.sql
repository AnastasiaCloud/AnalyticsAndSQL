#Общая информация о клиентах
select job, COUNT(job) AS count_job, ROUND(100.0 * COUNT(job) / SUM(COUNT(job)) OVER (), 2) AS percent from bank_full bf where y = 'yes' group by job

select COUNT(job) from bank_full bf where job = 'management' and y = 'yes'

SELECT 
    job,
    COUNT(*) AS total_people,
    COUNT(CASE WHEN y = 'yes' THEN 1 END) AS yes_count,
    ROUND(100.0 * COUNT(CASE WHEN y = 'yes' THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM bank_full bf 
GROUP BY job 
ORDER BY conversion_rate DESC;

select MAX(balance) as max_balance, MIN(balance) as min_balance
from bank_full bf ;

select MIN(age) as min_age, MAX(age) as max_age
from bank_full bf ;

select month, COUNT(*) as month_calls
from bank_full bf 
group by month
order by month_calls desc ;

##Гипотеза1 - Баланс
select y, AVG(balance) as avg_balance, PERCENTILE_CONT(0.5) within group (order by balance) as median_balance
from bank_full bf 
group by y;

select case 
	when balance < 0 then 'Отрицательный'
	when balance <= 500 then '0-500'
	when balance <= 1000 then '501-1000'
	when balance <= 5000 then '1001-5000'
	when balance <= 10000 then '5001-10000'
	else '10000+'
end as group_balance, COUNT(*) as tot_clients, COUNT(case when y ='yes' then 1 end) as open_deposit
from bank_full bf 
group by group_balance;

##Гипотеза2 - Ипотека
select housing, count(*) as clients, count(case when y = 'yes' then 1 end) as open_deposit, 
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by housing;

#Гипотеза3 - Потребительский кредит
select loan, count(*) as clients, count(case when y = 'yes' then 1 end) as open_deposit, 
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by loan;

#Доп.гипотеза по ипотеке и потреб. кредитам
select housing, loan, count(*) as clients, count(case when y = 'yes' then 1 end) as open_deposit, 
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by housing, loan;

#Гипотеза4 - Возраст
select case 
	when age <= 25 then '18-25'
	when age <= 35 then '26-35'
	when age <= 45 then '36-45'
	when age <= 55 then '46-55'
	when age <= 65 then '56-65'
	else '66+'
end as group_age, COUNT(*) as tot_clients, COUNT(case when y ='yes' then 1 end) as open_deposit, 
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by group_age;

#Гипотеза5 - Способ контакта
select contact, count(*) as clients,
	count(case when y = 'yes' then 1 end) as open_deposit,
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by contact
order by conversion desc;

#Гипотеза6 - Длительность звонка
select min(duration) as min_duration, 
	 max(duration) as max_duration,
	 avg(duration) as avg_duration
from bank_full bf ;

select case 
	when duration <= 60 then '0-60'
	when duration <= 180 then '61-180'
	when duration <= 300 then '181-300'
	when duration <= 600 then '301-600'
	else '601+'
end as group_duration, COUNT(*) as tot_clients, COUNT(case when y ='yes' then 1 end) as open_deposit, 
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by group_duration;

#Гипотеза7 - Результат предыдущей компании
select poutcome, count(*) as clients,
	count(case when y = 'yes' then 1 end) as open_deposit,
	round(count(case when y = 'yes' then 1 end)*100.0/count(*),2) as conversion
from bank_full bf 
group by poutcome
order by conversion desc;
