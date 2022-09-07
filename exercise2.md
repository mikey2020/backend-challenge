# Exercise 2
## persons schema

| Field       | Type      | Null | Key | Default | Extra          |
| ----------- | --------- | ---- | --- | ------- | -------------- |
| id          | int(11)   | NO   | PRI | NULL    | auto_increment |
| name        | varchar   |      |     | NULL    |                |
| age         | int(11)   |      |     | NULL    |                |
| parent_id   | int(11)   | YES  |     | NULL    |                |
+-----------------------------------------------------------------+


## Query to fetch a person's grandparent assuming the person's id is 3
- SELECT * from persons WHERE id=(SELECT parent_id from persons WHERE id=(SELECT parent_id from persons WHERE id=3));

## Query to fetch a person's children assuming the person's id is 3
- SELECT * from persons WHERE parent_id=3

## How would the above queries perform in a table with a millions of entries?
The query for finding a person's children would do well no matter the size of the table's data 
but the query for finding a person's will not do so well because of the presence of subqueries, 
on a table with minimal data it would be okay but when there are millions of entries it would be inefficient.

## Is there anything you would add to increase performance?
There are a couple of things that would increase the performance of the queries.
* At the infrastructure level when dealing with a DB of the size mentioned above
  adding an extra database for reads would increase overall performance.
                    
* As I mentioned above the query for finding a person's grandparent is not scalable because of the presence of subqueries which are very inefficient but especially when dealing with data at a massive scale, I would rewrite the query in a more efficient way using a JOIN specifically a Self Join since we are only interacting with one table this should improve the
performance of the query since the DB only has to make a single trip to retrieve the data.
``` SELECT p3.name, p3.age FROM persons p1, persons p2, persons p3 WHERE p1.id = 4 AND p1.parent_id = p2.id AND p2.parent_id = p3.id; ```

* Another way to improve performance would be to add an index to the `parent_id` column this would improve all queries involving the column which should improve the queries.
