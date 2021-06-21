-- Module 04 - DML - CRUD
-- Exercice 2.2
USE MARKETING;

SELECT 
    id_ville AS 'No de ville',
    ville AS 'Ville',
    mpopul AS 'Population'
FROM
    ville
WHERE
    ville = 'Gaspé';
    
SELECT 
    ville AS 'Ville',
    mpopul AS 'Population',
    regadm AS 'Région administrative '
FROM
    ville
ORDER BY mpopul DESC;

SELECT 
    ville AS 'Ville',
    mpopul AS 'Population',
    regadm AS 'Région administrative '
FROM
    ville
ORDER BY ville LIMIT 15 OFFSET 0; -- Ou LIMIT 0, 15

SELECT 
    ville AS 'Ville',
    mpopul AS 'Population',
    regadm AS 'Région administrative '
FROM
    ville
ORDER BY ville DESC LIMIT 15 OFFSET 0; -- Ou LIMIT 0, 15

SELECT 
    ville AS 'Ville',
    mpopul AS 'Population',
    regadm AS 'Région administrative '
FROM
    ville
ORDER BY ville LIMIT 15 OFFSET 1116; -- 1131 - 15

SELECT 
    id_ville AS 'No de ville',
    ville AS 'Ville',
    mpopul AS 'Population'
FROM
    ville
WHERE
    mpopul = 0;
    
SELECT 
    COUNT(id_ville) AS 'Nb de ville ayant 0 habitant'
FROM
    ville
WHERE
    mpopul = 0;
    
-- Nous avons simplement le nombre de villes sans habitant : la reqête a afficher le nombre d'enregistrements à la place d'afficher les enregistrements.

SELECT 
    *
FROM
    contact
WHERE
    email_contact LIKE '%ca';

SELECT 
    nom_contact
FROM
    contact
WHERE
    nom_contact LIKE 'b%';
    
SELECT 
    nom_contact
FROM
    contact
WHERE
    nom_contact LIKE '%a%a%';


-- Exercice 2.3 - Statistiques
SELECT 
    *
FROM
    appel
ORDER BY appel_date
LIMIT 1;

SELECT 
    *
FROM
    appel
ORDER BY appel_date DESC
LIMIT 1;

SELECT 
    *
FROM
    appel
ORDER BY appel_heure
LIMIT 1;

SELECT 
    *
FROM
    appel
ORDER BY appel_heure DESC
LIMIT 1;

SELECT 
    *
FROM
    appel
WHERE
    appel_date = '2018-02-21'
ORDER BY appel_heure;
    
SELECT 
    *
FROM
    appel
WHERE
    appel_date = '2018-02-21'
        AND appel_heure <= '12:00'
ORDER BY appel_heure;

SELECT Commo_Name, Capital, `ISO_4217 Currency Name`, `ITU-T_Telephone_Code`, `IANA_Country_Code_TLD`
FROM tc_pays
WHERE Commo_Name='Colombia';

SELECT Commo_Name, Capital, `ISO_4217 Currency Name`, `ITU-T_Telephone_Code`, `IANA_Country_Code_TLD`
FROM tc_pays
WHERE Commo_Name='France';


SELECT *
FROM tc_pays
WHERE `IANA_Country_Code_TLD` = '.aq';

SELECT *
FROM tc_pays
WHERE `IANA_Country_Code_TLD` = '';

-- Non demandée pour préparation seulement
SELECT COUNT(*), IANA_Country_Code_TLD
FROM tc_pays
GROUP BY IANA_Country_Code_TLD;

SELECT * 
FROM rendezvous
WHERE rdv_date BETWEEN '2018-02-01' AND '2018-02-28'
ORDER BY rdv_date, rdv_heure;

SELECT * FROM rendezvous WHERE rdv_fait = 0 ORDER BY rdv_date; -- 12 février 2019

-- Exercice 2.4 - Un avant gout de la suite
SELECT COUNT(id_ville) FROM ville; -- Notez la quantité. 
SELECT COUNT(id_province) FROM province; -- Notez la quantité.

DESCRIBE ville;
DESCRIBE province;

SELECT 
    ville, mpopul, province
FROM
    ville
        INNER JOIN
    province ON ville.id_province = province.id_province;
    
SELECT 
    COUNT(*)
FROM
    ville
        INNER JOIN
    province ON ville.id_province = province.id_province;
    
SELECT 
    *
FROM
    contact
WHERE
    email_contact LIKE '%ca';

SELECT 
    nom_contact
FROM
    contact
WHERE
    nom_contact LIKE 'b%';
    
SELECT 
    nom_contact
FROM
    contact
WHERE
    nom_contact LIKE '%a%a%';
