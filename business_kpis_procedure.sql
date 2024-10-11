DELIMITER //
-- provide name to procedure
Create procedure classicmodels.business_kpis()
begin
drop table if exists classicmodels.business_kpis;
create table classicmodels.business_kpis
select c.country , count(distinct c.customerNumber) as Total_customers, count(distinct o.orderNumber) as Total_orders,
sum(p.amount) as Total_amount
from classicmodels.customers as c
inner join 
classicmodels.orders as o
on c.customerNumber = o.customerNumber
inner join classicmodels.payments as p
on p.customerNumber =o.customerNumber
group by 1;
end //
DELIMITER ;

call business_kpis();
select  * from classicmodels.business_kpis;
