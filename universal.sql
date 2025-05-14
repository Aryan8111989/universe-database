-- Create the universe database
CREATE DATABASE universe;
\c universe

-- Create galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  has_life BOOLEAN NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  galaxy_type VARCHAR(50)
);

-- Create star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  is_spherical BOOLEAN NOT NULL,
  temperature_in_kelvin INT NOT NULL,
  star_type TEXT
);

-- Create planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL,
  distance_from_earth NUMERIC(10,2),
  planet_type TEXT,
  age_in_millions_of_years INT
);

-- Create moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL,
  radius_in_km INT,
  description TEXT
);

-- Create a fifth table: space_mission
CREATE TABLE space_mission (
  space_mission_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  success BOOLEAN NOT NULL,
  duration_in_days INT NOT NULL
);

-- Insert galaxies
INSERT INTO galaxy (name, description, has_life, age_in_millions_of_years, galaxy_type) VALUES
  ('Milky Way', 'Our home galaxy', TRUE, 13600, 'Spiral'),
  ('Andromeda', 'Closest spiral galaxy', FALSE, 10000, 'Spiral'),
  ('Whirlpool', 'Also known as M51', FALSE, 8000, 'Spiral'),
  ('Sombrero', 'Unusual bulge and halo', FALSE, 9000, 'Elliptical'),
  ('Messier 87', 'A supergiant elliptical galaxy', FALSE, 13000, 'Elliptical'),
  ('Large Magellanic Cloud', 'Satellite galaxy of Milky Way', FALSE, 13000, 'Irregular');

-- Insert stars
INSERT INTO star (name, galaxy_id, is_spherical, temperature_in_kelvin, star_type) VALUES
  ('Sun', 1, TRUE, 5778, 'G-type main-sequence'),
  ('Sirius', 1, TRUE, 9940, 'A-type main-sequence'),
  ('Betelgeuse', 1, TRUE, 3500, 'Red supergiant'),
  ('Rigel', 1, TRUE, 11000, 'Blue supergiant'),
  ('Proxima Centauri', 1, TRUE, 3042, 'Red dwarf'),
  ('Alpha Centauri A', 1, TRUE, 5790, 'G-type main-sequence');

-- Insert planets
INSERT INTO planet (name, star_id, has_life, distance_from_earth, planet_type, age_in_millions_of_years) VALUES
  ('Earth', 1, TRUE, 0.00, 'Terrestrial', 4500),
  ('Mars', 1, FALSE, 0.52, 'Terrestrial', 4600),
  ('Venus', 1, FALSE, 0.28, 'Terrestrial', 4600),
  ('Jupiter', 1, FALSE, 4.2, 'Gas Giant', 4600),
  ('Saturn', 1, FALSE, 8.5, 'Gas Giant', 4600),
  ('Uranus', 1, FALSE, 18.2, 'Ice Giant', 4600),
  ('Neptune', 1, FALSE, 29.1, 'Ice Giant', 4600),
  ('Proxima b', 5, FALSE, 4.2, 'Terrestrial', 5000),
  ('Alpha b', 6, FALSE, 4.3, 'Terrestrial', 4900),
  ('Exo-1', 2, FALSE, 12.5, 'Gas Giant', 4000),
  ('Exo-2', 2, FALSE, 15.3, 'Terrestrial', 4100),
  ('Exo-3', 2, FALSE, 16.7, 'Terrestrial', 4200);

-- Insert moons
INSERT INTO moon (name, planet_id, is_spherical, radius_in_km, description) VALUES
  ('Moon', 1, TRUE, 1737, 'Earth''s only moon'),
  ('Phobos', 2, FALSE, 11, 'One of Mars'' moons'),
  ('Deimos', 2, FALSE, 6, 'Another Martian moon'),
  ('Io', 4, TRUE, 1821, 'Volcanically active'),
  ('Europa', 4, TRUE, 1560, 'May have subsurface ocean'),
  ('Ganymede', 4, TRUE, 2634, 'Largest moon in the solar system'),
  ('Callisto', 4, TRUE, 2410, 'Heavily cratered'),
  ('Titan', 5, TRUE, 2575, 'Saturn''s largest moon'),
  ('Enceladus', 5, TRUE, 252, 'Icy moon'),
  ('Mimas', 5, TRUE, 198, 'Looks like Death Star'),
  ('Triton', 7, TRUE, 1353, 'Retrograde orbit'),
  ('Nereid', 7, TRUE, 170, 'Highly eccentric orbit'),
  ('Oberon', 6, TRUE, 761, 'Uranian moon'),
  ('Titania', 6, TRUE, 789, 'Largest Uranian moon'),
  ('Miranda', 6, TRUE, 235, 'Fractured surface'),
  ('Ariel', 6, TRUE, 578, 'Brightest Uranian moon'),
  ('Umbriel', 6, TRUE, 584, 'Dark surface'),
  ('Charon', 10, TRUE, 606, 'Pluto''s moon'),
  ('Styx', 10, FALSE, 5, 'Tiny moon of Pluto'),
  ('Hydra', 10, FALSE, 25, 'Outer moon of Pluto');

-- Insert space missions
INSERT INTO space_mission (name, description, success, duration_in_days) VALUES
  ('Apollo 11', 'First Moon landing', TRUE, 8),
  ('Voyager 1', 'Interstellar probe', TRUE, 17000),
  ('Mars Pathfinder', 'Mars rover mission', TRUE, 85);
