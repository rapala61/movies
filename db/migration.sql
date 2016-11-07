BEGIN;

CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  user_id integer NOT NULL,
  movie_id integer NOT NULL,
  rating integer NOT NULL,
  timestamp integer
);

COPY ratings (user_id, movie_id, rating, timestamp)
-- UPDATE THIS PATH WITH YOUR OWN!
FROM '/Users/rafacode/Desktop/practiceTechnologies/MEAN/movies/db/seed_data/ratings.data' with (format csv, delimiter E'\t');

SELECT setval('ratings_id_seq', (SELECT MAX(id) from "ratings"));

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  age integer,
  gender varchar,
  occupation varchar,
  zipcode varchar
);

COPY users (id, age, gender, occupation, zipcode)
-- UPDATE THIS PATH WITH YOUR OWN!
FROM '/Users/rafacode/Desktop/practiceTechnologies/MEAN/movies/db/seed_data/users.data' with (format csv, delimiter '|');

SELECT setval('users_id_seq', (SELECT MAX(id) from "users"));

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title varchar,
  release_date varchar,
  video_release_date varchar,
  imdb_url varchar,
  gen_unknown varchar,
  gen_action varchar,
  gen_adventure varchar,
  gen_animation varchar,
  gen_children varchar,
  gen_comedy varchar,
  gen_crime varchar,
  gen_documentary varchar,
  gen_drama varchar,
  gen_fantasy varchar,
  gen_film_noir varchar,
  gen_horror varchar,
  gen_musical varchar,
  gen_mystery varchar,
  gen_romance varchar,
  gen_scifi varchar,
  gen_thriller varchar,
  gen_war varchar,
  gen_western varchar
);

COPY movies (id, title, release_date, video_release_date, imdb_url, gen_unknown,
gen_action, gen_adventure, gen_animation, gen_children, gen_comedy, gen_crime,
gen_documentary, gen_drama, gen_fantasy, gen_film_noir, gen_horror, gen_musical,
gen_mystery, gen_romance, gen_scifi, gen_thriller, gen_war, gen_western)
-- UPDATE THIS PATH WITH YOUR OWN!
FROM '/Users/rafacode/Desktop/practiceTechnologies/MEAN/movies/db/seed_data/movies.data' with (format csv, delimiter '|');

SELECT setval('movies_id_seq', (SELECT MAX(id) from "movies"));


ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movies(id);


COMMIT;
