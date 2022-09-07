-- Persons schema
| Field       | Type      | Null | Key | Default | Extra          |
+-----------------------------------------------------------------+
| id          | int(11)   | NO   | PRI | NULL    | auto_increment |
| name        | varchar   |      |     | NULL    |                |
| age         | int(11)   |      |     | NULL    |                |
| parent_id   | int(11)   | YES  |     | NULL    |                |
+-----------------------------------------------------------------+

-- persons table
CREATE TABLE persons(
      id INTEGER NOT NULL PRIMARY KEY,
      name VARCHAR NULL,
      age INTEGER NULL,
      parent_id INTEGER NULL
);


-- Query to fetch a person's grandparent assuming the person's id is 3
SELECT * from persons WHERE id=(SELECT parent_id from persons WHERE id=(SELECT parent_id from persons WHERE id=3));

-- Query to fetch a person's children assuming the person's id is 3
SELECT * from persons WHERE parent_id=3

-- How would the above queries perform in a table with a millions of entries?
/*  I dont 

