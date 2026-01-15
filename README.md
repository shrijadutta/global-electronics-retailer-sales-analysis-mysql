# Global Electronics Retailer Sales Analysis

## Project Overview
This project uses MySQL Workbench to analyze transactional data from a multinational electronics retailer, focusing on database design, data cleaning, and exploratory analysis of sales, customers, products, and stores.

## Data Source
The dataset used is sourced from `Maven Analytics` and includes five CSV files: `sales`, `products`, `customers`, `stores`, and `exchange_rates`. It contains transactional sales data along with product, customer, store, and currency details for a global electronics retailer.

## Tools Used
- Microsoft Excel – Used for minor preprocessing of CSV files.  
- MySQL – Used for database setup, table creation, data insertion, defining constraints, establishing relationships, and performing SQL queries.

## Data Preparation
- CSV Preprocessing: Updated date formats and inserted nulls wherever necessary, to ensure smooth import into MySQL Workbench.  
- Database Creation: Created a new MySQL database named `electronics_retailer`.  
- Table Creation: Designed and created tables corresponding to each CSV file (`sales`, `products`, `customers`, `stores`, `exchange_rates`).  
- Data Import: Imported data from the CSV files into the respective MySQL tables.  
- Constraints & Relationships: Defined primary and foreign key constraints and established relationships between the tables to maintain data integrity.

## Exploratory Data Analysis (EDA)
 
### 1. The company’s total revenue, profit, and overall profit margin
- **Total revenue is $55,755,479.59** with a **profit of $32,662,688.38**, giving a **profit margin of 58.58%**. 
- This shows the company is highly profitable with strong margins across its products.

### 2. The yearly and monthly sales trends
- Yearly sales grew steadily from **$6.94M in 2016** to **$18.26M in 2019**, then dropped to $9.29M in 2020. Sales appear to fall to $1.04M in 2021, but this is due to incomplete data for that year.
- Monthly sales are usually **highest in December** and lowest around April, showing seasonal fluctuations each year.

### 3. The top 10 best-selling products by revenue and quantity
- **Desktop PCs** dominate the top sellers, consistently generating high revenue and volume across multiple models.
- Products like **LCD TVs** achieve significant revenue despite lower quantities.

### 4. Product categories generating the most revenue, profit and profit margin
- **Computers** and **Home Appliances** generate the highest revenue, while **Music,Movies and Audio Books** and **Cameras and camcorders** have the highest profit margins (around 60%).
- Overall, Computers is the top-performing category in both revenue and profit, showing it is the company’s strongest product segment.

### 5. Products with high-margin but low-sales
- Most of the high-margin but low-sales items are **digital cameras**, all earning margins around **67%** despite very few purchases.
- Other electronic devices like **interchangeable lens, phone system, coffee makers** also show high profitability but low sales.

### 6. Products that were frequently bought together
- **Desktop PCs** are often bought together with other desktop PCs, as well as with **DVD players, storage binders, handheld games, and phones**.
- **DVDs, storage binders, and pens** frequently sell together and alongside other electronics.
- **Handheld games and headphones** are commonly paired with other gadgets.

### 7. Products showing declining sales over the last several months
- Many electronics products, including **microwaves, coffee makers, and refrigerators**, have experienced revenue declines over the years, ranging from **8% to 96%**.

### 8. Products that were never sold
- Several products, including **home theater systems, washers & dryers, and various lamps and chandeliers from Contoso, Adventure Works, WWI, Proseware, and Litware**, have never recorded any sales.

### 9. Stores generating the highest revenue, profit and profit margin, including their country and state.
- The **Online store** leads in revenue and profit with $11.4M revenue and $6.67M profit, followed by **US stores in Nevada, Kansas, and Nebraska**.
- Profit margins are consistently high across stores (around 58–62%), showing strong profitability regardless of country or state.

### 10. Regions contributing most to revenue growth, with variations across product categories. 
- **Europe (UK, Netherlands, Germany), North America (USA, Canada), and Australia** contribute the most to revenue growth.
- Growth varies across product categories, with **Computers, Cameras & Camcorders, Home Appliances, and TV & Video** showing the highest increases.

### 11. Top 10 customers generating most revenue
- Customers like Matthew Flemming, Stephan Rothstein, Karen Jones and few others are driving a large chunk of the revenue.

### 12. Customers who are at risk of churn based on recency of purchase
- A large number of customers haven’t made a purchase in over 1800 days, putting them at high risk of churn.

## Summary
- Generated **$55.76M in revenue**, **$32.66M profit**, and a strong **58.6% profit margin**, indicating high overall profitability.
- Sales grew steadily from 2016–2019, declined in 2020, and show clear **seasonal peaks in December**. Several products also exhibit long-term sales declines.
- **Computers** dominate revenue, profit, and best-selling products, while **Cameras and digital devices** deliver high margins despite low sales volume. Some products were never sold.
- The **Online store** leads in revenue and profit, with strongest growth from **North America, Europe, and Australia**, though performance varies by category and region.
- Customer and product analysis revealed frequently bundled items, a small group of top revenue-generating customers, and a large segment of customers inactive for 1800+ days, indicating churn risk.

## Recommendations
- Investment could be prioritized in strong categories like Computers that consistently drive revenue and profit.
- Products with low or no sales could be improved, actively promoted, or discontinued.
- High-margin products could be promoted more and bundled with popular items to increase sales.
- Successful strategies could be expanded in high-performing regions, while efforts could be made to improve weaker stores.
- Inactive customers could be re-engaged with targeted offers, and stock and promotions could be planned around seasonal trends.

## Author
**SHRIJA DUTTA**  
• [GitHub](https://github.com/shrijadutta)  • [Email](mailto:shrijadutta19@gmail.com)
