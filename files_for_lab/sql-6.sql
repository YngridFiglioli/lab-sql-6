#Add the new films to the database.
#Update information on rental_duration, rental_rate, and replacement_cost.

use  sakila;
drop table if exists films_2020;
create table `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6) DEFAULT NULL,
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  primary key (`film_id`),
  constraint foreign key (`original_language_id`) references `language` (`language_id`) on delete restrict on update cascade
) engine=InnoDB auto_increment = 1003 default charset = utf8;

update films_2020 
set 
    rental_duration = 3,
    rental_rate = 2.99,
    replacement_cost = 8.99;
insert into films_2020 ( film_id, title, `description`, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating)
select film_id, title, `description`, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating from film;
select * from films_2020 where release_year = 2006;