use pizza_db
select * from pizza_sales

--1.Sum of Total revenue
select sum(total_price) as Total_price from pizza_sales  

--2.Average order value
select sum(total_price)/count(distinct order_id) as Average_saleValue from pizza_sales;

--3.Total pizza Sold
select sum(quantity) from pizza_sales;

--4.Average pizzas per order
select cast(cast(sum(quantity) as decimal(10,2))/cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizza
from pizza_sales

--5.Daily trend for total orders
select DATENAME(DW,order_date) as order_day,count(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(DW,order_date)

--6.Monthly trend for total orders
select DATENAME(MONTH,order_date) as order_month,count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(MONTH,order_date)
order by Total_orders desc

--7.Percentage of sales by pizza catagory
select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales) as percantage_of_sales
from pizza_sales
where MONTH(order_date)=1
group by pizza_category

--8.Percentage of Sales by pizza size
select pizza_size,sum(total_price)*100/(select sum(total_price) from pizza_sales) as POC
from pizza_sales
group by pizza_size
order by POC desc

--9.Top 5 best selles by revenue 
select top 5 pizza_name,sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales asc;

--10.Top 5 best selles by total quantity 
select top 5 pizza_name,sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc;

--9.Top 5 best selles by order_id
select top 5 pizza_name,count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders;

