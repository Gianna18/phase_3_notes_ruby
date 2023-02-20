Writing INNER JOINs
Let's write an INNER JOIN query that will return the name and breed of the cat along with the name of that cat's owner:

SELECT cats.name, cats.breed, owners.name
FROM cats
INNER JOIN owners
ON cats.owner_id = owners.id;

The above statement should return the following:

name             breed            name
---------------  ---------------  ----------
Maru             Scottish Fold    mugumogu
Hana             Tabby            mugumogu
Nona             Tortoiseshell    Sophie

Let's run that query again, this time aliasing the name column of the owners table as owners_name, using the AS keyword:


SELECT
  cats.name,
  cats.breed,
  owners.name AS "owner_name"
FROM cats
INNER JOIN owners
ON cats.owner_id = owners.id;

This should return:

name             breed            owner_name
---------------  ---------------  ----------
Maru             Scottish Fold    mugumogu
Hana             Tabby            mugumogu
Nona             Tortoiseshell    Sophie


A LEFT JOIN query returns all rows from the left, or first, table, regardless of whether or not they met the JOIN condition. The query will also return the matched data from the right, or second, table.

In the case of data from the first table that doesn't meet our JOIN condition, the resulting output will include NULL, or empty, values for the missing matched columns.

Let's take a look at a boiler-plate LEFT JOIN:

SELECT column_name(s)
FROM first_table
LEFT JOIN second_table
ON first_table.column_name = second_table.column_name;

SELECT cats.name, cats.breed, owners.name
FROM cats
LEFT OUTER JOIN owners
ON cats.owner_id = owners.id;
You should see the following output returned to you:

name             breed            name
---------------  ---------------  ----------
Maru             Scottish Fold    mugumogu
Hana             Tabby            mugumogu
Nona             Tortoiseshell    Sophie
Lil' Bub         perma-kitten

Here, our LEFT JOIN has returned to us all of the cats (including Lil' Bub!), with matched data regarding owner's name for those cats that have an owner, and empty space in the owner's name column for the cat that doesn't have an owner.