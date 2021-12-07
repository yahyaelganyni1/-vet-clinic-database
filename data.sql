/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES 
	(1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
  (3, 'Pikachu', '2019-02-12', 1, FALSE, 15.04),
  (4, 'Devimon', '2017-05-12', 5, TRUE, 11),
  (5, 'Charmander', '2020-02-08', 0, FALSE, 11, NULL),
	(6, 'Plantmon', '2022-11-15', 2, TRUE, 5.7, NULL),
	(7, 'Squirtle', '1993-06-02', 3, FALSE, 12.13, NULL),
	(8, 'Boarmon', '2005-06-17', 7, TRUE, 45, NULL),
  (9, 'Blossom', '1998-10-13', 3, TRUE, 17, NULL);