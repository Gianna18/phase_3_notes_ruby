The average, AVG(), function returns the average value of a column. Here's how it works:

SELECT AVG(column_name) FROM table_name;
Let's write a query to grab the average net worth of our very lucrative cats.

SELECT AVG(net_worth) FROM cats;

The sum, SUM(), function returns the sum of all of the values in a particular column.

Here's how it works:

SELECT SUM(column_name) FROM table_name;
Let's try it out by calculating the sum of the net worths of all of our cats:

SELECT SUM(net_worth) FROM cats;

The minimum and maximum aggregator functions return the minimum and maximum values from a specified column respectively.

Here's how it works:

SELECT MIN(column_name) FROM table_name;
SELECT MAX(column_name) FROM table_name;
Let's try it out:

SELECT MIN(net_worth) FROM cats;

The count function returns the number of rows that meet a certain condition.

Here's how it works:

SELECT COUNT(column_name) FROM table_name;
We can use the COUNT() function to calculate the total number of rows in a table that are not NULL. NULL means empty. All of our cats have a name so we can call COUNT on the name column like this:

SELECT COUNT(name) FROM cats;

This should return:

COUNT(name)
--------------------
4
We have a total of four cats in our Cats table with a name. If we really didn't care about a specific column and we just wanted the total number of rows in our database we can call COUNT(*). * means everything. Sometimes it's called the "wildcard." This COUNT(*) will count the rows where at least one column has data in it.

We can also use COUNT() to count the total number of rows in a table that meet a certain condition. Let's use this aggregator to count the number of cats whose net worth is greater than one million:

SELECT COUNT(*) FROM cats WHERE net_worth > 1000000;
This should return:

COUNT(*)
--------------------
1