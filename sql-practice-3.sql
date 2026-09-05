

USE MyDatabase;


CREATE TABLE IF NOT EXISTS persons(
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * FROM persons;

SELECT DATABASE();

ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL;

ALTER TABLE persons
DROP COLUMN phone 
;
INSERT INTO persons(first_name,country,score)
VALUES (6,'Anna','USA',NULL),
(7,'Sam', NULL,100);

