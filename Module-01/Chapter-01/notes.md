# Chapter 1 – Introduction to Databases

## What is a Database?

A database is a system used to store, organize, and manage data in a structured way.

One way I think about it is as an Excel workbook containing multiple worksheets (tables). However, unlike Excel, databases can enforce rules, create relationships between tables, and securely manage large amounts of data.

A database usually contains one or more related tables.

---

## Tables

A table is made up of:

- Rows (Records): Each row represents a single piece of data.
- Columns (Fields): Each column stores one type of information.

Example:

| student_id | name  | class_id |
|------------|-------|----------|
|     1      | Sarah |    101   |
|     2      | David |    102   |

---

## Relationships Between Tables

Tables can be connected using keys.

For example:

### Students

| student_id |  name | class_id |
|------------|-------|----------|
|     1      | Sarah |    101   |

### Classes

| class_id |     class_name   |
|----------|------------------|
|    101   | Computer Science |

In this example, `class_id` in the **Students** table is a **Foreign Key** because it refers to the `class_id` in the Classes table.

Using relationships:

- avoids repeating data
- keeps data consistent
- makes referencing information easier

---

## Database Rules (Constraints)

When I first learned about databases, I wasn't sure what "rules" meant.

I realized they are simply constraints that help keep data clean, accurate, and consistent.

Some common rules include:

### Primary Key

Every row must have a unique identifier.

Duplicate values are not allowed.

### Foreign Key

A value cannot reference another table unless that referenced value already exists.

### Data Types and NOT NULL

Each column should store the correct type of data.

Some columns may also be required to always contain a value.

Without these rules, databases can end up with duplicate records, invalid references, or missing information.

---

## Database Security

Database security controls WHO can access data and WHAT they are allowed to do with it.

Some common security measures include:

- Login and Password Authentication
- User Roles and Permissions
- Data Encryption
- Backups
- Audit Logs

---

# Notes from My First SQL Query

## SERIAL PRIMARY KEY

```sql
id SERIAL PRIMARY KEY
```

- `SERIAL` automatically generates numbers starting from 1 and increments them for each new row.
- `PRIMARY KEY` makes the column unique and prevents duplicate values.

---

## VARCHAR(100)

```sql
title VARCHAR(100)
```

`VARCHAR` stands for VARiable CHARacter.

The number in parentheses specifies the maximum number of characters allowed.

---

## NUMERIC(3,2)

```sql
price NUMERIC(3,2)
```

This means:

- Up to 3 total digits
- 2 of which are after the decimal point

Examples: 9.99, 5.50
Wrong: 25.999

---

## Every SQL Statement Ends with a Semicolon

```sql
SELECT * FROM Books;
```

The semicolon (`;`) marks the end of a SQL statement.

---

# Common Errors I Encountered

## Error

```
relation "Books" already exists
```

### Cause

The `Books` table already existed in the database.

SQL does not allow two tables with the same name.

### Solution

```sql
DROP TABLE IF EXISTS Books;
```

This removes the existing table before creating a new one.

---

## Error

Using an apostrophe inside a string.

Example:

```sql
'James's Book'
```

### Cause

SQL uses single quotes to define strings.

The apostrophe in **James's** prematurely closes the string.

### Solution

Escape the apostrophe by doubling it.

```sql
'James''s Book'
```

---

# Key Takeaways

- A database stores multiple related tables.
- Tables are made up of rows and columns.
- Keys create relationships between tables.
- Constraints help keep data accurate.
- Security controls who can access data.
- SQL statements end with a semicolon.
- Reading error messages carefully often points directly to the problem.