-- create a table
CREATE TABLE persons(
      id INTEGER NOT NULL PRIMARY KEY,
      name INTEGER NULL,
      age INTEGER NULL,
      parent_id INTEGER NULL
);

-- insert some values
INSERT INTO persons VALUES (1, "Mike", 70, null);
INSERT INTO persons VALUES (2, "Johnathan", 50,1);
INSERT INTO persons VALUES (3, "Clark", 30, 2);
INSERT INTO persons VALUES (4, "Lana", 20, 2);
INSERT INTO persons VALUES (5, "Chloe", 20, 2);
INSERT INTO persons VALUES (6, "Lucy", 40,1);
INSERT INTO persons VALUES (7, "Mercy", 10,6);

-- fetch a person's grandchildren
-- should return Clark, Lana, Chloe, and Mercy
SELECT p3.name, p3.age FROM persons p1, persons p2, persons p3 WHERE p1.id = 1 AND p2.parent_id = p1.id AND p3.parent_id = p2.id;

-- fetch a person's children
SELECT * from persons WHERE parent_id=2

