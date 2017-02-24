DROP TABLE transactions;
DROP TABLE tags;

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
  );

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  description VARCHAR(255),
  value INT8,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE
);