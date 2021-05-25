# Module 02 - Création de tables 2 / 2

---

## Environnement

- MySQL Server
- MySQL Workbench

## Directive

- Sauvegardez vos réponses texte et vos instructions SQL dans un fichier au nom ```Module_02\Module02_DDL_CreationTables_Exercices_2_2.sql```
- Le corrigé est caché dans les exercices ou présent dans le répertoire de l'exercice

---

## Exercice 1 - Base de données "geographie"

### Exercice 1.1 - Création de la base de données

- Créez le fichier ```Module_02\Module02_DDL_CreationTables_Exercices_2_2.sql```
- Écrivez les instructions pour :
  - Créer la base de données ``geographie```. Si elle existe, le script doit la supprimer
  - Utiliser la base précédemment créée
- Exécutez votre script SQL
- En utilisant les commandes SQL que vous avez apprises, validez que la base de données existe bien

<details>
    <summary>Solution</summary>

```sql
DROP DATABASE IF EXISTS goegraphie;
CREATE DATABASE goegraphie;
USE goegraphie;
```

</details>

### Exercice 1.2 - Création des tables

- À partir des données présentées dans le tableau suivant, proposez une définition pour créer la table ```province``` dans la base de données ```geographie```

| Nom                       | Code | Date       | Population | Superficie | Densité | Capitale      |
|---------------------------|------|------------|-----------:|-----------:|--------:|---------------|
| Alberta                   | AB   | 1905-09-01 | 4 067 175  | 661 848    | 6,15    | Edmonton      |
| Colombie-Britannique      | BC   | 1871-07-20 | 4 648 055  | 944 735    | 4,92    | Victoria      |
| Île-du-Prince-Édouard     | PE   | 1873-07-01 | 142 907    | 5 660      | 25,25   | Charlottetown |
| Manitoba                  | MB   | 1870-07-15 | 1 278 365  | 72 908     | 1,97    | Winnipeg      |
| Nouveau-Brunswick         | NB   | 1867-07-01 | 747 101    | 72 908     | 10,25   | Fredericton   |
| Nouvelle-Écosse           | NS   | 1867-07-01 | 923 598    | 55 284     | 16,71   | Halifax       |
| Ontario                   | ON   | 1867-07-01 | 13 448 494 | 1 076 395  | 12,49   | Toronto       |
| Québec                    | QC   | 1867-07-01 | 8 164 361  | 1 542 056  | 5,3     | Québec        |
| Saskatchewan              | SK   | 1905-09-01 | 1 098 352  | 651 036    | 1,69    | Regina        |
| Terre-Neuve-et-Labrador   | NL   | 1949-03-31 | 519 716    | 405 212    | 1,28    | Saint John's  |
| Nunavut                   | NU   | 1999-04-01 | 35 994     | 2 093 190  | 0,02    | Iqaluit       |
| Territoires du Nord-Ouest | NT   | 1870-07-15 | 41 786     | 1 346 106  | 0,03    | Yellowknife   |
| Yukon                     | YT   | 1898-06-13 | 35 874     | 482 443    | 0,07    | Whitehorse    |

- Exécutez le code de création
- À l'aide d'une commande SQL, validez votre structure
- À partir d'un champ existant ou d'un nouveau, proposez une clef primaire pour la table ```province```
- Modifiez la table ```province``` en ajoutant le champ de date de mise à jour, nommé ```dateMAJ``` qui doit être de type TIMESTAMP avec la valeur par défaut ```DEFAULT CURRENT\_TIMESTAMP ON UPDATE CURRENT\_TIMESTAMP```
**Voici un exemple de code [extrait de la documentation](https://dev.mysql.com/doc/refman/8.0/en/timestamp-initialization.html)**

```sql
CREATE TABLE t1 (
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dt DATETIME  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

- À l'aide d'une commande SQL, validez votre structure
- Créez les enregistrements dans la table
- Vérifiez vos données

<details>
    <summary>Solution</summary>

```sql
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
```

</details>

### Exercice 1.3 - Ajouter des tables de relations

Pour les nouvelles tables que vous allez créer, n'oubliez pas de créer une colonne contenant la clef primaire.

- Ajoutez la nouvelle table ```pays``` qui contient les informations sur les pays. Votre table pays peut pour l'instant n'avoir que "Canada" comme valeur
- Ajoutez la nouvelle table ```ville``` qui contient les informations sur les villes. Votre table ville doit contenir les enregistrements du tableau précédent dans le champ Capitale
- Dans la table ```ville```, ajoutez une clef étrangère vers la table ```province```
- À l'aide d'une commande SQL, validez votre structure
- Ajoutez les données nécessaires dans la table ```ville```
- Modifiez la table ```province``` afin de référer les données de la table ```ville```
- En vous basant sur l'exemple suivant, modifiez les données pour ajouter les bonnes valeurs de clefs étrangères :

```sql
UPDATE province
SET idVille = 1
WHERE idProvince = 1;
```

- À l'aide d'une commande SQL, validez votre structure

<details>
    <summary>Solution</summary>

```sql
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
```

</details>

### Exercice 1.4 - Modifier les tables ```pays``` et ```ville```

- Modifiez les tables ```pays``` et ```ville``` pour y ajouter le champ de date de dernière mise à jour
- À l'aide d'une commande SQL, validez votre structure
- Vérifiez vos données

<details>
    <summary>Solution</summary>

```sql
ALTER TABLE ville
ADD COLUMN dateMAJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
AFTER idProvince;
ALTER TABLE pays
ADD COLUMN dateMAJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
AFTER nom;
```

</details>
    \subsection{Modifier vos tables}
    
    \begin{enumerate}[label=\arabic*)]
        \item {\color{blue}Clause ALTER TABLE ADD COLUMN}\footnote{Au besoins voir : https://dev.mysql.com/doc/refman/8.0/en/alter-table.html} : Ajouter le champ date de mise à jour aux tables ville et pays.
        
        \section{Base de données maintenance}
        En utilisant votre base de données maintenance, créée à l'exercice 2, procédé aux modifications suivantes : 
