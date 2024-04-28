DROP SCHEMA IF EXISTS pokemonTCG;
CREATE SCHEMA pokemonTCG;
USE pokemonTCG;

-- Creación de la tabla consType
CREATE TABLE consType (
    id_consType INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255) NOT NULL
);

-- Creación de la tabla Activacion
CREATE TABLE Activacion (
    id_activacion INT AUTO_INCREMENT PRIMARY KEY,
    forma VARCHAR(255) NOT NULL
);

-- Creación de la tabla efecto
CREATE TABLE efecto (
    id_efecto INT AUTO_INCREMENT PRIMARY KEY,
    efectoA VARCHAR(255)
);

-- Creación de la tabla Energia
CREATE TABLE Energia (
    id_energia INT AUTO_INCREMENT PRIMARY KEY,
    elemento VARCHAR(255) NOT NULL
);

-- Creación de la tabla pokeType
CREATE TABLE pokeType (
    id_pokeType INT AUTO_INCREMENT PRIMARY KEY,
    BasOEv VARCHAR(255)
);

-- Creación de la tabla Tipo
CREATE TABLE Tipo (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL
);

-- Creación de la tabla Pokemon
CREATE TABLE Pokemon (
    id_pokemon INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    vida INT,
    FK_id_pokeType INT,
    FK_id_tipo INT,
    FOREIGN KEY (FK_id_pokeType) REFERENCES pokeType(id_pokeType),
    FOREIGN KEY (FK_id_tipo) REFERENCES tipo(id_tipo)
);

-- Creación de la tabla Ataque
CREATE TABLE Ataque (
    id_ataque INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Creación de la tabla pokeAtack
CREATE TABLE pokeAtack (
    id_pokeAtack INT AUTO_INCREMENT PRIMARY KEY,
    FK_id_ataque INT,
    FK_id_pokemon INT,
    FOREIGN KEY (FK_id_ataque) REFERENCES Ataque(id_ataque),
    FOREIGN KEY (FK_id_pokemon) REFERENCES Pokemon(id_pokemon)
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Creación de la tabla Jugador
CREATE TABLE Jugador (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    FK_id_usuario INT,
    nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (FK_id_usuario) REFERENCES Usuario(id_usuario)
);

-- Creación de la tabla Maso
CREATE TABLE Maso (
    id_maso INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    FK_id_jugador INT,
    FOREIGN KEY (FK_id_jugador) REFERENCES Jugador(id_jugador)
);

-- Creación de la tabla Turno
CREATE TABLE Turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    noTurn INT
);

-- Creación de la tabla Partida
CREATE TABLE Partida (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    FK_id_turno INT,
    FK_id_jugador1 INT,
    FK_id_jugador2 INT,
    FOREIGN KEY (FK_id_turno) REFERENCES Turno(id_turno),
    FOREIGN KEY (FK_id_jugador1) REFERENCES Jugador(id_jugador),
    FOREIGN KEY (FK_id_jugador2) REFERENCES Jugador(id_jugador)
);

-- Creación de la tabla consumible
CREATE TABLE consumible (
    id_consumible INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    FK_id_consType INT,
    FK_id_activacion INT,
    FK_id_efecto INT,
    FOREIGN KEY (FK_id_consType) REFERENCES consType(id_consType),
    FOREIGN KEY (FK_id_activacion) REFERENCES Activacion(id_activacion),
    FOREIGN KEY (FK_id_efecto) REFERENCES efecto(id_efecto)
);

-- Creación de la tabla Cartas
CREATE TABLE Cartas (
    id_carta INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    FK_id_tipo INT,
    FK_id_maso INT,
    FK_id_pokemon INT,
    FK_id_consumible INT,
    Efectos VARCHAR(255),
    FOREIGN KEY (FK_id_tipo) REFERENCES Tipo(id_tipo),
    FOREIGN KEY (FK_id_maso) REFERENCES Maso(id_maso),
    FOREIGN KEY (FK_id_pokemon) REFERENCES pokemon(id_pokemon),
    FOREIGN KEY (FK_id_consumible) REFERENCES consumible(id_consumible)
);

-- Insertar datos en pokeType
INSERT INTO pokeType (BasOEv) VALUES ('Base'), ('Stage1'), ('Stage2'), ('VStar'), ('BaseV'), ('BaseEX'), ('Stage2EX');

-- Insertar datos en Tipo
INSERT INTO Tipo (tipo) VALUES 
('Fuego'), 
('Agua'), 
('Planta'), 
('Eléctrico'), 
('Normal'), 
('Dragón'), 
('Metal'),
('Lucha'),
('Roca'),
('Psiquico');

-- Insertar datos en Pokemon
INSERT INTO Pokemon (nombre, vida, FK_id_pokeType,FK_id_tipo) VALUES 
('MewtwoEX', 230, 6, 4), 
('Charmander', 60, 1, 1), 
('Frigiebax', 70, 1, 2),
('Turtwig', 80, 1, 3),
('Pidgey', 50, 1, 5),
('ArceusV', 220, 5, 5),
('Bidoof', 60, 1, 4),
('ArceusVStar', 280, 4, 5),
('IronCrown', 220, 6, 10),
('Charmeleon', 90, 2, 1),
('Charizard', 180, 3, 1),
('CharizardEX', 330, 7, 6);

-- Insertar datos en Ataque
INSERT INTO Ataque (nombre) VALUES 
('Photon Kinesis'), 
('Steady Fireblazing'), 
('Beat'), 
('Leafage'), 
('Tackle'),
('Trinity Charge'),
('Hyper fang'),
('Trinity Nova'),
('Twin Shotels'),
('Flamethrower'),
('Flare Blitz'),
('Burning Darknes');

-- Insertar datos en pokeAtack
INSERT INTO pokeAtack (FK_id_ataque, FK_id_pokemon) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 5),
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9),
(10, 10), 
(11, 11), 
(12, 12);

