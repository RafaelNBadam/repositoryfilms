CREATE TABLE films (
    film_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year YEAR,
    director VARCHAR(255),
    genre VARCHAR(100),
    duration INT,
    rating DECIMAL(3, 1) 
);

CREATE TABLE actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    gender ENUM('male', 'female', 'other') NOT NULL
);

CREATE TABLE film_actors (
    film_id INT,
    actor_id INT,
    role VARCHAR(255),
    PRIMARY KEY (film_id, actor_id),
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);