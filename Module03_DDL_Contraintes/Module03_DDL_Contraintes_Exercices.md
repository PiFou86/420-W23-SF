# Module 03 - DDL - Contraintes

---

## Environnement

- MySQL Server
- MySQL Workbench

## Directive

##############################
- Sauvegardez vos réponses texte et vos instructions SQL dans un fichier au nom ```Module_02\Module02_DDL_CreationTables_Exercices_2_2.sql```
- Le corrigé est caché dans les exercices ou présent dans le répertoire de l'exercice
##############################

---

# Exercice 1 - Renommer une base de données

Discutez de la façon de renommer votre base de données ```module01_exercices_1_2``` en un autre nom.

- Peut-on renommer la base de données en utilisant l'instruction ```ALTER DATABASE``` ? Indiquez où vous avez trouvé cette réponse
- Quelles sont les modifications que vous pouvez apporter à une base de données avec la précédente commande ?
  - Listez les modifications possibles
  - Expliquez la différence entre ```CHARACTER SET``` et ```COLLATION```
- En vous basant sur [cet article](http://www.chicoree.fr/w/Renommer_une_base_MySQL), décrivez en vos mots la meilleure solution pour renommer une base de données.
- Testez votre solution en renommant votre base de données ```module01_exercices_1_2``` en ```maintenance```
- Validez que votre structure est la même
- Validez que vous avez bien toutes vos données

<details>
    <summary>Solution</summary>

- ```ALTER DABABASE``` : Lire la documentation https://dev.mysql.com/doc/refman/8.0/en/alter-database.html
- Character set et collation : lire la documentation https://dev.mysql.com/doc/refman/8.0/en/charset-general.html
- Pour afficher les différents encodages de caractères et de collation, tapez les commandes suivantes :

```sql
SHOW CHARACTER SET;

SHOW COLLATION;
```

- La solution la plus simple pour renommer une base de données dans MySQL est d'extraire la structure et les données avec l'utilitaire ```mysqldump``` et d'exécuter le script à partir d'une nouvelle base de données.

</details>

## Exercice 2 - Création de contraintes

- Partez du code SQL suivant :

<details>
    <summary>Code SQL</summary>

```sql
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
```

</details>

- À l'aide de la commande ```ALTER TABLE```, Ajoutez la contrainte nommée ```CHK_TemperatureSupMoins30``` :
  - Qui valide que la colonne ```MntTemperature``` à une valeur supérieure à 60
  - Est-ce que cela fonctionne ?
  - Pourquoi ?
  - Pour la suite de l'exercice, modifiez la validation pour que la température doive simplement être supérieure à -30

<details>
    <summary>Solution</summary>

```sql
ALTER TABLE Maintenance
ADD CONSTRAINT CHK_TemperatureSupMoins30 CHECK(MntTemperature > -30);
```

</details>

- À l'aide de la commande ```ALTER TABLE```, modifiez la colonne ```MntJour``` pour qu'elle n'accepte que les valeurs du jour de la semaine (de 'Lun' à 'Dim'). Pour cela, modifiez le type de la colonne pour 'ENUM'

<details>
    <summary>Indice</summary>

- [ALTER TABLE MODIFY COLUMN](https://www.w3schools.com/sql/sql_alter.asp)
- [ENUM](https://dev.mysql.com/doc/refman/8.0/en/enum.html)

</details>

<details>
    <summary>Solution</summary>

```sql
ALTER TABLE Maintenance
MODIFY COLUMN MntJour ENUM ('Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim');
```

</details>

- À l'aide de la commande ```ALTER TABLE```,ajoutez la contrainte ```CHK_VitessePositive```qui valide que la vitesse est positive.

<details>
    <summary>Solution</summary>

```sql
ALTER TABLE Maintenance
ADD CONSTRAINT CHK_VitessePositive CHECK(MntVitesse > 0);
```

</details>

- Créez des requêtes d'insertion qui valident que vos contraintes fonctionnes : certaines doivent donc échouer, d'autres réussir.
- Analysez les messages d'erreur qui sont renvoyés
- Modifiez la commande de la création de la table afin d'y intégrer directement les contraintes précédentes

<details>
    <summary>Solution</summary>

```sql
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
```

</details>
