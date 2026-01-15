-- Q1. Company’s total revenue, profit, and overall profit margin.

select round(sum(p.unit_price_USD * s.quantity),2) as total_revenue,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity),2) as profit,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity)
/sum(p.unit_price_USD * s.quantity) * 100,2) as profit_margin
from products p join sales s
on p.product_key = s.product_key;

-- Q2. Company`s monthly and yearly sales trends.

select year(s.order_date) as year, month(s.order_date) as month, sum(p.unit_price_USD * s.quantity) as revenue,
'monthly' as period_type
from sales s join products p 
on p.product_key = s.product_key
group by year, month
union all
select year(s.order_date) as year, null as month, sum(p.unit_price_USD * s.quantity) as revenue,
'yearly' as period_type
from sales s join products p 
on p.product_key = s.product_key
group by year
order by year, month;

-- Q3. Top 10 best selling products by revenue and quantity.

select p.product_key, p.product_name, sum(p.unit_price_USD * s.quantity) as revenue_USD,
sum(s.quantity) as total_quantity
from products p join sales s
on p.product_key = s.product_key
group by p.product_key, p.product_name
order by revenue_USD desc
limit 10;

-- Q4. Product categories generating the most revenue, profit and profit margin.

select p.category,
round(sum(p.unit_price_USD * s.quantity),2) as total_revenue,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity),2) as profit,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity)
/sum(p.unit_price_USD * s.quantity) * 100,2) as profit_margin
from products p join sales s
on p.product_key = s.product_key
group by p.category
order by total_revenue desc;

-- Q5. Products having high profit margin but low-sales.

select p.product_name, 
round(sum((p.unit_price_USD - p.unit_cost_USD) * coalesce(s.quantity,0))
/nullif(sum(p.unit_price_USD * coalesce(s.quantity,0)),0) * 100,2) as profit_margin,
count(s.sales_key) as purchase_count
from products p left join sales s
on p.product_key = s.product_key
group by p.product_name
having round(sum((p.unit_price_USD - p.unit_cost_USD) * coalesce(s.quantity,0))
/nullif(sum(p.unit_price_USD * coalesce(s.quantity,0)),0) * 100,2) > 40
and count(s.sales_key) < 20
order by profit_margin desc;

-- Q6. Products that were frequently bought together.

select p1.product_name as product_1, p2.product_name as product_2, count(*) as times_bought_together
from sales s1 join sales s2
on s1.order_number = s2.order_number
and s1.product_key < s2.product_key
join products p1
on p1.product_key = s1.product_key
join products p2
on p2.product_key = s2.product_key
group by p1.product_name, p2.product_name
order by times_bought_together desc;

-- Q7. Products showing declining sales over last several years.

select p.product_key, p.product_name,
sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end) as revenue_2018,
sum(case when year(s.order_date) = 2019 then s.quantity * p.unit_price_USD end) as revenue_2019,
sum(case when year(s.order_date) = 2020 then s.quantity * p.unit_price_USD end) as revenue_2020,
round((sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end) - 
sum(case when year(s.order_date) = 2020 then s.quantity * p.unit_price_USD end))
/ nullif(sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end), 0) * 100, 2
) as decline_percent
from sales s join products p 
on s.product_key = p.product_key
where year(s.order_date) in (2018, 2019, 2020)
group by p.product_key, p.product_name
having revenue_2018 > revenue_2019
and revenue_2019 > revenue_2020
order by decline_percent desc;

-- Q8. Products that were never sold.

select p.product_key, p.product_name
from products p left join sales s
on p.product_key = s.product_key
where s.product_key is null;

-- Q9. Stores, including their country and state, having the highest revenue,profit and profit margin.

select st.store_key, st.country, st.state,
round(sum(p.unit_price_USD * s.quantity),2) as total_revenue,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity),2) as profit,
round(sum((p.unit_price_USD - p.unit_cost_USD) * s.quantity)
/nullif(sum(p.unit_price_USD * s.quantity),0) * 100,2) as profit_margin
from products p join sales s
on p.product_key = s.product_key
join stores st
on s.store_key = st.store_key
group by st.store_key, st.country, st.state
order by total_revenue desc;

-- Q10. Regions contributing most to revenue growth, with variations across product categories.

select c.continent, c.country, c.state, p.category as product_category,
sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end) as revenue_2018,
sum(case when year(s.order_date) = 2019 then s.quantity * p.unit_price_USD end) as revenue_2019,
sum(case when year(s.order_date) = 2020 then s.quantity * p.unit_price_USD end) as revenue_2020,
round((sum(case when year(s.order_date) = 2020 then s.quantity * p.unit_price_USD end) -
sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end))
/ nullif(sum(case when year(s.order_date) = 2018 then s.quantity * p.unit_price_USD end), 0) * 100, 2
) as growth_percentage
from sales s
join customers c on s.customer_key = c.customer_key
join products p on s.product_key = p.product_key
where year(s.order_date) in (2018, 2019, 2020)
group by c.continent, c.country, c.state, p.category
having growth_percentage > 0
and revenue_2018 > 1000
order by growth_percentage desc;

-- Q11. Top 10 customers generating most revenue.

select c.customer_name, sum(p.unit_price_USD * s.quantity) as revenue_USD
from customers c join sales s
on c.customer_key = s.customer_key
join products p 
on p.product_key = s.product_key
group by c.customer_name
order by revenue_USD desc
limit 10;

-- Q12. Customers who are at risk of churn based on recency of purchase.

with max_date as(
select max(order_date) as last_date_in_dataset
from sales),
last_purchase as (
select c.customer_key,c.customer_name, max(s.order_date) as last_date_of_purchase
from customers c join sales s 
on c.customer_key = s.customer_key
group by customer_key, customer_name)
select lp.customer_name, lp.last_date_of_purchase, md.last_date_in_dataset,
datediff(md.last_date_in_dataset,lp.last_date_of_purchase) as days_since_last_purchase
from last_purchase lp cross join max_date md
where datediff(md.last_date_in_dataset,lp.last_date_of_purchase) > 365
order by days_since_last_purchase desc;

