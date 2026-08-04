# Chapter 2 – Filtering & Sorting

## Filtering
Filtering is a concept in SQL that answers the question "Which rows do I want". It doesn't matter if the data needed is in between rows or it's at the end of a database with 100 rows, filtering would extract the row as far as it checks the condition. Business questions like "What products are out of stock?" or "Where do most of our remote workers live?" or "Which students are in Computer Science?" need the filtering concept to get their answer.

### "Why Businesses Use Filtering"
- To find specific customers or products.
- To identofy high-performing or low-performing records.
- To detect problems e.g. overdue payments, low inventory.
- To create targeted reports.
- To support data-driven decision-making.

---

## Sorting
While filtering answers "What rows do I want?", sorting on the other hand answers the question "In what order do I want them?". This concept helps to rearrange rows after they've been sorted out. It could be rearranged in alphabetical order or descending order. Queries that use sorting answer business questions like "Who are our highest paid employees?" or "What products are the cheapest?" or "Which students have the highest GPA?".

### "Why Businesses Use Sorting"
- To identify top performers.
- To prioritize important records.
- To spot trends and patterns.
- To improve decision-making.
- To improve readability.

Filtering and Sorting are important aspects of data because they help with analysis and research.

---

## WHERE
WHERE filters rows out. It answers the command "Only give me the rows that match this condition". A sample SQL query:

```sql
SELECT *
FROM goals
WhERE status = 'active';
```

The above SQL query only returns rows whose status are active. Simple and easy. Rather than skimming hundreds of rows which would take hours, this simple SQL function helps to make jobs easier.

---

## ORDER BY
ORDER BY sorts the rows that made it past WHERE. This just means: SQL runs in steps, and ORDER BY happens after WHERE.

```sql
SELECT *
FROM progress
ORDER BY created_at;
```

Select all the columns from the table "goals" and arrange them in ascending order using the column "created_at".

### DESC
DESC stands for ordering in DESCending order. ORDER BY automatically assumes you want your result in ascending order. So DESC order gives the opposite result.

```sql
SELECT *
FROM scores
ORDER BY score DESC;
```

Select all the columns from the table "scores" and arrange the scores from biggest to smallest.

---

## LIMIT
LIMIT restricts the number of rows returned. It's great for when you have business question that only want 5 final rows out of all the rows. It's also good for pagination.

```sql
SELECT *
FROM users
ORDER BY followers DESC LIMIT 10;
```

Select all columns from the table "users", arrange the table in descending order using the column "users" and extract the top 10 from the entire list.

---

## DISTINCT
DISTINCT like the word implies means to remove duplicates. If there are 10 places where "Computer Science" is mentioned in a column, just one "Computer Science" would serve to represent all the ten.

```sql
SELECT DISTINCT city
FROM users;
```

List each city once.

---

## LIKE
LIKE is used for pattern matching in SQL. In PostgreSQL, LIKE is case-sensitive. Some other database systems (such as MySQL with many default collations) treat LIKE as case-insensitive by default. There are two wildcards which are much more powerful than I realised includes:
1. "%" = any number of characters
2. "_" = exactly one character

```sql
SELECT *
FROM goals
WHERE title LIKE 'Read%';
```

Select all columns from the table "goals", extract the rows that start with "Read" from the "title" column.

```sql
SELECT * 
FROM users
WHERE email LIKE '%@gmail.com';
```

Select all columns from the table "users", extract the rows that end with "@gmail.com" from the "email" column.

```sql
SELECT *
FROM tasks
WHERE name LIKE 'Plan_';
```

Select all columns from the table "tasks", extract the rows that start with "Plan" and has another letter at the back e.g. Plane, from the "name" column.


### ILIKE
Same as LIKE but it's not case-sensitive. This is Postgres-specific. MySQL doesn't have this, it just uses LIKE which is alreadt case-insensitive.

```sql
SELECT *
FROM goals
WHERE title ILIKE 'echo%';
```

Select all columns from the table "goals", extract the rows that start with "echo" or "Echo" or "ECHO" (Since it's supposed to be case-insensitive) from the "title" column.

---

## Common Errors I Encountered

## Issue 1: Can one SQL file use tables created in another SQL file?

### My question: "I have a separate .sql file for each chapter. Chapter 2 depends on the tables created in Chapter 1. How do I connect them?"

### What I thought
I thought SQL files somehow needed to be "linked" together.

### What I learned
SQL files do not connect to each other. Instead, every SQL file sends commands to the same database.

## Issue 2: Why was my Query Tool blank in pgAdmin?

### My question: "I saved my SQL file on Sunday, but when I opened the Query Tool on Tuesday, it was blank."

### What I thought
I thought my work had disappeared.

### What actually happened
Clicking Query Tool creates a new empty query editor. It does not automatically open my saved SQL file.

My SQL file was still safely stored on my computer.

### How to open an existing SQL file
- Open the Query Tool.
- Click File → Open (or the folder icon).
- Select the .sql file.

Now the saved code appears.

## Issue 3: Why couldn't Chapter 2 find the table from Chapter 1?

### What I discovered
I had created a new PostgreSQL database for every chapter.

My databases looked like this:
Databases
├── Chapter One Exercise
├── Chapter One
├── Chapter Two
└── postgres

That meant:
Chapter 1's table was stored in Database A.
Chapter 2 was running in Database B.

Those databases are separate. They cannot automatically share tables.

### How I solved it

I created one database: Learning_SQL
Now every chapter uses: Learning_SQL
instead of creating new databases.

---

## Notes From Today's Lesson

#### - Never forget to add a semicolon after every complete query. 
#### - Also remember that space is considered as a character.
#### - Order of functions in SQL: FROM >> WHERE >> GROUP BY >> HAVING >> SELECT >> ORDER BY >> LIMIT.

---

## Key Takeaways

- WHERE filters rows.
- ORDER BY sorts rows.
- LIMIT restricts the number of rows returned.
- DISTINCT removes duplicate values.
- LIKE searches using patterns.
- ILIKE performs case-insensitive pattern matching in PostgreSQL.

---

## Interview Questions

### Q1. What's the difference between WHERE and ORDER BY?
WHERE filters rows.
ORDER BY changes the order of rows.

### Q2. Why would a business use LIMIT?
To return only the top N results such as the top 10 customers or top 5 selling products.

### Q3. What is DISTINCT?
DISTINCT removes duplicate values from the returned result.