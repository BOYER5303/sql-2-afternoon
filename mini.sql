CREATE TABLE movie(
  movie_id SERIAL PRIMARY KEY,
  title TEXT,
  media_type_id INTEGER REFERENCES media_type
  (media_type_id));

INSERT INTO movie (title, media_type_id)
VALUES
('Mr. Magoriums Wonder Imporium', 3);

SELECT * FROM movie
JOIN media_type 
ON movie.media_type_id = media_type.media_type_id;

ALTER TABLE movie
ADD COLUMN genre_id INTEGER REFERENCES genre(genre_id);
UPDATE movie
SET genre_id = 25 WHERE movie_id = 1;

SELECT title, name FROM movie
JOIN genre
ON movie.genre_id = genre.genre_id;

SELECT name, title FROM artist ar
JOIN album al
ON ar.artist_id = al.artist_id
ORDER BY name;

SELECT * FROM track
WHERE genre_id IN (SELECT genre_id 
FROM genre WHERE name = 'Jazz' OR name = 'Blues');

SELECT ar.artist_id, ar.name, COUNT(*) FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id
GROUP BY ar.artist_id
ORDER BY COUNT DESC;

SELECT DISTINCT country FROM customer ORDER BY country;

CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  name TEXT
  );
  
  INSERT INTO users(name)
  VALUES
('Jeff'),('Marco'), ('General Zod');

CREATE TABLE products(
  product_id SERIAL PRIMARY KEY,
  name TEXT,
  price DECIMAL);
  
 INSERT INTO products(name,price)
 VALUES
 ('cool hat', 10.99), ('Coreys chair', 0.99), ('Jasons hat', 44.99);

CREATE TABLE cart(
  cart_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  product_id INT REFERENCES product(product_id));
  
  INSERT INTO cart(user_id, product_id)
  VALUES
  (1, 2),
  (1, 1),
  (2, 2),
  (3, 1),
  (3, 2),
  (3, 3);