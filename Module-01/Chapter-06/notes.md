# Chapter 6 — Window Functions

## What is Chapter 6 about?

Chapter 6 introduces **window functions**.

The main idea is:

> **Window functions let me calculate something across a set of rows without collapsing those rows into one row.**

This is different from `GROUP BY`.

With `GROUP BY`, rows are grouped together and the result becomes one row per group.

With a window function, I can keep **every individual row** and add a calculated value beside it.

This is especially useful for things like:

- Ranking students.
- Finding the top employee in each department.
- Comparing a person's value with others in their group.
- Calculating running totals.
- Performing calculations where I still need the original rows to remain visible.

---

## 1. The Basic Structure

A window function commonly looks like this:

```sql
FUNCTION() OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

For example:

```sql
SELECT Full_Name,
       Department,
       GPA,
       RANK() OVER (
           PARTITION BY Department
           ORDER BY GPA DESC
       ) AS Dept_Rank
FROM Students;
```

### What is happening here?

- `RANK()` → calculates the rank.
- `OVER()` → tells SQL that this is a window calculation.
- `PARTITION BY Department` → separates students into departments for the calculation.
- `ORDER BY GPA DESC` → puts the highest GPA first.
- `AS Dept_Rank` → gives the calculated column a name.

---

## 2. What I Learnt About `PARTITION BY`

`PARTITION BY` is basically how I tell SQL:

> **"Do this calculation separately for each group."**

For example:

```sql
PARTITION BY Department
```

means:

> Rank the students separately within each department.

Without `PARTITION BY`, the ranking is performed across the entire result set.

### Example

Without partitioning:

```text
Student A → 1
Student B → 2
Student C → 3
Student D → 4
```

With:

```sql
PARTITION BY Department
```

the ranking can restart for every department:

```text
Computer Science
Student A → 1
Student B → 2

Mathematics
Student C → 1
Student D → 2
```

So whenever a question says something like:

> "within each department"

> "for each category separately"

> "rank within each group"

I should immediately think:

**`PARTITION BY`**

### A useful question to ask myself

Before adding `PARTITION BY`, I should ask:

> **"Does this calculation need to restart for different groups?"**

If the answer is no, I probably don't need `PARTITION BY`.

---

## 3. Error I Made — Using `PARTITION BY Title` When Ranking All Books

The Chapter 6 exercise asked:

> Rank all books by publication year, most recent first.

My attempt was:

```sql
SELECT Title, Author, Year_Published
    RANK() OVER (
        PARTITION BY Title
        ORDER BY Year_Published DESC
    ) AS Yr_Rank
FROM Books;
```

There were two problems.

### Problem A — Missing comma

I forgot the comma between:

```text
Year_Published
```

and:

```text
RANK()
```

It should be:

```sql
Year_Published,
RANK()
```

### Problem B — Unnecessary `PARTITION BY Title`

The question said **rank all books**.

It did not say to rank books separately by title.

Using:

```sql
PARTITION BY Title
```

would create a separate partition for each title.

I needed one overall ranking, so the correct query was:

```sql
SELECT Title,
       Author,
       Year_Published,
       RANK() OVER (
           ORDER BY Year_Published DESC
       ) AS Yr_Rank
FROM Books;
```

### What I Learnt

I saw `PARTITION BY` in the chapter and tried to use it without first asking whether the question actually required separate groups.

The important habit is:

> **Don't use a SQL concept simply because I just learnt it. First ask whether the question requires it.**

---

## 4. Ranking Functions

Chapter 6 introduced different ranking functions.

### `ROW_NUMBER()`

Every row receives a unique position.

```text
1
2
3
4
```

Even if two rows have the same value, they still receive different numbers.

### `RANK()`

Tied values receive the same rank, and gaps appear after the tie.

For example:

```text
1
2
2
4
```

### `DENSE_RANK()`

Tied values receive the same rank, but there are no gaps.

For example:

```text
1
2
2
3
```

### Easy way to remember

```text
ROW_NUMBER()
→ Everybody gets a unique position.

RANK()
→ Ties share a rank, and gaps appear.

