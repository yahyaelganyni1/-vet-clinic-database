/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES 
	(1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
  (2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
  (3, 'Pikachu', '2019-02-12', 1, FALSE, 15.04),
  (4, 'Devimon', '2017-05-12', 5, TRUE, 11),
  (5, 'Charmander', '2020-02-08', 0, FALSE, 11),
	(6, 'Plantmon', '2022-11-15', 2, TRUE, 5.7),
	(7, 'Squirtle', '1993-06-02', 3, FALSE, 12.13),
	(8, 'Boarmon', '2005-06-17', 7, TRUE, 45),
  (9, 'Blossom', '1998-10-13', 3, TRUE, 17);

  -- Insert into owners table
INSERT INTO owners (full_name, age) 
  VALUES ('Sam Smith', 34),
        ('Jennifer', 19),
        ('Bob', 45),
        ('Melody Pond', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);

-- Insert into species table
INSERT INTO species (name)
  VALUES ('Pokemon'),
        ('Digimon');

-- set species-id for name ends in "mon"
BEGIN;
UPDATE animals
SET species_id = 1 WHERE name LIKE '%mon';
COMMIT;

-- set poke
BEGIN;
UPDATE animals
SET species_id = 2 WHERE species_id is NULL;
COMMIT;


-- Modify your inserted animals to include owner information (owner_id):
BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')  WHERE name='Agumon';
COMMIT;

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name='Gabumon' OR name='Pikachu';
COMMIT;

BEGIN;
UPDATE animals
SET owners_id= (SELECT id FROM owners WHERE full_name='Bob') WHERE name='Devimon' OR name='Plantmon';
COMMIT;

BEGIN;
UPDATE animals
SET owners_id= (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
COMMIT;

BEGIN;
UPDATE animals
SET owners_id= (SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name='Angemon' OR name='Boarmon';
COMMIT;
