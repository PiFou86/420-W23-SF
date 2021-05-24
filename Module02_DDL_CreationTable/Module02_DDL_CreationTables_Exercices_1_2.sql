DROP DATABASE IF EXISTS module01_exercices_1_2;

CREATE DATABASE module01_exercices_1_2;

USE module01_exercices_1_2;

CREATE TABLE Maintenance (
	idMnt int UNSIGNED PRIMARY KEY,
	MntJour char(3),
	MntMachine char(8) not null,
	MntVitesse tinyint UNSIGNED CHECK (MntVitesse > 0),
	MntTemperature tinyint CHECK (MntTemperature > -30),
	MntHeure time not null,
	MntEvenement varchar(50) not null,
	CONSTRAINT UK_MAC_JOUR_HEURE UNIQUE (MntMachine, MntJour, MntHeure)
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

ALTER TABLE `MAINTENANCE`
ADD INDEX `idx_machine` (`MntMachine` ASC);

ALTER TABLE `MAINTENANCE`
ADD COLUMN `MntVerifie` ENUM ('oui', 'non')
AFTER `MntEvenement`;

-- Vérification : 
INSERT INTO Maintenance
VALUES (
		200,
		'Ven',
		'Massicot',
		NULL,
		NULL,
		'9:18',
		"Défaut de lame",
		'oui'
	);
    
SELECT *
FROM Maintenance;

INSERT INTO Maintenance
VALUES (
		201,
		'Jen',
		'Massicot',
		NULL,
		NULL,
		'9:18',
		"Défaut de lame",
		'Ouii'. -- Erreur ici
	);
