-- Module 04 - DML - CRUD

-- Exercice 1.1 - Création de la base de données
DROP DATABASE IF EXISTS Module04_Exercice1;

CREATE DATABASE Module04_Exercice1;
USE Module04_Exercice1;

CREATE TABLE SERVICES
(
  NO_SERVICE  INTEGER PRIMARY KEY,
  NOM         VARCHAR(20) NOT NULL,
  LIEU        VARCHAR(30) NOT NULL
);

CREATE TABLE EMPLOYES
(
  NO_EMPLOYE    INTEGER PRIMARY KEY,
  NOM           VARCHAR(30) NOT NULL,
  JOB           VARCHAR(15) NOT NULL,
  MGR           INTEGER NULL,
  DATE_EMBAUCHE DATE NOT NULL,
  SALAIRE       FLOAT NOT NULL,
  COMMISSION    FLOAT NULL,
  NO_SERVICE    INTEGER NOT NULL,
  FOREIGN KEY (NO_SERVICE) REFERENCES SERVICES(NO_SERVICE),
  FOREIGN KEY (MGR) REFERENCES EMPLOYES(NO_EMPLOYE)
);

INSERT INTO SERVICES VALUES
   (10, 'Comptabilité', 'Toronto'),
   (20, 'Recherche', 'Québec'),
   (30, 'Ventes', 'Montréal'),
   (40, 'Opérations', 'Québec');

INSERT INTO EMPLOYES  VALUES
(7839, 'Musk', 'Président', NULL, '1981-11-17', 5000, NULL, 10),
(7566, 'Murdock', 'Manager', 7839, '1981-04-02', 2975, NULL, 20),
(7902, 'Grim', 'Analyste', 7566, '1981-03-12', 3000, NULL, 20),
(7369, 'Baillargeon', 'Employe', 7902, '1980-07-12', 800, NULL, 20),
(7698, 'Pianetti', 'Manager', 7839, '1981-05-01', 2850, NULL, 30),
(7499, 'Franchi', 'Vendeur', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'Ouvrard', 'Vendeur', 7698, '1981-02-22', 1250, 500, 30),
(7654, 'Martin', 'Vendeur', 7698, '1981-09-28', 1250, 1400, 30),
(7782, 'Deleglise', 'Manager', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'Gorlin', 'Analyste', 7566, '1982-09-12', 3000, NULL, 20),
(7844, 'Hulk', 'Vendeur', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'Parker', 'Employe', 7788, '1983-12-01', 1100, NULL, 20),
(7900, 'Xavier', 'Employe', 7698, '1981-03-12', 950, NULL, 30),
(7934, 'Lee', 'Employe', 7782, '1982-01-23', 1300, NULL, 10);

INSERT INTO EMPLOYES VALUES
(8123,'Flash','Analyste',NULL,'1979-11-23',1500.00,NULL,20),
(8635,'Wells','Manager',7839,'1981-04-02',4500.00,NULL,20);

UPDATE EMPLOYES
SET MGR = 8635
WHERE NO_EMPLOYE = 8123;

SELECT 
    NO_EMPLOYE AS 'Numero employé',
    NOM AS Nom,
    JOB AS Role,
    MGR AS 'Responsable',
    DATE_EMBAUCHE AS 'Date d''embauche',
    SALAIRE AS 'Salaire',
    --IFNULL(COMMISSION, 'Aucune') AS Commission,
    COMMISSION AS Commission,
    NO_SERVICE AS 'Numéro de service'
FROM
    EMPLOYES;

-- Exercice 1.2 - Sélections simples
SELECT NOM, SALAIRE FROM EMPLOYES WHERE NO_SERVICE = 10;

SELECT NOM, SALAIRE FROM EMPLOYES WHERE NO_SERVICE IN (10, 20);

SELECT NOM, SALAIRE, COMMISSION FROM EMPLOYES WHERE COMMISSION IS NOT NULL AND COMMISSION != 0;

SELECT NOM, SALAIRE, COMMISSION FROM EMPLOYES WHERE JOB = 'Vendeur' AND (COMMISSION IS NULL OR COMMISSION = 0);

