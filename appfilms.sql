-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema appfilms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `appfilms` DEFAULT CHARACTER SET utf8mb4 ;
USE `appfilms` ;

-- -----------------------------------------------------
-- Table `appfilms`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`actors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `appfilms`.`films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`films` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `film_name` VARCHAR(255) NULL DEFAULT NULL,
  `film_genre` VARCHAR(100) NULL DEFAULT NULL,
  `film_duration` VARCHAR(12) NULL DEFAULT NULL,
  `film_year` YEAR(4) NULL DEFAULT NULL,
  `film_cast` VARCHAR(255) NULL DEFAULT NULL,
  `parental_rating` VARCHAR(10) NULL DEFAULT NULL,
  `assessment` TEXT NULL DEFAULT NULL,
  `over_18` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `appfilms`.`filmactors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`filmactors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `film_id` INT(11) NULL DEFAULT NULL,
  `actor_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_filmactors_film` (`film_id` ASC)  ,
  INDEX `fk_filmactors_actor` (`actor_id` ASC) ,
  CONSTRAINT `fk_filmactors_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `appfilms`.`films` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmactors_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `appfilms`.`actors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `appfilms`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `appfilms`.`quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`quiz` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `Film_name` VARCHAR(255) NULL DEFAULT NULL,
  `Film_genre` VARCHAR(100) NULL DEFAULT NULL,
  `Film_cast` VARCHAR(255) NULL DEFAULT NULL,
  `over_18` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `appfilms`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `appfilms`.`filmsquiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appfilms`.`filmsquiz` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quiz_id` INT NOT NULL,
  `films_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_idx` (`quiz_id` ASC) ,
  INDEX `fk_films_idx` (`films_id` ASC) ,
  CONSTRAINT `fk_quiz`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `appfilms`.`quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_films`
    FOREIGN KEY (`films_id`)
    REFERENCES `appfilms`.`films` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('John Wick', 'Action', '101 minutos', 2014, 'Keanu Reeves, Michael Nyqvist, Alfie Allen', '16 anos', '7.4', 0),
