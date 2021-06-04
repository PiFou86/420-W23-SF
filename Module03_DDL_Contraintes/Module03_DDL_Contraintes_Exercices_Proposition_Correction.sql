DROP DATABASE IF EXISTS module03_exercice_2;

CREATE DATABASE module03_exercice_2;

USE module03_exercice_2;

CREATE TABLE Maintenance (
	idMnt INT UNSIGNED PRIMARY KEY,
	MntJour CHAR(3),
	MntMachine CHAR(8) NOT NULL,
	MntVitesse TINYINT, 
	MntTemperature TINYINT, 
	MntHeure TIME NOT NULL,
	MntEvenement VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Maintenance
VALUES (
		147,
		'Ven',
		'Massicot',
		NULL,
		NULL,
		'21:18',
		"Défaut de lame"
	),
	(
		63,
		'Sam',
		'Relieuse',
		16,
		NULL,
		'16:15',
		"Arrêt pour maintenance"
	),
	(
		87,
		'Jeu',
		'Press',
		6,
		62,
		'11:40',
		"Bavure encre"
	),
	(
		79,
		'Sam',
		'Relieuse',
		16,
		NULL,
		'17:1',
		"Reprise"
	),
	(89, 'Mar', 'Presse', 6, 55, '08:28', "Recadrage"),
	(
		132,
		'Mar',
		'Presse',
		8,
		68,
		'09:58',
		"Changement encre"
	),
	(
		111,
		'Mer',
		'Massicot',
		NULL,
		NULL,
		'10:17',
		"Graissage coulisseau"
	);
    
SELECT *
FROM Maintenance;

ALTER TABLE Maintenance
ADD CONSTRAINT CHK_TemperatureSupMoins30 CHECK(MntTemperature > -30);

ALTER TABLE Maintenance
MODIFY COLUMN MntJour ENUM ('Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim');

ALTER TABLE Maintenance
ADD CONSTRAINT CHK_VitessePositive CHECK(MntVitesse > 0);

DROP TABLE IF EXISTS Maintenance;

CREATE TABLE Maintenance (
	idMnt INT UNSIGNED PRIMARY KEY,
	MntJour ENUM ('Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'),
	MntMachine CHAR(8) NOT NULL,
	MntVitesse TINYINT CONSTRAINT CHK_VitessePositive CHECK(MntVitesse > 0), 
	MntTemperature TINYINT CONSTRAINT CHK_TemperatureSupMoins30 CHECK(MntTemperature > -30), 
	MntHeure TIME NOT NULL,
	MntEvenement VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Maintenance
VALUES (
		147,
		'Ven',
		'Massicot',
		NULL,
		NULL,
		'21:18',
		"Défaut de lame"
	),
	(
		63,
		'Sam',
		'Relieuse',
		16,
		NULL,
		'16:15',
		"Arrêt pour maintenance"
	),
	(
		87,
		'Jeu',
		'Press',
		6,
		62,
		'11:40',
		"Bavure encre"
	),
	(
		79,
		'Sam',
		'Relieuse',
		16,
		NULL,
		'17:1',
		"Reprise"
	),
	(89, 'Mar', 'Presse', 6, 55, '08:28', "Recadrage"),
	(
		132,
		'Mar',
		'Presse',
		8,
		68,
		'09:58',
		"Changement encre"
	),
	(
		111,
		'Mer',
		'Massicot',
		NULL,
		NULL,
		'10:17',
		"Graissage coulisseau"
	);