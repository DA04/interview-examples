with iPhone as (select customer_name, order_day, prod_name from orders where prod_name = ' iPhone'),
Airpods as (select customer_name, order_day, prod_name from orders where prod_name = ' Airpods')
select iPhone.customer_name, Airpods.customer_name
from iPhone left join Airpods on iPhone.customer_name = Airpods.customer_name
where Airpods.customer_name is null