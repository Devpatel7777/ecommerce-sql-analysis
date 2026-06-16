#  E-Commerce Sales & Customer Analysis



> A complete end-to-end SQL project simulating a real-world e-commerce platform — covering database design, business data modelling, and advanced analytical queries for sales, customer, and operational reporting.

---

##  Project Overview

This project builds a fully normalized relational database for an e-commerce business and demonstrates **12+ SQL concept categories** used in real data analyst roles — from basic CRUD to Window Functions and CASE-based segmentation.

|  Database | `ecommerce_management` |
|---|---|
|  Tables | 6 linked relational tables |
|  Products | 20+ across 5 categories |
|  Customers | 12 customer records |
|  Orders | 25 orders with full lifecycle |
|  Tools | MySQL, SQL |

---

##  Database Schema

```
ecommerce_management
│
├── Categories       →  Product category master
├── Products         →  Product catalog with price & stock
├── Customers        →  Customer profiles & registration
├── Orders           →  Order records with status tracking
├── Order_Items      →  Line-level product quantity & subtotal
├── Payments         →  Payment method & status per order
└── Shipping         →  Dispatch & delivery tracking
```

### Entity Relationships

```
Categories ──< Products ──< Order_Items >── Orders >── Customers
                                                │
                                           Payments
                                           Shipping
```

---

##  SQL Concepts Demonstrated

| Category | Concepts |
|---|---|
| **CRUD** | INSERT, UPDATE, DELETE with conditions |
| **Filtering** | WHERE, HAVING, LIMIT, BETWEEN |
| **Logical Ops** | AND, OR, NOT |
| **Grouping** | GROUP BY, ORDER BY, Aggregations |
| **Aggregates** | SUM(), COUNT(), AVG(), MIN(), MAX() |
| **Joins** | INNER JOIN, LEFT JOIN, multi-table joins |
| **Subqueries** | Nested SELECT, IN, NOT IN |
| **Date Functions** | MONTH(), DATEDIFF(), DATE_FORMAT() |
| **String Functions** | UPPER(), TRIM(), IFNULL() |
| **Window Functions** | RANK(), SUM() OVER(), Running Totals |
| **CASE Expressions** | Loyalty segmentation, product labelling |
| **Constraints** | PRIMARY KEY, FOREIGN KEY, NOT NULL |

---

##  Key Business Analyses

###  Customer Loyalty Segmentation
```sql
SELECT customer_id,
  CASE
    WHEN SUM(total_amount) > 250000 THEN 'Gold'
    WHEN SUM(total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
    ELSE 'Bronze'
  END AS Loyalty_Status
FROM Orders
GROUP BY customer_id;
```

###  Monthly Revenue with Running Total
```sql
SELECT MONTH(order_date), 
       SUM(total_amount) AS monthly_revenue,
       SUM(SUM(total_amount)) OVER(ORDER BY MONTH(order_date)) AS cumulative_revenue
FROM Orders 
GROUP BY MONTH(order_date);
```

###  Top Customer by Revenue (Ranked)
```sql
SELECT customer_id, SUM(total_amount),
       RANK() OVER(ORDER BY SUM(total_amount) DESC) AS revenue_rank
FROM Orders 
GROUP BY customer_id;
```

###  Orders Without Shipping (Operational Alert)
```sql
SELECT Orders.* FROM Orders
LEFT JOIN Shipping ON Orders.order_id = Shipping.order_id
WHERE Shipping.shipping_id IS NULL;
```

---

##  Business Insights Generated

-  Identified **best-selling products** by quantity and revenue
-  Analysed **payment method distribution** (UPI, Credit Card, PayPal)
-  Segmented customers into **Gold / Silver / Bronze** loyalty tiers
-  Detected **unshipped and pending orders** for operational follow-up
-  Tracked **monthly revenue trends** with cumulative running totals
-  Labelled products as **Best Seller / Popular / Regular** using CASE

---

##  Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database engine |
| **MySQL Workbench** | Query execution & schema design |
| **SQL** | Data definition, manipulation & analysis |

---

##  Files

| File | Description |
|---|---|
| `ecommerce.sql` | Complete SQL script — schema, data, and all queries |
| `README.md` | Project documentation |

