CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  galaxy_type VARCHAR(50),
  estimated_stars NUMERIC,
  is_spiral BOOLEAN DEFAULT FALSE
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  star_type VARCHAR(50),
  mass NUMERIC,
  galaxy_id INTEGER REFERENCES galaxy(galaxy_id) NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  planet_type VARCHAR(50),
  orbital_period NUMERIC,
  has_rings BOOLEAN DEFAULT FALSE,
  star_id INTEGER REFERENCES star(star_id) NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  moon_size TEXT,
  is_volcanic BOOLEAN DEFAULT FALSE,
  planet_id INTEGER REFERENCES planet(planet_id) NOT NULL
);

CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,  -- Ensures unique asteroid names
  diameter NUMERIC,  -- Diameter in kilometers
  composition VARCHAR(255),
  orbital_period NUMERIC,  -- Orbital period in Earth years (optional)
  discovery_year INTEGER,  -- Year of discovery (optional)
  is_near_earth_object BOOLEAN DEFAULT FALSE  -- Indicates if it's a Near-Earth Object (NEO)
);

INSERT INTO galaxy (name, galaxy_type, estimated_stars, is_spiral)
VALUES ('Milky Way', 'Spiral', 200000000, TRUE),
       ('Andromeda', 'Spiral', 1000000000, TRUE),
       ('Triangulum', 'Spiral', 30000000, TRUE),
       ('Large Magellanic Cloud', 'Irregular', 40000000, FALSE),
       ('Small Magellanic Cloud', 'Irregular', 15000000, FALSE),
       ('Messier 87', 'Elliptical', 120000000, FALSE);

INSERT INTO star (name, star_type, mass, galaxy_id)
VALUES ('Sun', 'Yellow Dwarf', 1.989, 1),
       ('Proxima Centauri', 'Red Dwarf', 0.123, 1),
       ('Alpha Centauri A', 'Sun-like', 1.100, 1),
       ('Andromeda Galaxy A', 'Red Giant', 10, 2),
       ('Andromeda Galaxy B', 'Blue Supergiant', 25, 2),
       ('Triangulum Galaxy A', 'Yellow Dwarf', 2, 3);

INSERT INTO planet (name, planet_type, orbital_period, has_rings, star_id, num_moons)
VALUES ('Earth', 'Terrestrial', 365.25, FALSE, 1, 1),
       ('Mars', 'Terrestrial', 687, FALSE, 1, 2),
       ('Jupiter', 'Gas Giant', 4332.6, TRUE, 1, 7),
       ('Proxima Centauri b', 'Terrestrial', 11.2, FALSE, 2, 0),
       ('Alpha Centauri Bb', 'Super-Earth', 3.2, FALSE, 3, 0),
       ('Kepler-186f', 'Super-Earth', 136, FALSE, 6, 0),
       ('Venus', 'Terrestrial', 224.7, FALSE, 1, 0),
       ('Mercury', 'Terrestrial', 88, FALSE, 1, 0),
       ('Saturn', 'Gas Giant', 10759, TRUE, 1, 8),
       ('Uranus', 'Ice Giant', 30689, FALSE, 2, 27);


INSERT INTO moon (name, moon_size, is_volcanic, planet_id)
VALUES ('Moon', '3474 km diameter', FALSE, 1),
       ('Phobos', '22.2 km diameter', FALSE, 4),
       ('Deimos', '12.6 km diameter', FALSE, 4),
       ('Io', '3642 km diameter', TRUE, 5),
       ('Europa', '3138 km diameter', FALSE, 5),
       ('Titan', '5150 km diameter', TRUE, 7),
       ('Ganymede', '5268 km diameter', FALSE, 7),
       ('Callisto', '4821 km diameter', FALSE, 7),
       ('Mimas', '196 km diameter', FALSE, 7),
       ('Enceladus', '504 km diameter', TRUE, 7),
       ('Dione', '1118 km diameter', FALSE, 7),  
       ('Rhea', '1532 km diameter', FALSE, 7),  
       ('Thebe', '115 km diameter', FALSE, 7),
       ('Amalthea', '250 km diameter', FALSE, 7),
       ('Europa Moon 2', '5 km diameter', FALSE, 7),
       ('Ganymede Moon 1', '1 km diameter', FALSE, 7),
       ('Umbriel', '1169 km diameter', FALSE, 7), 
       ('Tethys', '1062 km diameter', FALSE, 8),
       ('Polydeuces', '3 km diameter', FALSE, 8),
       ('Helene', '3 km diameter', FALSE, 8);

INSERT INTO asteroid (name, diameter, composition, orbital_period, discovery_year, is_near_earth_object)
VALUES ('Ceres', 950, 'Stony', 4.6, 1801, FALSE),
       ('Vesta', 525, 'Stony', 3.6, 1807, FALSE),
       ('Pallas', 512, 'Stony', 4.1, 1802, FALSE);
