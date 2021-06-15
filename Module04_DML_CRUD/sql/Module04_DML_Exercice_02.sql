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

-- Exercice 2.3 - Un avant gout de la suite
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