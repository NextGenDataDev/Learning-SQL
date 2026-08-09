# Chapter 5 — Joins II, Set Operations & Subqueries

## So… what is Chapter 5 really about?

Chapter 5 is basically about **getting SQL to answer questions that are more complicated than just looking at one table and filtering it.**

But how do we handle questions where the answer depends on **another query**?

That’s where **subqueries** come in.

---

## 1. Subqueries

A **subquery** is simply a query inside another query.

Think of it like:

> "Before I can answer this question, I need SQL to answer another question first."

For example:

> **Which students have a GPA higher than the average GPA of all students?**

First, SQL needs to find:

> What is the average GPA of everybody?

```sql
SELECT AVG(gpa)
FROM students;
```

Then it can use that answer to find students above it:

```sql
SELECT full_name
FROM students
WHERE gpa > (
    SELECT AVG(gpa)
    FROM students
);
```

The query inside the parentheses is the **subquery**. It provides the value that the main query needs to answer the larger question.

### Business Question

> "Which employees earn more than the average salary?"

Same thinking:

**First:** Find the average salary.

**Then:** Find employees whose salary is above that average.

---

## 2. Subqueries in `FROM`

But what if the thing we need first is a whole **result table**?

For example:

> **What is the average GPA for each department?**

We can create that result first:

```sql
SELECT department, AVG(gpa) AS avg_gpa
FROM students
GROUP BY department;
```

Then treat that result like a temporary table:

```sql
SELECT dept_summary.department,
       dept_summary.avg_gpa
FROM (
    SELECT department, AVG(gpa) AS avg_gpa
    FROM students
    GROUP BY department
) AS dept_summary;
```

So I'm basically telling SQL:

> "Run this query as part of the larger query and treat its result like a temporary table."

PostgreSQL requires a subquery used in the `FROM` clause to have a name, which is why we use:

```sql
AS dept_summary
```

This name is called an **alias**.

---

## 3. The Tricky One: Comparing Two Levels of Information

This is where Chapter 5 starts getting interesting.

Suppose the business asks:

> **"Which departments have an average GPA higher than the overall average GPA?"**

Wait.

There are actually **two averages** here:

1. Average GPA **per department**
2. Average GPA **of everybody**

So I need SQL to calculate both and then compare them.

This is where I have to stop thinking:

> "What SQL command do I remember?"

and start thinking:

> **"What does this question require me to calculate first?"**

That's the real challenge with SQL.

### Breaking the Question Down

Instead of trying to write the entire query immediately, I can break the question into smaller parts:

**Step 1:** Find the average GPA for each department.

**Step 2:** Find the overall average GPA.

**Step 3:** Compare each department's average with the overall average.

This makes a complicated question much easier to approach.

---

## 4. `UNION`

`UNION` is used when I want to **combine the results of two queries into one result set**.

It essentially stacks the results of one query underneath the results of another.

For example:

> Find students who are in Computer Science OR have a GPA above 4.5.

```sql
SELECT full_name
FROM students
WHERE department = 'Computer Science'

UNION

SELECT full_name
FROM students
WHERE gpa > 4.5;
```

The two queries are executed as separate result sets and then combined.

Both queries must return the **same number of columns**, and the corresponding columns must have compatible data types.

### `UNION` vs `UNION ALL`

What's the difference?

- `UNION` → combines the results and removes duplicate rows.
- `UNION ALL` → combines the results and keeps duplicate rows.

If duplicate removal isn't required, `UNION ALL` is generally preferable because SQL doesn't need to perform the extra work of removing duplicates.

---

## 5. The Main Lesson I'm Taking From Chapter 5

Chapter 5 isn't really about memorising:

> "Subquery goes here."

> "UNION goes here."

It's about learning to **break a difficult question into smaller questions.**

When I see something complicated, I should ask:

> **What information do I need first?**

Then:

> **Can I get that information with another query?**

Then:

> **What am I going to do with the result?**

This is becoming an important part of solving SQL problems.

---

## Errors & Lessons Learned

### Issue 1: Understanding the Exercise

I had issues understanding the second question of the exercise.

Since `HAVING` wasn't used in the example, my mind automatically skipped it and tried to solve the question using only the limited functions and concepts used in the example.

### What I Learned

An exercise isn't necessarily limited to the exact syntax used in the immediately preceding example.

Instead, I need to understand **what the question is actually asking** and then decide which SQL concepts are necessary to solve it.

It's better to:

1. **Read** the question carefully.
2. **Understand** what the question is asking for.
3. **Break** the question into smaller steps.
4. Decide which SQL concepts can answer each step.
5. Write the query.

Trying to solve a question at a glance or simply copying the pattern of the previous example can lead me in the wrong direction.

---

## Key Takeaways

- A **subquery** is a query inside another query.
- Subqueries can provide a value or a result set that the main query needs.
- A subquery in the `FROM` clause can be treated like a temporary result table and must have an alias.
- `UNION` combines the results of two queries and removes duplicate rows.
- `UNION ALL` combines results while keeping duplicates.
- Queries combined with `UNION` must return the same number of columns with compatible data types.
- Complicated SQL questions become easier when they are broken into smaller questions.
- Before writing SQL, I should ask: **"What does this question require me to calculate first?"**
- The concepts shown in an example do not necessarily limit the concepts I can use in an exercise.

---

## Interview Questions

### What is a subquery?

A subquery is a query nested inside another query. It provides information that the main query uses to produce its result.

### What is the difference between `UNION` and `UNION ALL`?

`UNION` combines result sets and removes duplicate rows, while `UNION ALL` combines result sets without removing duplicates.

### What is a subquery in the `FROM` clause?

It is a subquery whose result is treated like a temporary table within the main query. It must have an alias.

### Why must queries combined with `UNION` have compatible columns?

Because SQL needs to combine corresponding columns from both result sets into one result set. Therefore, the queries must return the same number of columns with compatible data types.
