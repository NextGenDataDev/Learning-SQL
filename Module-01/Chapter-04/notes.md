# Chapter 4 – JOINs

## What is a JOIN?

A JOIN combines two or more related tables into one result using a common column (usually a Primary Key and a Foreign Key).

Instead of storing all information in one huge table, databases split data into multiple related tables. JOINs allow SQL to bring those tables back together whenever we need information from both.

For example:

- Students + Courses → Which student is enrolled in which course?
- Books + Borrowers → Who borrowed which book?

Without JOINs, related information would remain separated across different tables.

---

## Why Businesses Use JOINs

Businesses often store information in separate tables to reduce duplicate data and improve organization.

JOINs allow them to answer questions such as:

- Which customers placed orders this month?
- Which employee works in which department?
- Which borrower currently has each book?
- Which products have never been sold?

Without JOINs, answering these questions would be difficult because the required information exists in different tables.

---

## INNER JOIN

**INNER JOIN** returns only the rows that have matching values in both tables.

Think of it as saying:

> "Show me only the matches."

### Example

Students Table

| Student | Course_ID |
|---------|-----------|
| Alice | 1 |
| Ben | 2 |
| David | NULL |

Courses Table

| Course_ID | Course |
|-----------|--------|
| 1 | SQL |
| 2 | Python |
| 3 | Excel |

```sql
SELECT Students.Student_Name, Courses.Course_Name
FROM Students
INNER JOIN Courses
ON Students.Course_ID = Courses.Course_ID;
```

### Result

| Student | Course |
|---------|--------|
| Alice | SQL |
| Ben | Python |

David does not appear because he is not enrolled in any course.

The Excel course also does not appear because no student is enrolled in it.

---

## LEFT JOIN

A **LEFT JOIN** returns every row from the left table and only the matching rows from the right table.

Think of it as saying:

> "Keep everything on the left."

The left table is simply the table written first after the `FROM` statement.

### Example

```sql
SELECT Students.Student_Name, Courses.Course_Name
FROM Students
LEFT JOIN Courses
ON Students.Course_ID = Courses.Course_ID;
```

### Result

| Student | Course |
|---------|--------|
| Alice | SQL |
| Ben | Python |
| David | NULL |

David still appears even though he has no matching course.

`NULL` does **not** mean zero.

It simply means **no matching value was found**.

---

## RIGHT JOIN

A **RIGHT JOIN** returns every row from the right table and only the matching rows from the left table.

Think of it as saying:

> "Keep everything on the right."

It is essentially the opposite of a LEFT JOIN.

### Example

```sql
SELECT Students.Student_Name, Courses.Course_Name
FROM Students
RIGHT JOIN Courses
ON Students.Course_ID = Courses.Course_ID;
```

### Result

| Student | Course |
|---------|--------|
| Alice | SQL |
| Ben | Python |
| NULL | Excel |

The Excel course still appears because RIGHT JOIN keeps every row from the Courses table.

---

## Choosing the Right JOIN

| JOIN Type | Returns |
|-----------|---------|
| INNER JOIN | Only matching rows from both tables |
| LEFT JOIN | Every row from the left table and matching rows from the right table |
| RIGHT JOIN | Every row from the right table and matching rows from the left table |

A simple way to remember them:

- **INNER** = Only the matches.
- **LEFT** = Keep everything on the left.
- **RIGHT** = Keep everything on the right.

Whenever writing a JOIN, ask yourself:

> **"Which table do I NOT want to lose rows from?"**

The answer usually tells you which JOIN to use.

---

## Common Errors I Encountered

### Issue 1: Understanding how INSERT works with related tables

#### Problem

I found it confusing how two separate tables become connected.

#### What I learned

The tables are **not** connected by the `INSERT` statement itself.

Instead, they become related because they contain matching key values.

For example:

Books

| Book_ID | Title |
|---------|-------|
| 1 | SQL Basics |

Borrowers

| Borrower_ID | Book_ID | Borrower_Name |
|-------------|---------|---------------|
| 1 | 1 | Sarah |

The value `Book_ID = 1` exists in both tables.

The JOIN uses those matching values to connect the rows.

---

### Issue 2: Forgetting the ON clause

#### Problem

Without an `ON` condition, SQL doesn't know how the tables should be matched.

#### Result

The query may produce an error or return a huge number of incorrect combinations (a Cartesian product).

#### Solution

Always specify the relationship using the `ON` clause.

---

### Issue 3: Joining on the wrong column

#### Problem

Joining unrelated columns such as:

```sql
Students.Student_ID = Courses.Course_ID
```

produces meaningless results.

#### Solution

Always join columns that represent the relationship between the tables.

---

### Issue 4: Duplicate rows

#### Problem

I thought SQL was duplicating data.

#### What I learned

If one record matches multiple records in another table, SQL returns one row for each valid match.

The data isn't duplicated—it simply has multiple matching relationships.

---

### Issue 5: NULL values

#### Problem

At first, I thought `NULL` meant zero.

#### What I learned

`NULL` means **no matching value exists**.

It does **not** represent the number zero.

---

### Issue 6: Remembering RIGHT JOIN

#### Problem

I found RIGHT JOIN confusing because I kept forgetting which table it preserved.

#### What I learned

It's often easier to rewrite the query as a LEFT JOIN by swapping the order of the tables.

---

## Business Applications

### INNER JOIN

- Which customers placed orders this month?
- Which students are enrolled in courses?

### LEFT JOIN

- Show all products, including products with zero sales.
- Show all books, including books that have never been borrowed.

### RIGHT JOIN

- Show every department, even if no employees belong to it.
- Show every course, even if no students are enrolled.

---

## Key Takeaways

- JOIN combines related tables using matching key values.
- Every JOIN should include an `ON` clause.
- INNER JOIN returns only matching rows.
- LEFT JOIN keeps every row from the left table.
- RIGHT JOIN keeps every row from the right table.
- `NULL` means no matching value exists.
- Duplicate rows after a JOIN are often expected when one record matches multiple records.
- Always check your row count after a JOIN.

---

## Interview Questions

### What is a JOIN?

A JOIN combines two or more related tables into a single result using matching key values.

---

### What's the difference between INNER JOIN and LEFT JOIN?

- **INNER JOIN** returns only matching rows.
- **LEFT JOIN** returns every row from the left table, even if there is no match.

---

### Why is the ON clause important?

The `ON` clause tells SQL how the tables are related. Without it, SQL cannot correctly match rows.

---

### What does NULL mean after a LEFT JOIN?

It means there was no matching row in the joined table.

---

### Why do JOINs sometimes create duplicate rows?

Because one row in one table can legitimately match multiple rows in another table. SQL returns every valid match.