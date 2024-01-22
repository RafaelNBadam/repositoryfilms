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

