SELECT * FROM cats ORDER BY age DESC LIMIT 1;
This part of the statement: SELECT * FROM cats ORDER BY age DESC returns all of the cats in order from oldest to youngest. Setting a LIMIT of 1 returns just the first, i.e. oldest, cat on the list.


BETWEEN
As we've already established, being able to sort and select specific data sets is important. Continuing on with our example, let's say we urgently need to select all of the cats whose age is between 1 and 3. To create such a query, we can use BETWEEN. Here's a boilerplate SELECT statement using BETWEEN:

SELECT name FROM cats WHERE age BETWEEN 1 AND 3;