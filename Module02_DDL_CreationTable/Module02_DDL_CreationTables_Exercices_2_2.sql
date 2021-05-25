-- Module 02 - Tables "geographie" 2 / 2

-- Exercice 1 - Base de données "geographie"

-- Exercice 1.1 - Création de la base de données

DROP DATABASE IF EXISTS goegraphie;
CREATE DATABASE goegraphie;
USE goegraphie;

-- Exercice 1.2 - Création des tables

CREATE TABLE province (
    nom VARCHAR(30) NOT NULL,
    code CHAR(2) NOT NULL,
    date DATE DEFAULT '1867-07-01',
    population INT UNSIGNED NOT NULL DEFAULT 0,
    superficie INT UNSIGNED NOT NULL DEFAULT 0,
    densite FLOAT(5) NOT NULL DEFAULT 0.0,
    capitale VARCHAR(15) NOT NULL DEFAULT 'NULL'
)  ENGINE=INNODB;
DESCRIBE province;

ALTER TABLE province
ADD COLUMN idProvince INT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST;
DESCRIBE province;

ALTER TABLE province
ADD COLUMN dateMAJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DESCRIBE province;

INSERT INTO province (
        idProvince,
        nom,
        code,
        date,
        population,
        superficie,
        densite,
        capitale
    )
VALUES (
        1,
        "Alberta",
        "AB",
        '1905-09-01',
        4067175,
        661848,
        6.15,
        "Edmonton"
    ),
    (
        2,
        "Colombie-Britannique",
        "BC",
        '1871-07-20',
        4648055,
        944735,
        4.92,
        "Victoria"
    ),
    (
        3,
        "Île-du-Prince-Édouard",
        'PE',
        '1873-07-01',
        142907,
        5660,
        25.25,
        "Charlottetown"
    ),
    (
        4,
        "Manitoba",
        'MB',
        '1870-07-15',
        1278365,
        72908,
        1.97,
        'Winnipeg'
    ),
    (
        5,
        "Nouveau-Brunswick",
        'NB',
        '1867-07-01',
        747101,
        72908,
        10.25,
        'Fredericton'
    ),
    (
        6,
        "Nouvelle-Écosse",
        "NS",
        '1867-07-01',
        923598,
        55284,
        16.71,
        "Halifax"
    ),
    (
        7,
        "Ontario",
        "ON",
        '1867-07-01',
        13448494,
        1076395,
        12.49,
        "Toronto"
    ),
    (
        8,
        "Québec",
        "QC",
        "1867-07-01",
        8164361,
        1542056,
        5.3,
        "Québec"
    ),
    (
        9,
        "Saskatchewan",
        "SK",
        "1905-09-01",
        1098352,
        651036,
        1.69,
        "Regina"
    ),
    (
        10,
        "Terre-Neuve-et-Labrador",
        "NL",
        "1949-03-31",
        519716,
        405212,
        1.28,
        "Saint John's"
    ),
    (
        11,
        "Nunavut",
        "NU",
        "1999-04-01",
        35994,
        2093190,
        0.02,
        "Iqaluit"
    ),
    (
        12,
        "Territoires du Nord-Ouest",
        "NT",
        "1870-07-15",
        41786,
        1346106,
        0.03,
        "Yellowknife"
    ),
    (
        13,
        "Yukon",
        "YT",
        "1898-06-13",
        35874,
        482443,
        0.07,
        "Whitehorse"
    );
    
SELECT 
    *
FROM
    province;

-- Exercice 1.3 - Ajouter des tables de relations
CREATE TABLE pays(
    idPays INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL
) Engine = InnoDB;

INSERT INTO pays (nom)
VALUES("Canada");

CREATE TABLE ville(
    idVille INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL
) Engine = InnoDB;

ALTER TABLE ville
ADD COLUMN idProvince INT UNSIGNED NOT NULL;

ALTER TABLE ville
ADD CONSTRAINT fkProvince FOREIGN KEY (idProvince) REFERENCES province(idProvince);

ALTER TABLE province DROP COLUMN capitale;
ALTER TABLE province
ADD COLUMN idCapitale INT UNSIGNED
AFTER densite;
ALTER TABLE province
ADD CONSTRAINT fkCapitale FOREIGN KEY (idCapitale) REFERENCES province(idProvince);

DESCRIBE ville;

INSERT INTO ville(
    nom,
    idProvince
    ) VALUES (
        'Edmonton',
        1
    ),
    (
        'Victoria',
        2
    ),
    (
        'Charlottetown',
        3
    ),
    (
        'Winnipeg',
        4
    ),
    (
        'Fredericton',
        5
    ),
    (
        'Halifax',
        6
    ),
    (
        'Toronto',
        7
    ),
    (
        'Québec',
        8
    ),
    (
        'Regina',
        9
    ),
    (
        'Saint John''s',
        10
    ),
    (
        'Iqaluit',
        11
    ),
    (
        'Yellowknife',
        12
    ),
    (
        'Whitehorse',
        13
    );
SELECT * FROM ville;

ALTER TABLE province
ADD COLUMN idPays INT UNSIGNED
AFTER idCapitale;
ALTER TABLE province
ADD CONSTRAINT fkPays FOREIGN KEY (idPays) REFERENCES pays(idPays);
DESCRIBE province;

UPDATE province
SET idCapitale = 1,
    idPays = 1
WHERE idProvince = 1;
UPDATE province
SET idCapitale = 2,
    idPays = 1
WHERE idProvince = 2;
UPDATE province
SET idCapitale = 3,
    idPays = 1
WHERE idProvince = 3;
UPDATE province
SET idCapitale = 4,
    idPays = 1
WHERE idProvince = 4;
UPDATE province
SET idCapitale = 5,
    idPays = 1
WHERE idProvince = 5;
UPDATE province
SET idCapitale = 6,
    idPays = 1
WHERE idProvince = 6;
UPDATE province
SET idCapitale = 7,
    idPays = 1
WHERE idProvince = 7;
UPDATE province
SET idCapitale = 8,
    idPays = 1
WHERE idProvince = 8;
UPDATE province
SET idCapitale = 9,
    idPays = 1
WHERE idProvince = 9;
UPDATE province
SET idCapitale = 10,
    idPays = 1
WHERE idProvince = 10;
UPDATE province
SET idCapitale = 11,
    idPays = 1
WHERE idProvince = 11;
UPDATE province
SET idCapitale = 12,
    idPays = 1
WHERE idProvince = 12;
UPDATE province
SET idCapitale = 13,
    idPays = 1
WHERE idProvince = 13;

-- Ou qui est valable simplement ici car dans nos données, les identifiants des provinces
-- correspondent à ceux des capitables.
-- UPDATE province
-- SET idVille = idProvince;

SELECT * FROM pays;

SELECT * FROM province;

SELECT * FROM ville;

-- Exercice 1.4 - Modifier les tables ```pays``` et ```ville```
ALTER TABLE ville
ADD COLUMN dateMAJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
AFTER idProvince;
ALTER TABLE pays
ADD COLUMN dateMAJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
AFTER nom;

-- Ce type de requête sera vu plus loin dans le cours
-- Elle permet de joindre plusieurs tables entre elles
-- et de sélectionner seulement l'information qui 
-- nous intéresse
SELECT province.nom AS province, code, date, population, superficie, densite, ville.nom AS capitale, pays.nom as pays
FROM province
INNER JOIN ville ON ville.idVille = province.idCapitale
INNER JOIN pays  ON pays.idPays   = province.idPays;
