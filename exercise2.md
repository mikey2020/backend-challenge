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
