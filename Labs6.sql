-- Labs 6

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` varchar(255),
  `rental_rate` varchar(255),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` varchar(255) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


LOAD DATA INFILE '/Users/Pol/Desktop/films_2020.csv' 
INTO TABLE sakila.films_2020
FIELDS TERMINATED BY ',';

-- the first time I ran I got an error, had to change some settings:
show variables like 'local_infile';
set global local_infile = 1;

show variables like 'secure_file_priv';

set sql_safe_updates = 0;


select *
from sakila.films_2020;

-- populating the other rows

UPDATE films_2020 SET rental_duration = 3, rental_rate=2.99, replacement_cost=8.99;