DENSE_RANK()
→ Ties share a rank, but no gaps.
```

---

## 5. `GROUP BY` vs Window Functions

This was one of the most important distinctions in the chapter.

### `GROUP BY`

`GROUP BY` groups rows and **reduces them**.

For example, if I group students by department, I can get one row per department.

### Window Function

A window function calculates across rows **while keeping the individual rows**.

This means I can calculate a student's rank within their department while still seeing the student's name, department, and GPA.

A simple way to remember it:

> **`GROUP BY` reduces rows. Window functions keep the rows.**

---

## 6. Business Questions I Can Solve With Window Functions

Window functions become useful when a business question needs a calculation across rows while still keeping the individual records.

### Employee Performance

> Who are the top 3 employees in each department based on sales?

Possible approach:

```sql
RANK() OVER (
    PARTITION BY Department
    ORDER BY Sales DESC
)
```

### Sales

> What is each sale's running total throughout the year?

Possible approach:

```sql
SUM(Amount) OVER (
    ORDER BY Sale_Date
)
```

### Customers

> How does each customer's spending compare with other customers in their region?

A window calculation can calculate values across each region while keeping every customer visible.

### Products

> Which products are the highest-selling products in each category?

A ranking window function can rank products within each category.

### Students

> Who has the highest GPA in each department?

A ranking function with:

```sql
PARTITION BY Department
```

can solve this.

### The common pattern

> **I need to compare or calculate across rows, but I still want to keep the individual rows.**

That is where window functions become useful.

---

## 7. Why Does `WHERE dept_rank = 1` Fail?

This was Chapter 6 Exercise 3.

Suppose I write:

```sql
SELECT Full_Name,
       Department,
       GPA,
       RANK() OVER (
           PARTITION BY Department
           ORDER BY GPA DESC
       ) AS Dept_Rank
FROM Students
WHERE Dept_Rank = 1;
```

It fails because `Dept_Rank` is produced by the window function, but `WHERE` is evaluated before that window-function result is available at the same query level.

In other words, SQL has not made `Dept_Rank` available yet when `WHERE` is trying to use it.

A simplified mental model of the relevant processing order is:

```text
FROM
→ WHERE
→ GROUP BY
→ HAVING
→ window calculations
→ ORDER BY
```

So:

```sql
WHERE Dept_Rank = 1
```

is trying to use something that hasn't been calculated yet.

### How do I solve it?

Put the window-function query inside a subquery first:

```sql
SELECT *
FROM (
    SELECT Full_Name,
           Department,
           GPA,
           RANK() OVER (
               PARTITION BY Department
               ORDER BY GPA DESC
           ) AS Dept_Rank
    FROM Students
) AS ranked_students
WHERE Dept_Rank = 1;
```

Now the inner query produces `Dept_Rank`.

The outer query can then filter it.

A CTE could also be used for the same general idea.

---

## 8. My Answer for `05-Notes`

> `WHERE dept_rank = 1` fails directly after a window function because the `WHERE` clause is evaluated before the window-function result is available at that query level. SQL therefore cannot use `dept_rank` in the `WHERE` clause at that stage. I need to calculate the rank in a subquery or CTE first, and then use an outer query to filter `dept_rank = 1`.

---

## 9. More Lessons From My Mistakes

### Don't automatically use the newest concept I learnt

Just because I learnt `PARTITION BY` doesn't mean every ranking question needs it.

I need to read the question first and determine whether the calculation should:

- happen across the entire result set, or
- restart separately for different groups.

### Translate the question before writing the SQL

For example:

> "Rank all books."

My thinking should be:

```text
What am I ranking?
→ Books

How?
→ By publication year

Do I need separate groups?
→ No

Therefore:
→ RANK() OVER (ORDER BY Year_Published DESC)
```

For:

> "Rank students within each department."

My thinking becomes:

```text
What am I ranking?
→ Students

How?
→ By GPA

Do I need separate groups?
→ Yes

Separate according to what?
→ Department

Therefore:
→ RANK() OVER (
     PARTITION BY Department
     ORDER BY GPA DESC
   )
```

The phrase **"within each ___ separately"** is a major clue for `PARTITION BY`.

---

## 10. Key Takeaways

- Window functions calculate across rows while keeping the individual rows visible.
- `GROUP BY` groups rows and reduces them; window functions do not collapse the original rows.
- `OVER()` defines the window for a window function.
- `PARTITION BY` means the calculation is performed separately for each group.
- `ORDER BY` inside `OVER()` determines the order used by the window calculation.
- `ROW_NUMBER()` gives every row a unique position.
- `RANK()` gives tied rows the same rank and leaves gaps after ties.
- `DENSE_RANK()` gives tied rows the same rank without leaving gaps.
- I should not automatically use `PARTITION BY`; I should first determine whether the question requires the calculation to restart for different groups.
- A window-function result cannot simply be filtered with `WHERE` at the same query level because the window calculation is not available when `WHERE` is evaluated.
- If I need to filter a window-function result, I can calculate it in a subquery or CTE first and filter it in an outer query.
- The most important skill is translating the question into the calculation it requires.

---

## Final Chapter 6 Note

The biggest thing I learnt from this chapter is that SQL is not just about knowing functions.

I can know `RANK()`, `PARTITION BY`, `ROW_NUMBER()` and `DENSE_RANK()` and still get stuck if I don't understand what the question is actually asking.

So when I get a window-function question, I should slow down and ask:

> **What am I calculating?**

> **What am I comparing?**

> **Do I need to do it separately for each group?**

> **Do I need to keep the individual rows?**

Once I can answer those questions, the SQL becomes much easier to construct.
