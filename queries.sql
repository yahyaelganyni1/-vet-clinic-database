/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals  WHERE name LIKE '%mon',
SELECT name, date_of_birth  FROM animals WHERE date_of_birth BETWEEN  '2016-01-01' AND '2019-01-01',
SELECT name, neutered FROM animals WHERE neutered = TRUE AND escape_attempts < 3,
SELECT name FROM animals WHERE name = 'Agumon' OR name = 'Pikachu',
SELECT name, escape_attempts  FROM animals WHERE weight_kg > 10.5,
SELECT name FROM animals WHERE neutered = TRUE,
SELECT name FROM animals WHERE name = 'Gabumon',
SELECT name FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* change species to unspecified and rollback */
BEGIN;
COMMIT;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
END;

/* set animals with mon to digimon */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
COMMIT;
END;

/* set pokemon for all null */
BEGIN;
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;
END;


/* delete all animals and rollback*/
BEGIN;
DELETE from animals *;
SELECT * from animals;
ROLLBACK;
END;

SELECT * from animals; /* making sure all data still exist */

/* delete animals born after Jan 1st, 2022*/
BEGIN;
DELETE from animals where date_of_birth >= '2022-01-01';
COMMIT;
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * - 1;
ROLLBACK SP1;
UPDATE animals SET weight_kg = weight_kg * - 1 where weight_kg < 0;
COMMIT;
END;