SELECT NOM, SALAIRE FROM EMPLOYES WHERE JOB = 'Manager' AND SALAIRE > 2500;

SELECT * FROM EMPLOYES WHERE SALAIRE >= 1500 AND SALAIRE <= 2000;

-- Exercice 1.3 - Sélection avec opérateurs
SELECT * FROM EMPLOYES WHERE SALAIRE BETWEEN 1500 AND 2000;

SELECT * FROM EMPLOYES WHERE NOM LIKE '%L%';

SELECT * FROM EMPLOYES WHERE NOM LIKE '%L%L%';

SELECT * FROM EMPLOYES WHERE NOM LIKE '__L%';

SELECT * FROM EMPLOYES WHERE JOB IN ('Manager', 'Vendeur', 'Employe');

SELECT NOM, CASE WHEN JOB = 'Manager' OR JOB = 'President' THEN 'Cadre' ELSE 'Non cadre' END AS Libelle FROM EMPLOYES;

SELECT NOM, SALAIRE, CASE WHEN SALAIRE >= 3000 THEN 1 ELSE NULL END AS 'Haut salaire', CASE WHEN SALAIRE < 3000 THEN 1 ELSE NULL END AS 'Bas salaire' FROM EMPLOYES;

SELECT SALAIRE FROM EMPLOYES WHERE BINARY(NOM) = 'DELEGLISE';

SELECT SALAIRE FROM EMPLOYES WHERE BINARY(NOM) = 'Deleglise';

SELECT NOM, CASE NO_SERVICE WHEN 10 THEN 'dix' WHEN 20 THEN 'vingt' WHEN 30 THEN 'trente' END AS NoService FROM EMPLOYES;

SELECT * FROM EMPLOYES WHERE NOM LIKE '%E';

SELECT * FROM EMPLOYES WHERE NOM REGEXP 'E$';

SELECT NOM, (SALAIRE + IFNULL(COMMISSION, 0)) * 12 AS 'Salaire annuel' FROM EMPLOYES;

SELECT NOM, SALAIRE * 1.15 AS 'Salaire projeté' FROM EMPLOYES WHERE JOB = 'Vendeur';

SELECT NOM, SALAIRE MOD 100 AS 'Salaire % 100 avec MOD', (SALAIRE - (SALAIRE DIV 100) * 100) AS 'Salaire % 100 sans MOD' FROM EMPLOYES;

SELECT * FROM EMPLOYES ORDER BY NOM;

SELECT * FROM EMPLOYES ORDER BY SALAIRE DESC;

SELECT * FROM EMPLOYES ORDER BY COMMISSION DESC LIMIT 2;

SELECT * FROM EMPLOYES ORDER BY COMMISSION DESC LIMIT 2,1;

-- Exercice 1.4 - Un avant goût de la suite
SELECT 
    e.NO_EMPLOYE AS 'Numero employé',
    e.NOM AS Nom,
    e.JOB AS Role,
    e.MGR AS 'Responsable',
    e.DATE_EMBAUCHE AS 'Date d\'embauche',
    e.SALAIRE AS 'Salaire',
    IFNULL(e.COMMISSION, 'Aucune') AS Commission,
    s.NOM AS 'Service',
    s.LIEU AS 'Ville'
FROM
    EMPLOYES AS e
        INNER JOIN
    SERVICES AS s ON e.NO_SERVICE = s.NO_SERVICE;

SELECT 
    e.NO_EMPLOYE AS 'Numero employé',
    e.NOM AS Nom,
    e.JOB AS Role,
    r.NOM AS 'Responsable',
    e.DATE_EMBAUCHE AS 'Date d''embauche',
    e.SALAIRE AS 'Salaire',
    IFNULL(e.COMMISSION, 'Aucune') AS Commission,
    s.NOM AS 'Service',
    s.LIEU AS 'Ville'
FROM
    EMPLOYES AS e
        LEFT JOIN
    EMPLOYES AS r ON e.MGR = r.NO_EMPLOYE
        INNER JOIN
    SERVICES AS s ON e.NO_SERVICE = s.NO_SERVICE;