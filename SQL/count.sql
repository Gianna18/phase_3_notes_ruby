COUNT
Now, we'll talk about a SQL aggregate function, COUNT.

SQL aggregate functions are SQL statements that operate on groups of records in our database rather than individual records. For example, we can retrieve minimum and maximum values from a column, sum values in a column, get the average of a column's values, or count a number of records that meet certain conditions. 
For now, we'll just focus on COUNT. COUNT will count the number of records that meet a certain condition. Here's a boilerplate SQL query using COUNT:

SELECT COUNT([column name]) FROM [table name] WHERE [column name] = [value]
Let's try it out and count the number of cats who have an owner_id of 1:

SELECT COUNT(owner_id) FROM cats WHERE owner_id = 1;

# GROUP BY
SELECT breed, COUNT(breed) FROM cats GROUP BY breed;

GROUP BY is a great function for aggregating results into different segments — you can even use it on multiple columns!