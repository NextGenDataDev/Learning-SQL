# Chapter 7 — Python Basics

## So… what is Chapter 7 really about?

Chapter 7 introduces the foundations of Python.

The goal isn't just to memorise Python syntax. It's to understand how Python reads and executes my code, how different types of data behave, and how to recognise what went wrong when something doesn't work.

These basics will become important later when I start working with data using Python.

---

## 1. Variables

A variable is a name that I give to a value so I can use that value later.

```python
name = "Data Muse"
gpa = 4.50
age = 20
```

Here:
- `name` stores a string.
- `gpa` stores a floating-point number.
- `age` stores an integer.

The important idea is:

> **A variable allows me to store information and refer to it by a name.**

---

## 2. Python Reads Code From Top to Bottom

Python generally executes my code in order.

```python
name = "Data Muse"
print(name)
```

This works because Python creates `name` before trying to use it.

But:

```python
print(name)
name = "Data Muse"
```

will produce an error because Python reaches `print(name)` before `name` has been defined.

So when Python gives me an error, I should check what happened before the line that failed.

---

## 3. Data Types

A data type tells Python what kind of value it is dealing with.

### `str` — String

Used for text.

```python
name = "Data Muse"
```

### `int` — Integer

Used for whole numbers.

```python
age = 20
```

### `float` — Floating-point number

Used for numbers containing decimal values.

```python
gpa = 4.50
```

### `bool` — Boolean

Used for `True` or `False`.

```python
is_student = True
```

I can check the type of a value using `type()`:

```python
print(type(name))
print(type(gpa))
```

`type()` tells me the data type of a value.

---

## 4. Basic Arithmetic

Python can perform normal mathematical operations.

### Addition

```python
10 + 5
```

Result: `15`

### Subtraction

```python
10 - 5
```

Result: `5`

### Multiplication

```python
10 * 5
```

Result: `50`

### Division

```python
10 / 5
```

Result: `2.0`

### Floor Division

```python
10 // 3
```

Result: `3`

`//` performs **floor division**. It returns the greatest integer less than or equal to the result.

### Modulus

```python
10 % 3
```

Result: `1`

`%` gives the remainder after division.

### Exponentiation

```python
2 ** 3
```

Result: `8`

`**` means "raise to the power of."

---

## 5. Case Sensitivity

Python is case-sensitive.

That means:

```python
name
```

and:

```python
Name
```

are treated as two different names.

```python
name = "Data Muse"
print(Name)
```

will cause an error because I created `name`, not `Name`.

So I need to be consistent with how I spell and capitalise variable names.

---

## 6. Indentation Matters

**Indentation** means the spaces at the beginning of a line.

Python uses indentation to show which lines belong to a block of code.

Later, when I work with structures such as `if` statements and loops, indentation will tell Python which instructions belong inside that structure.

I don't need to master those structures yet, but I should remember:

> **In Python, indentation is part of the syntax.**

---

## 7. `print()`

`print()` displays information in the output.

```python
name = "Data Muse"
print(name)
```

Output:

```text
Data Muse
```

I can also print calculations:

```python
print(10 + 5)
```

Output:

```text
15
```

---

## 8. Errors Are Clues, Not Just Problems

A traceback isn't just scary red text.

> **It is a clue about what went wrong.**

When I get an error, I should not immediately panic or copy the error into Google.

I should first ask:

1. Where did the error happen?
2. Which line caused it?
3. What type of error is it?
4. What does the error message actually say?
5. What was Python trying to do?

This helps me understand the problem instead of simply copying someone else's solution.

---

## 9. Common Error: `NameError`

A `NameError` can happen when I try to use a variable that Python doesn't know.

```python
print(name)
```

If I haven't previously created `name`, Python doesn't know what `name` means.

A useful debugging checklist is:

- Did I spell the variable correctly?
- Did I use the correct capitalisation?
- Did I create the variable before using it?
- Did I accidentally use a different variable name?

---

## 10. Common Error: `TypeError`

A `TypeError` can happen when I try to perform an operation that isn't supported between the types of values involved.

```python
age = 20
name = "Data Muse"

print(age + name)
```

Python cannot meaningfully add an integer and a string together in this way, so it raises a `TypeError`.

The lesson is:

> **Before performing an operation, I should think about the types of the values involved.**

---

## 11. Practical Thinking With Python

Instead of only practising random calculations, I should connect basic Python to questions that resemble real problems.

For example:

> If a student has scores of 75, 82 and 91, what is their average?

I can break the problem down:

```text
What information do I have?
→ Three scores.

What do I need?
→ Their average.

What operation do I need?
→ Add the scores and divide by 3.
```

Then:

```python
score1 = 75
score2 = 82
score3 = 91

average = (score1 + score2 + score3) / 3

print(average)
```

This is the same problem-solving habit I have been developing with SQL.

---

## 12. A Question About Dates

A question such as:

> "How many days are left until December 31, 2026?"

is a good example of a problem that may require a tool or concept I haven't learnt yet.

At this stage, I can practise the arithmetic manually.

Later, Python's `datetime` module will allow me to work with dates properly.

The important lesson is:

> **Not knowing the right tool yet doesn't mean I can't understand the problem.**

---

## 13. How I Should Approach Python Problems

When I get a Python question, I shouldn't immediately ask:

> **"What code am I supposed to write?"**

Instead, I should ask:

1. What information do I have?
2. What am I being asked to produce?
3. What type of data am I working with?
4. What operation do I need?
5. What does Python need to know before it can do this?

Then I can start writing the code.

If the code fails:

1. Read the error.
2. Find the line mentioned.
3. Identify the type of error.
4. Think about what Python was trying to do.
5. Try to fix it myself.
6. Research only if I'm genuinely stuck.

I don't want to develop the habit of seeing an error and immediately searching for the answer.

I want to develop the ability to **understand the problem first**.

---

## 14. What I Should Remember About Learning Python

I don't need to memorise every piece of syntax immediately.

I need to understand:

- What the code is doing.
- What type of data I am working with.
- Why Python behaves the way it does.
- What the error is telling me.
- How to break a problem into smaller pieces.

The syntax will become easier with practice.

The problem-solving ability is what I really want to build.

---

## Key Takeaways

- Variables allow me to store values and refer to them by name.
- Python generally executes code from top to bottom.
- A variable needs to be defined before I can use it.
- Basic data types include `str`, `int`, `float`, and `bool`.
- `type()` tells me the data type of a value.
- Python can perform arithmetic using operators such as `+`, `-`, `*`, `/`, `//`, `%`, and `**`.
- `//` performs floor division.
- `%` returns the remainder after division.
- Python is case-sensitive.
- Indentation is part of Python's syntax.
- `print()` displays information in the output.
- A traceback gives me clues about what went wrong.
- `NameError` can occur when Python cannot find the name I am trying to use.
- `TypeError` can occur when an operation is not supported between the types involved.
- I should think about the problem before trying to write the code.
- When I get stuck, I should understand and investigate the error before immediately searching for a solution.

---

## Final Chapter 7 Note

The biggest thing I want to take from this chapter is that learning Python isn't just about remembering commands.

I can know what `int`, `float`, `print()`, and `//` mean and still struggle if I don't know how to approach a problem.

So when I get a Python question, I should slow down and ask:

> **What information do I have?**

> **What am I being asked to produce?**

> **What type of data am I working with?**

> **What operation do I need?**

And when my code breaks:

> **What is Python actually telling me?**

I don't want to become someone who sees an error and immediately searches for the answer.

I want to become someone who can look at the problem, reason through it, test an idea, and then research when I genuinely need help.
