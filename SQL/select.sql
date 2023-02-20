SELECT name FROM cats;
can also be written like This

SELECT cats.name FROM cats;

SELECT cats.name, dogs.name FROM cats, dogs;


To output your table in a beautiful format, enter the following settings before running your query:
sqlite> .headers on
sqlite> .mode column
sqlite> .width auto