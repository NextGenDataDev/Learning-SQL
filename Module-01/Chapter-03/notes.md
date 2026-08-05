# Chapter 3 – Aggregation

Aggregation means combining multiple rows of data into one or more summary values using aggregate functions. Instead of looking at every individual row, you're asking SQL to calculate something about a group of rows (or entire table). 
E.g. Suppose we have this table:

|         Title         |  Author  | Year_Published |
|-----------------------|----------|----------------|
|      SQL Basics       |   John   |      2021      |
|      Python 101       |   John   |      2022      |
|      Data Science     |   Sarah  |      2021      |

If the SQL query is:
```sql
SELECT COUNT(*)
FROM Books;
```
SQL doesn't return all three rows. Instead it returns this:
|   COUNT(*)   |
|--------------|
|      3       |

---

## Common Aggregatre Functions

### COUNT()
This functions counts rows.

```sql
SELECT COUNT(*)
FROM Books;
```
#### Result:
3

#### Business Questions:
- How many customers do we have?
- How many orders were placed today?
- How many employees work here? 

### SUM()
This function calculates the total of numeric values.
Suppose we have:

|  Product  |   Price   |
|-----------|-----------|
|    Pen    |    200    |
|    Book   |    1500   | 
|    Bag    |    3000   |

```sql
SELECT SUM(Price)
FROM Products;
```
#### Result:
4700

#### Business Questions:
- What is the total sales for this month?
- How much is the total expense?
- How much profit did we make last year?

### AVG()
This function finds the average of the data.

```SQL
SELECT AVG(Price)
FROM Products;
```

#### Result:
1566.67

#### Business Questions:
- What's the average salary of the employees?
- What's the average customer rating of this product?

### MAX()
This function finds the maximum value among a set of rows of data.

```sql
SELECT MAX(Price)
FROM Products;
```
#### Result:
3000

#### Business Questions:
- What is the companies most expensive product?
- What is the highest amount paid as salary?

### MIN()
This function finds the smallest value among many rows of data.

```sql
SELECT MIN(Price)
FROM Products;
```

#### Result:
200

#### Business Questions:
- What is the company's cheapest product?
- What is the earliest order date for this product?

---

## Aggregation With GROUP BY
Using this table:
|   Author   |  Book   |
|------------|---------|
|    John    |   SQL   |
|    John    |  Python |
|    Sarah   |  Excel  |

and this code:
```sql
SELECT Author, COUNT(*)
FROM Books
GROUP BY Author;
```

SQL first groups the rows by "Autho", then counts the books in each group. Giving this result:

|   Author  |   COUNT(*)   |
|-----------|--------------|
|   John    |       2      |
|   Sarah   |       1      |

##### Without aggregation, SQL wouls imply list every book.
##### With aggregation, SQL summarizes the data.

---

## Uses Of The Business Questions
The business questions help to summarise millions of rows of data. And these summaries can be used in:
- Sales reports.
- Financial reports.
- Dashboards.
- Inventory management.
- Customer analytics.
- Performance tracking.

---

## Common Errors I Encountered

### Issue 1: Selecting a non-aggregated column with GROUP BY

#### Problem:
I didn't understand why this query causes an error:

```sql
SELECT full_name, department, COUNT(*)
FROM Employees
GROUP BY department;
``` 

#### Cause:
GROUP BY department creates one row per department.
However, full_name has multiple values within each department.

##### Example:
|  Department  |	    Employees         |
|--------------|--------------------------|
|      HR      |	    Alice, Ben        |
|      IT      |	Chloe, David, Emma    |

SQL doesn't know which full_name to display for each department.

#### Solution:

Every column in the SELECT clause must either:
- Be included in the GROUP BY, or
- Be summarized using an aggregate function.

##### Correct example:

```sql
SELECT department, COUNT(*)
FROM Employees
GROUP BY department;
```

### Issue 2: Understanding HAVING

#### Problem:
I needed to find only authors who have written more than one book.

#### Solution:

```sql
SELECT Author, COUNT(*)
FROM Books
GROUP BY Author
HAVING COUNT(*) > 1;
```

#### What I learned:
- WHERE filters rows before grouping.
- HAVING filters groups after grouping.

---

## Key Takeaways

- GROUP BY creates one row for each group.
- Every non-aggregated column in SELECT must appear in the GROUP BY.
- Aggregate functions summarize data:
```sql
COUNT()
SUM()
AVG()
MAX()
MIN()
```
- HAVING filters grouped results, while WHERE filters individual rows.
- If all selected columns are aggregate functions, GROUP BY is unnecessary because SQL summarizes the entire table into a single row.

---

## Random Questions

### What is aggregation?

Aggregation is the process of summarizing multiple rows of data into one or more summary values using aggregate functions such as `COUNT()`, `SUM()`, `AVG()`, `MAX()`, and `MIN()`.

### What's the difference between WHERE and HAVING?

- **WHERE** filters individual rows before grouping takes place.
- **HAVING** filters grouped results after grouping has taken place.

### Why does GROUP BY require every selected column to either be grouped or aggregated?

Because `GROUP BY` combines multiple rows into groups. For each group, SQL needs to know exactly what single value to return for every column in the `SELECT` statement. Therefore, every selected column must either:
- appear in the `GROUP BY` clause, or
- be summarized using an aggregate function.

### When is GROUP BY unnecessary?

`GROUP BY` is unnecessary when you're calculating aggregate values for the entire table instead of for separate groups.