-- Insertar datos en Usuario
INSERT INTO Usuario (nombre) VALUES 
('Ash'), 
('Misty'), 
('Brock'), 
('Jessie'), 
('James'),
('Giovanni'),
('Oak'),
('Clemont'),
('Serena'),
('Dawn');

-- Insertar datos en Jugador
INSERT INTO Jugador (FK_id_usuario, nombre) VALUES 
(1, 'Ash Ketchum'), 
(2, 'Misty Williams'), 
(3, 'Brock Harrison'), 
(4, 'Jessie Musashi'), 
(5, 'James Kojiro'),
(6, 'Giovanni Rocket'),
(7, 'Profesor Oak'),
(8, 'Clemont Lem'),
(9, 'Serena Makiguchi'),
(10, 'Dawn Toyoguchi');

-- Insertar datos en Maso (Mazo)
INSERT INTO Maso (Nombre, FK_id_jugador) VALUES 
('Mazo de Ash', 1), 
('Mazo de Misty', 2), 
('Mazo de Brock', 3), 
('Mazo de Jessie', 4), 
('Mazo de James', 5),
('Mazo de Giovanni', 6), 
('Mazo de Oak', 7), 
('Mazo de Clemont', 8), 
('Mazo de Serena', 9), 
('Mazo de Dawn', 10);

-- Insertar datos en Turno
INSERT INTO Turno (noTurn) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insertar datos en Partida
INSERT INTO Partida (FK_id_turno, FK_id_jugador1, FK_id_jugador2) VALUES 
(1, 1, 2), 
(2, 1, 3), 
(3, 2, 8), 
(4, 3, 5), 
(5, 4, 1),
(6, 2, 9), 
(7, 1, 7), 
(8, 6, 4), 
(9, 9, 5), 
(10, 4, 10);

-- Insertar datos en consType (Tipo de consumible)
INSERT INTO consType (Type) VALUES 
('Trainer'), 
('Objeto');

-- Insertar datos en Activacion (Tipo de activación)
INSERT INTO Activacion (forma) VALUES 
('Inmediata'), 
('Retrasada'), 
('Continua'), 
('Condicional');

-- Insertar datos en efecto (Efecto del consumible)
INSERT INTO efecto (efectoA) VALUES 
('Flip a coin if it lands heads take a evolution pokemon y it´s tales take a basic pokemon from your hand'), 
('Search 2 cards from your deck'), 
('Search 2 basic pokemon from your deck'), 
('Move 2 damage counters'), 
('Search 2 energy cards from your deck'),
('Search 3 evolution pokemon from your deck'),
('Search for a item card from your deck'),
('Switch oponents active pokemon'),
('Search 2 cards from your deck then pot them in top of the deck'),
('Look at the top 5 cards from you deck put 3 on your hand');

-- Insertar datos en consumible
INSERT INTO consumible (Nombre, FK_id_consType, FK_id_activacion, FK_id_efecto) VALUES 
('Capturing aroma', 2, 1, 1), 
('Boxed order', 2, 1, 2), 
('Buddy-Buddy poffin', 2, 1, 3), 
('Damage pump', 2, 1, 4), 
('Earthen vessel', 2, 1, 5),
('Arezu', 1, 1, 6), 
('Arven', 1, 1, 7), 
('Boss´s orders', 1, 1, 8), 
('Ciphermaniac´s codebreaking', 1, 1, 9), 
('Corless´s experiment', 1, 1, 10);

-- Insertar cartas de Pokémon
INSERT INTO Cartas (Name, FK_id_tipo, FK_id_maso, FK_id_pokemon, Efectos) VALUES 
('Mewtwo EX Card', 10, 1, 1, 'Photon Kinesis'),
('Charmander Card', 1, 2, 2, 'Steady Fireblazing'),
('Frigiebax Card', 2, 3, 3, 'Beat'),
('Turtwig Card', 3, 4, 4, 'Leafage'),
('Pidgey Card', 5, 5, 5, 'Tackle'),
('Arceus V Card', 5, 6, 6, 'Trinity Charge'),
('Bidoof Card', 4, 7, 7, 'Hyper Fang'),
('Arceus VStar Card', 5, 8, 8, 'Trinity Nova'),
('IronCrown Card', 10, 9, 9, 'Twin Shotels');

-- Insertar cartas de consumible
INSERT INTO Cartas (Name, FK_id_tipo, FK_id_maso, FK_id_consumible, Efectos) VALUES 
('Capturing Aroma', 5, 1, 1, 'Flip a coin, if heads, take an evolution Pokémon, if tails, take a basic Pokémon from your hand'),
('Boxed Order', 5, 2, 2, 'Search 2 cards from your deck'),
('Buddy-Buddy Poffin', 5, 3, 3, 'Search 2 basic Pokémon from your deck'),
('Damage Pump', 5, 4, 4, 'Move 2 damage counters'),
('Earthen Vessel', 5, 5, 5, 'Search 2 energy cards from your deck');

-- Insertar cartas de energía
INSERT INTO Cartas (Name, FK_id_tipo, FK_id_maso, Efectos) VALUES 
('Fire Energy', 1, 1, 'Provides fire energy'),
('Water Energy', 2, 2, 'Provides water energy'),
('Grass Energy', 3, 3, 'Provides grass energy'),
('Electric Energy', 4, 4, 'Provides electric energy'),
('Normal Energy', 5, 5, 'Provides normal energy');


