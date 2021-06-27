/*
Corrigé de l'exercice 7
Jean-Pierre Duchenseau
2 octobre 2019
*/
use elevagech24;

*/
Afficher une phrase donnant le prix de l’espèce, pour chaque espèce\\
	Par exemple, afficher « Un chat coûte 100 euros. », ou une autre phrase du genre, et
	ce pour les cinq espèces enregistrées.
*/
SELECT CONCAT('Un(e) ', nom_courant, ' coûte ', prix, ' euros.'
) AS Solution
FROM Espece;

-- ou
SELECT CONCAT_WS(' ','Un(e)', nom_courant, 'coûte', prix, '
euros.') AS Solution
FROM Espece;

/*
Afficher les chats dont la deuxième lettre du nom est un « a »
*/
SELECT Animal.nom , Espece.nom_courant
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Chat '
 AND SUBSTRING(nom , 2, 1) = 'a';	
 
 /*
 Afficher les noms des perroquets en remplaçant les « a » par « @ » et les
	« e » par « 3 » pour en faire des perroquets Kikoolol\\
	\textbf{Attention :} il est tout à fait possible d’imbriquer plusieurs fonctions, ici c'est le cas avec la fonction REPLACE().
*/
SELECT REPLACE(REPLACE(nom , 'a', '@'), 'e', '3') AS Solution
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant LIKE 'Perroquet%';		

/*
Afficher les chiens dont le nom a un nombre pair de lettres
*/
SELECT nom , nom_courant
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE nom_courant = 'Chien '
AND CHAR_LENGTH(nom)%2 = 0;

-- OU
SELECT nom , nom_courant
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE nom_courant = 'Chien '
AND CHAR_LENGTH(nom) MOD 2 = 0;

-- OU
SELECT nom , nom_courant
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE nom_courant = 'Chien '
AND MOD(CHAR_LENGTH(nom),2) = 0;		

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Fonction d'agrégation -- 
 
-- Combien de races avons-nous dans la table Race ?

SELECT count(*) 
FROM Race;

-- De combien de chiens connaissons-nous le père ?

SELECT COUNT(pere_id)
FROM Animal
INNER JOIN Espece ON Espece.id = Animal.espece_id
WHERE Espece.nom_courant = 'Chien ';

-- Quelle est la date de naissance de notre plus jeune femelle ?

SELECT 
    MAX(date_naissance)
FROM
    Animal
WHERE
    sexe = 'F';	

-- En moyenne, quel est le prix d’un chien ou d’un chat de race, par espèce, et en général ?

SELECT nom_courant AS Espece , AVG(Race.prix) AS prix_moyen
FROM Race
	 INNER JOIN Espece ON Race.espece_id = Espece.id
WHERE Espece.nom_courant IN ('Chat ', 'Chien ')
GROUP BY Espece.nom_courant WITH ROLLUP;

-- Combien avons-nous de perroquets mâles et femelles, et quels sont leurs noms (en une seule requête bien sûr) ?

SELECT sexe , COUNT(*), GROUP_CONCAT(nom SEPARATOR ', ')
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE nom_courant = 'Perroquet amazone '
GROUP BY sexe;		

-- Quelles sont les races dont nous ne possédons aucun individu ?

SELECT Race.nom , COUNT(Animal.race_id) AS nombre
FROM Race
LEFT JOIN Animal ON Animal.race_id = Race.id
GROUP BY Race.nom
HAVING nombre = 0;

-- Quelles sont les espèces (triées par ordre alphabétique du nom latin) dont nous possédons moins de cinq mâles ?

SELECT Espece.nom_latin , COUNT(espece_id) AS nombre
FROM Espece
 LEFT JOIN Animal ON Animal.espece_id = Espece.id
WHERE sexe = 'M' OR Animal.id IS NULL
GROUP BY Espece.nom_latin
HAVING nombre < 5;		

/*
Combien de mâles et de femelles de chaque race avons-nous, avec un  compte total intermédiaire pour les races (mâles et femelles confondues) 
et pour les espèces ? Afficher le nom de la race, et le nom courant de l’espèce.
*/

SELECT Animal.sexe , Race.nom , Espece.nom_courant , COUNT (*) AS
nombre
FROM Animal
 INNER JOIN Espece ON Animal.espece_id = Espece.id
 INNER JOIN Race ON Animal.race_id = Race.id	
WHERE Animal.sexe IS NOT NULL
GROUP BY Espece.nom_courant , Race.nom , sexe WITH ROLLUP; 

-- Quel serait le coût, par espèce et au total, de l’adoption de Parlotte, Spoutnik, Caribou, Cartouche, Cali, Canaille, Yoda, Zambo et Lulla ?

SELECT Espece.nom_courant , SUM(COALESCE(Race.prix , Espece.prix)
) AS somme
FROM Animal
 INNER JOIN Espece ON Espece.id = Animal.espece_id
 LEFT JOIN Race ON Race.id = Animal.race_id
WHERE Animal.nom IN ('Parlotte ', 'Spoutnik ', 'Caribou ', '
Cartouche ', 'Cali ', 'Canaille ', 'Yoda ', 'Zambo ', 'Lulla ')
GROUP BY Espece.nom_courant WITH ROLLUP;	