('Mad Max: Estrada da Fúria', 'Action', '120 minutos', 2015, 'Tom Hardy, Charlize Theron, Nicholas Hoult', '14 anos', '8.1', 0),
('Duro de Matar', 'Action', '132 minutos', 1988, 'Bruce Willis, Alan Rickman, Bonnie Bedelia', '16 anos', '8.2', 0),
('Missão Impossível: Efeito Fallout', 'Action', '147 minutos', 2018, 'Tom Cruise, Henry Cavill, Ving Rhames', '14 anos', '7.7', 0),
('Velozes e Furiosos 7', 'Action', '137 minutos', 2015, 'Vin Diesel, Paul Walker, Dwayne Johnson', '14 anos', '7.1', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Se Beber, Não Case!', 'Comedy', '100 minutos', 2009, 'Bradley Cooper, Ed Helms, Zach Galifianakis', '18 anos', '7.7', 1),
('Superbad: É Hoje', 'Comedy', '113 minutos', 2007, 'Jonah Hill, Michael Cera, Christopher Mintz-Plasse', '16 anos', '7.6', 0),
('Quero Ser Grande', 'Comedy', '104 minutos', 1988, 'Tom Hanks, Elizabeth Perkins, Robert Loggia', 'Livre', '7.3', 0),
('A Mentira', 'Comedy', '97 minutos', 2010, 'Emma Stone, Amanda Bynes, Penn Badgley', '12 anos', '7.0', 0),
('Borat: O Segundo Melhor Repórter do Glorioso País Cazaquistão Viaja à América', 'Comedy', '84 minutos', 2006, 'Sacha Baron Cohen, Ken Davitian, Luenell', '16 anos', '7.3', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Orgulho e Preconceito', 'Romance', '129 minutos', 2005, 'Keira Knightley, Matthew Macfadyen, Rosamund Pike', '10 anos', '7.8', 0),
('Simplesmente Acontece', 'Romance', '102 minutos', 2014, 'Lily Collins, Sam Claflin, Christian Cooke', '12 anos', '7.2', 0),
('Diário de uma Paixão', 'Romance', '123 minutos', 2004, 'Ryan Gosling, Rachel McAdams, James Garner', '12 anos', '7.8', 0),
('A Culpa é das Estrelas', 'Romance', '126 minutos', 2014, 'Shailene Woodley, Ansel Elgort, Nat Wolff', '12 anos', '7.7', 0),
('La La Land: Cantando Estações', 'Romance', '128 minutos', 2016, 'Ryan Gosling, Emma Stone, John Legend', '10 anos', '8.0', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('O Exorcista', 'Horror', '122 minutos', 1973, 'Ellen Burstyn, Max von Sydow, Linda Blair', '18 anos', '8.0', 1),
('O Iluminado', 'Horror', '146 minutos', 1980, 'Jack Nicholson, Shelley Duvall, Danny Lloyd', '16 anos', '8.4', 0),
('Invocação do Mal', 'Horror', '112 minutos', 2013, 'Patrick Wilson, Vera Farmiga, Lili Taylor', '14 anos', '7.5', 0),
('A Bruxa', 'Horror', '93 minutos', 2015, 'Anya Taylor-Joy, Ralph Ineson, Kate Dickie', '16 anos', '6.9', 0),
('Corra!', 'Horror', '104 minutos', 2017, 'Daniel Kaluuya, Allison Williams, Catherine Keener', '14 anos', '7.7', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Blade Runner 2049', 'Science Fiction', '164 minutos', 2017, 'Ryan Gosling, Harrison Ford, Ana de Armas', '16 anos', '8.0', 0),
('Interestelar', 'Science Fiction', '169 minutos', 2014, 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', '12 anos', '8.6', 0),
('Matrix', 'Science Fiction', '136 minutos', 1999, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', '14 anos', '8.7', 0),
('O Quinto Elemento', 'Science Fiction', '126 minutos', 1997, 'Bruce Willis, Milla Jovovich, Gary Oldman', '14 anos', '7.7', 0),
('O Exterminador do Futuro 2: O Julgamento Final', 'Science Fiction', '137 minutos', 1991, 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong', '14 anos', '8.5', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Seven - Os Sete Crimes Capitais', 'Suspense', '127 minutos', 1995, 'Brad Pitt, Morgan Freeman, Kevin Spacey', '18 anos', '8.6', 1),
('O Sexto Sentido', 'Suspense', '107 minutos', 1999, 'Bruce Willis, Haley Joel Osment, Toni Collette', '14 anos', '8.1', 0),
('Silêncio dos Inocentes', 'Suspense', '118 minutos', 1991, 'Jodie Foster, Anthony Hopkins, Scott Glenn', '18 anos', '8.6', 1),
('Psicose', 'Suspense', '109 minutos', 1960, 'Anthony Perkins, Janet Leigh, Vera Miles', '16 anos', '8.5', 0),
('Janela Indiscreta', 'Suspense', '112 minutos', 1954, 'James Stewart, Grace Kelly, Wendell Corey', '12 anos', '8.4', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Indiana Jones e os Caçadores da Arca Perdida', 'Adventure', '115 minutos', 1981, 'Harrison Ford, Karen Allen, Paul Freeman', '12 anos', '8.4', 0),
('Piratas do Caribe: A Maldição do Pérola Negra', 'Adventure', '143 minutos', 2003, 'Johnny Depp, Geoffrey Rush, Orlando Bloom', '12 anos', '8.0', 0),
('Jurassic Park: Parque dos Dinossauros', 'Adventure', '127 minutos', 1993, 'Sam Neill, Laura Dern, Jeff Goldblum', '12 anos', '8.1', 0),
('O Hobbit: Uma Jornada Inesperada', 'Adventure', '169 minutos', 2012, 'Martin Freeman, Ian McKellen, Richard Armitage', '12 anos', '7.8', 0),
('A Lenda do Tesouro Perdido', 'Adventure', '131 minutos', 2004, 'Nicolas Cage, Diane Kruger, Justin Bartha', '10 anos', '6.9', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Wont You Be My Neighbor?', 'Documentary', '94 minutos', 2018, 'Fred Rogers, Joanne Rogers, François Scarborough Clemmons', 'Livre', '8.4', 0),
('A 13ª Emenda', 'Documentary', '100 minutos', 2016, 'Michelle Alexander, Cory Booker, Jelani Cobb', '16 anos', '8.2', 0),
('Supersize Me: A Dieta do Palhaço', 'Documentary', '100 minutos', 2004, 'Morgan Spurlock', '12 anos', '7.2', 0),
('Searching for Sugar Man', 'Documentary', '86 minutos', 2012, 'Sixto Rodriguez, Stephen Sugar Segerman, Dennis Coffey', '12 anos', '8.2', 0),
('Citizenfour', 'Documentary', '114 minutos', 2014, 'Edward Snowden, Glenn Greenwald, William Binney', '14 anos', '8.0', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('Mamma Mia!', 'Musical', '108 minutos', 2008, 'Meryl Streep, Amanda Seyfried, Pierce Brosnan', '10 anos', '6.4', 0),
('Moulin Rouge: Amor em Vermelho', 'Musical', '127 minutos', 2001, 'Nicole Kidman, Ewan McGregor, John Leguizamo', '14 anos', '7.6', 0),
('O Rei do Show', 'Musical', '105 minutos', 2017, 'Hugh Jackman, Zac Efron, Zendaya', '10 anos', '7.6', 0),
('Chicago', 'Musical', '113 minutos', 2002, 'Renée Zellweger, Catherine Zeta-Jones, Richard Gere', '14 anos', '7.1', 0),
('Cantando na Chuva', 'Musical', '103 minutos', 1952, 'Gene Kelly, Donald OConnor, Debbie Reynolds', 'Livre', '8.3', 0);

INSERT INTO appfilms.films
(film_name, film_genre, film_duration, film_year, film_cast, parental_rating, assessment, over_18)
VALUES
('A Origem', 'Drama', '148 minutos', 2010, 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', '14 anos', '8.8', 0),
('Cisne Negro', 'Drama', '108 minutos', 2010, 'Natalie Portman, Mila Kunis, Vincent Cassel', '16 anos', '8.0', 0),
('Clube da Luta', 'Drama', '139 minutos', 1999, 'Brad Pitt, Edward Norton, Helena Bonham Carter', '18 anos', '8.8', 1),
('Forrest Gump: O Contador de Histórias', 'Drama', '142 minutos', 1994, 'Tom Hanks, Robin Wright, Gary Sinise', '12 anos', '8.8', 0),
('Cidade de Deus', 'Drama', '130 minutos', 2002, 'Alexandre Rodrigues, Leandro Firmino, Matheus Nachtergaele', '18 anos', '8.6', 1);


SELECT * FROM films WHERE film_genre = 'Romance';

SELECT * FROM films WHERE film_genre = 'Comedy' AND parental_rating = 'Livre';

SELECT * FROM films WHERE assessment = 8;



