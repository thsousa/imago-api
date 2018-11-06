CREATE DATABASE imago;

CREATE TABLE imago.User (
  user_id             INTEGER PRIMARY KEY,
  first_name          VARCHAR(20) NOT NULL,
  last_name           VARCHAR(100),
  username            VARCHAR(15) UNIQUE NOT NULL,
  bio                 VARCHAR(200),
  gender              ENUM('M', 'F'),
  email               VARCHAR(255) UNIQUE NOT NULL,
  password            INTEGER NOT NULL
);

CREATE TABLE imago.Post (
  post_id             INTEGER PRIMARY KEY,
  img_location        VARCHAR(300) NOT NULL,
  title               VARCHAR(100),
  description         VARCHAR(300),
  creation_at         TIMESTAMP NOT NULL,
  last_modified_at    TIMESTAMP NOT NULL,
  id_user             INTEGER REFERENCES imago.User(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE imago.PostInteraction (
  post_interaction_id INTEGER PRIMARY KEY,
  type                ENUM('COMMENTARY', 'LIKE', 'SHARE') NOT NULL,
  post_id             INTEGER REFERENCES imago.Post(post_id) ON UPDATE CASCADE ON DELETE CASCADE,
  user_id             INTEGER REFERENCES imago.User(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
  created_at          TIMESTAMP NOT NULL
);