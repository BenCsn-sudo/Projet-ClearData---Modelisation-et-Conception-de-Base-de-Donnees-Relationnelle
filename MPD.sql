#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP TABLE IF EXISTS Detecter;
DROP TABLE IF EXISTS Contient;
DROP TABLE IF EXISTS Redaction;
DROP TABLE IF EXISTS Gaz;
DROP TABLE IF EXISTS Mesure;
DROP TABLE IF EXISTS Rapports;
DROP TABLE IF EXISTS Capteurs;
DROP TABLE IF EXISTS Agents_Technique;
DROP TABLE IF EXISTS Agents_Administratif;
DROP TABLE IF EXISTS Chefs_Agences;
DROP TABLE IF EXISTS Employes;
DROP TABLE IF EXISTS Agences;


#------------------------------------------------------------
# Table: Agences
#------------------------------------------------------------

CREATE TABLE Agences(
        ID_Agences      Int NOT NULL auto_increment,
        Ville_Agences   Varchar (50) NOT NULL ,
        Region_Agences  Varchar (60) NOT NULL ,
        Adresse_Agences Varchar (120) NOT NULL
	,CONSTRAINT Agences_PK PRIMARY KEY (ID_Agences)
)ENGINE=InnoDB;

-- Insertion des 18 régions françaises dans la table Agences
INSERT INTO Agences (Ville_Agences, Region_Agences, Adresse_Agences) 
VALUES
-- Régions métropolitaines
('Lyon', 'Auvergne-Rhône-Alpes', '1 Place de la Préfecture, 69000 Lyon'),
('Dijon', 'Bourgogne-Franche-Comté', '1 Place de la Préfecture, 21000 Dijon'),
('Rennes', 'Bretagne', '1 Place de la Préfecture, 35000 Rennes'),
('Orléans', 'Centre-Val de Loire', '1 Place de la Préfecture, 45000 Orléans'),
('Ajaccio', 'Corse', '1 Place de la Préfecture, 20000 Ajaccio'),
('Strasbourg', 'Grand Est', '1 Place de la Préfecture, 67000 Strasbourg'),
('Lille', 'Hauts-de-France', '1 Place de la Préfecture, 59000 Lille'),
('Paris', 'Île-de-France', '1 Place de la Préfecture, 75000 Paris'),
('Rouen', 'Normandie', '1 Place de la Préfecture, 76000 Rouen'),
('Bordeaux', 'Nouvelle-Aquitaine', '1 Place de la Préfecture, 33000 Bordeaux'),
('Toulouse', 'Occitanie', '1 Place de la Préfecture, 31000 Toulouse'),
('Nantes', 'Pays de la Loire', '1 Place de la Préfecture, 44000 Nantes'),
('Marseille', 'Provence-Alpes-Côte d\'Azur', '1 Place de la Préfecture, 13000 Marseille'),

-- Régions ultramarines
('Basse-Terre', 'Guadeloupe', 'Rue de la Préfecture, 97100 Basse-Terre'),
('Fort-de-France', 'Martinique', 'Rue de la Préfecture, 97200 Fort-de-France'),
('Cayenne', 'Guyane', 'Avenue de la Préfecture, 97300 Cayenne'),
('Saint-Denis', 'La Réunion', 'Rue de la Préfecture, 97400 Saint-Denis'),
('Mamoudzou', 'Mayotte', 'Rue de la Préfecture, 97600 Mamoudzou');


#------------------------------------------------------------
# Table: Employés
#------------------------------------------------------------

CREATE TABLE Employes(
        ID_Employes             Int NOT NULL auto_increment,
        Nom_Employes            Varchar (60) NOT NULL ,
        Prenom_Employes         Varchar (60) NOT NULL ,
        Date_Naissance_Employes Date NOT NULL ,
        Date_Embauche_Employes  Date NOT NULL ,
        Adresse_Employes        Varchar (120) NOT NULL ,
        ID_Agences              Int NOT NULL
	,CONSTRAINT Employes_PK PRIMARY KEY (ID_Employes)

	,CONSTRAINT Employes_Agences_FK FOREIGN KEY (ID_Agences) REFERENCES Agences(ID_Agences)
)ENGINE=InnoDB;

INSERT INTO Employes (Nom_Employes, Prenom_Employes, Date_Naissance_Employes, Date_Embauche_Employes, Adresse_Employes, ID_Agences) 
VALUES
('Charleen', 'Decker', '1984-05-27', '1988-12-26', '31 Golf Course Trail', 1),
('Maxim', 'Pettifer', '1993-02-13', '2019-05-07', '1 3rd Court', 2),
('Hamilton', 'Madle', '1984-11-08', '1990-04-14', '210 Fairfield Circle', 3),
('Lilias', 'Franceschelli', '1971-01-02', '1990-02-15', '94 Haas Trail', 4),
('Morse', 'Lackmann', '1974-08-22', '1998-08-13', '62241 Forest Dale Park', 5),
('Eziechiele', 'Suermeiers', '1986-04-24', '2017-10-31', '140 Hagan Terrace', 6),
('Valaree', 'Seydlitz', '1980-02-01', '1997-03-30', '0 Schurz Trail', 7),
('Albertine', 'Galego', '1969-08-15', '1989-01-22', '731 Petterle Trail', 8),
('Jaclin', 'Reddle', '1988-11-19', '2008-11-11', '9 Manley Street', 9),
('Rosanna', 'Kissock', '1979-01-14', '2010-06-23', '6 Saint Paul Court', 10),
('Ora', 'Wiggins', '1999-03-16', '2022-02-14', '36687 Amoth Crossing', 11),
('Ogdan', 'Strewther', '1965-10-23', '1998-10-08', '01 Havey Court', 12),
('Hernando', 'Gyngell', '1982-06-01', '2011-11-17', '76463 Cordelia Terrace', 13),
('Eduino', 'Dunk', '1966-11-03', '2018-03-18', '51658 Michigan Crossing', 14),
('Bruce', 'Doutch', '1986-09-11', '2024-02-16', '2 Monument Point', 15),
('Lindy', 'Freyne', '1979-09-25', '1992-03-28', '807 East Way', 16),
('Caren', 'Fathers', '1973-04-04', '1987-10-03', '0 Browning Place', 17),
('Edwin', 'Ales0', '1993-04-19', '1988-09-25', '4307 Oakridge Pass', 18),
('Devina', 'Trengrouse', '1967-02-21', '2005-02-14', '04270 Waxwing Crossing', 1),
('Rubie', 'Ibbetson', '1981-02-02', '1999-06-14', '95 Dakota Junction', 2),
('Vincenz', 'Dunsmuir', '1978-11-15', '1997-01-07', '55 Continental Circle', 3),
('Jaquenetta', 'Hannibal', '1996-04-20', '1987-07-26', '14761 Blackbird Hill', 4),
('Ebonee', 'Keefe', '1971-02-27', '2006-06-11', '57 Vahlen Terrace', 5),
('Henderson', 'Hollebon', '1973-04-27', '2001-01-09', '12183 David Trail', 6),
('Clemente', 'Couper', '1985-10-15', '1996-12-07', '649 Vera Road', 7),
('Frank', 'Bellini', '1960-08-23', '2020-03-22', '31 Westridge Trail', 8),
('Janka', 'Hoyt', '1988-10-22', '2022-02-22', '67237 Red Cloud Center', 9),
('Ignatius', 'Grafton-Herbert', '1973-06-16', '1992-09-10', '8316 Little Fleur Parkway', 10),
('Magdalene', 'Lapthorn', '1985-06-21', '2006-04-05', '73383 Oneill Street', 11),
('Kelbee', 'Bennetts', '1965-11-03', '1989-07-19', '0795 Maywood Circle', 12),
('Washington', 'Duckitt', '1961-07-08', '1985-07-29', '652 Morrow Crossing', 13),
('Ali', 'Gebuhr', '1996-12-09', '2021-12-12', '58944 Monument Way', 14),
('Daffie', 'Lanceley', '1972-02-13', '2022-07-27', '4 Karstens Drive', 15),
('Hermione', 'Kruse', '1981-04-03', '1992-01-08', '73561 Namekagon Center', 16),
('Lenci', 'De Cleyne', '1975-01-25', '2001-10-30', '97163 Pennsylvania Place', 17),
('Nicol', 'Cowey', '1982-09-28', '2019-05-03', '13 Upham Park', 18),
('Tami', 'Tustin', '1989-07-14', '1999-10-09', '7 Schiller Trail', 1),
('Lorene', 'Klageman', '1969-05-19', '2020-07-06', '86986 Scott Alley', 2),
('Ludwig', 'Hallford', '1968-03-05', '2013-07-11', '06 Nobel Pass', 3),
('Adah', 'Callear', '1989-03-07', '1999-04-30', '520 Artisan Pass', 4),
('Danya', 'Estoile', '1971-02-10', '1998-12-03', '7 Meadow Valley Trail', 5),
('Shirley', 'Elwin', '1971-09-08', '1985-12-27', '0607 Fairfield Road', 6),
('Kendre', 'McGahy', '1990-03-30', '2017-02-24', '20 Bartillon Park', 7),
('Malissa', 'Greggs', '1984-05-13', '1997-05-29', '5 Mallory Plaza', 8),
('Guillaume', 'Karlik', '1961-03-08', '2020-02-09', '234 Lyons Pass', 9),
('Rhonda', 'Hercules', '1998-11-08', '1992-07-22', '5 Leroy Court', 10),
('Janaya', 'Barke', '1961-11-17', '2008-03-14', '052 Fairfield Junction', 11),
('Laetitia', 'Okenfold', '1973-03-20', '2017-11-05', '4352 Drewry Avenue', 12),
('Odele', 'Ivanonko', '1974-08-28', '2001-01-23', '6 Anderson Trail', 13),
('Minda', 'Portingale', '1984-08-27', '1999-10-19', '93 Karstens Place', 14),
('Deedee', 'Tibalt', '1979-08-30', '2009-01-13', '09 Sycamore Place', 15),
('Gerianna', 'Mandeville', '1963-02-07', '1996-01-23', '6482 Amoth Circle', 16),
('Merv', 'Magog', '1960-04-15', '1989-10-26', '684 Bowman Lane', 17),
('Sheff', 'Brissard', '1977-10-17', '2013-11-25', '76256 Hooker Point', 18),
('Ban', 'Walls', '1991-04-11', '2010-01-13', '3 Walton Court', 1),
('Iggy', 'Skeath', '1993-05-24', '1994-02-14', '04711 Thackeray Alley', 2),
('Briana', 'Laffan', '1965-10-30', '2024-08-11', '5280 Fuller Plaza', 3),
('Brigid', 'Devitt', '1995-03-04', '1988-02-12', '1 Spaight Circle', 4),
('Loni', 'Kleynermans', '1993-03-14', '2007-04-23', '8276 International Place', 5),
('Collin', 'Sarvar', '1960-12-18', '2023-02-04', '24 Debs Alley', 6),
('Jeremie', 'Buesnel', '1993-11-22', '1998-07-29', '83 Shelley Alley', 7),
('Lothaire', 'Gunthorpe', '1999-07-29', '1995-02-04', '0 Clemons Court', 8),
('Artie', 'Clowes', '1981-11-20', '2013-06-23', '47 Loomis Park', 9),
('Ingeborg', 'Lakenton', '1969-09-15', '2009-05-18', '60 Gerald Court', 10),
('Marc', 'Stiffkins', '1998-09-16', '1985-06-12', '793 Sachtjen Junction', 11),
('Chrysa', 'Exon', '1983-01-19', '1990-08-14', '492 Bluejay Road', 12),
('Venus', 'Mathey', '1987-01-09', '1999-08-20', '282 Thompson Center', 13),
('Andonis', 'Oswal', '1997-06-09', '2013-07-21', '1499 West Crossing', 14),
('Maxi', 'Scamal', '1966-05-05', '2000-04-16', '3 7th Avenue', 15),
('Michele', 'Brace', '1968-09-21', '2022-08-12', '39213 Havey Center', 16),
('Willey', 'Kilminster', '1993-07-01', '2010-10-07', '58 Kenwood Point', 17),
('Ynes', 'Cruddas', '1980-05-20', '1989-06-14', '8 Oneill Circle', 18),
('Otes', 'Matanin', '1983-12-01', '1996-12-21', '38348 Briar Crest Road', 1),
('Kory', 'Caush', '1970-04-15', '2014-09-01', '219 Hermina Center', 2),
('Yettie', 'Gotling', '1962-08-30', '2021-10-14', '5 Continental Point', 3),
('Del', 'Godehard.sf', '1961-01-22', '2007-11-10', '5 School Way', 4),
('Ardella', 'Esterbrook', '1963-08-24', '2017-03-07', '15902 Lake View Circle', 5),
('Georgianne', 'Canaan', '1978-11-18', '2012-04-30', '986 Stang Trail', 6),
('Odo', 'McAdam', '1983-01-05', '2019-08-20', '392 Westend Point', 7),
('Rodrigo', 'McAllester', '1993-10-31', '2024-12-04', '46 Stone Corner Court', 8),
('Duane', 'Porrett', '1997-05-17', '1987-04-24', '21 Orin Point', 9),
('Isis', 'Simanenko', '1965-10-10', '2002-09-05', '14 Melrose Center', 10),
('Ketty', 'Escritt', '1961-03-13', '2008-06-23', '1323 Eggendart Park', 11),
('Eddy', 'Biswell', '1988-06-20', '1990-06-19', '53115 Darwin Drive', 12),
('Reider', 'Sooley', '1999-09-10', '1987-10-23', '393 Granby Place', 13),
('Timothee', 'Casburn', '1995-03-04', '2024-03-12', '16 Katie Plaza', 14),
('Ruben', 'Hinemoor', '1978-09-01', '1992-10-01', '1616 Warrior Plaza', 15),
('Gilligan', 'Stallion', '1975-09-17', '1997-08-25', '83456 Autumn Leaf Alley', 16),
('Naomi', 'Spurman', '1988-10-13', '2020-06-09', '24 Meadow Ridge Crossing', 17),
('Velma', 'Sprigg', '1960-06-14', '2008-03-01', '78116 Glacier Hill Junction', 18),
('Jolie', 'Freshwater', '1971-01-17', '2003-10-22', '27253 Mesta Alley', 1),
('Coleen', 'Eteen', '1991-10-20', '1985-07-02', '6787 South Point', 2),
('Henri', 'Winwright', '1993-05-08', '2015-11-26', '99468 Dryden Terrace', 3),
('Shermie', 'Papworth', '1992-09-13', '2007-09-03', '270 Dahle Trail', 4),
('Philippa', 'Streetfield', '1965-10-30', '1996-07-02', '7 David Circle', 5),
('Kania', 'Shatford', '1994-06-11', '2018-06-19', '88 Kim Lane', 6),
('Morganne', 'Plummer', '1977-09-24', '1997-08-13', '359 Hoffman Lane', 7),
('Tedi', 'Leupoldt', '1989-03-08', '2020-05-08', '06671 Prairieview Park', 8),
('Edan', 'Reiach', '1983-10-14', '1999-05-26', '93278 Victoria Junction', 9),
('Marilee', 'Wyldbore', '1977-03-30', '1992-12-10', '4818 Victoria Court', 10);


#------------------------------------------------------------
# Table: Chefs_Agences
#------------------------------------------------------------

CREATE TABLE Chefs_Agences(
        ID_Employes      Int NOT NULL, 
        Derniers_Diplome Varchar (200) NOT NULL,
        CONSTRAINT Chefs_Agences_PK PRIMARY KEY (ID_Employes),
        CONSTRAINT Chefs_Agences_Employes_FK 
            FOREIGN KEY (ID_Employes) REFERENCES Employes(ID_Employes)
)ENGINE=InnoDB;

INSERT INTO Chefs_Agences (ID_Employes, Derniers_Diplome) 
VALUES 
(1, 'Master en Management Public - Sciences Po Paris'),
(2, 'MBA Gestion des Collectivités Territoriales - ESSEC'),
(3, 'Diplôme d\'Ingénieur Civil - École des Ponts ParisTech'),
(4, 'Master Droit de l\'Environnement - Université Paris-Sorbonne'),
(5, 'Mastère Spécialisé Transition Écologique - HEC Paris'),
(6, 'Master Génie Urbain et Développement Durable - Université Gustave Eiffel'),
(7, 'Executive Master Politiques Énergétiques - Collège de France'),
(8, 'Diplôme d\'Administrateur Territorial - INET Strasbourg'),
(9, 'Master Économie Circulaire - AgroParisTech'),
(10, 'Certification Directeur de Projets Urbains - CNAM'),
(11, 'Master Gestion des Risques Environnementaux - Université de Lorraine'),
(12, 'Mastère Qualité Sécurité Environnement - CentraleSupélec'),
(13, 'Diplôme d\'État d\'Ingénieur Sanitaire - EHESP Rennes'),
(14, 'Executive MBA Management Public - EM Lyon'),
(15, 'Master en Aménagement du Territoire - Université de Bordeaux'),
(16, 'Certificat Leadership Public - École Normale d\'Administration'),
(17, 'Master Droit et Politiques de l\'Environnement - Université de la Réunion'),
(18, 'Diplôme d\'Expert en Politiques Climatiques - Université de Guyane');

#------------------------------------------------------------
# Table: Agents_Administratif
#------------------------------------------------------------

CREATE TABLE Agents_Administratif(
        ID_Employes Int NOT NULL, 
        CONSTRAINT Agents_Administratif_PK PRIMARY KEY (ID_Employes),
        CONSTRAINT Agents_Admin_Employes_FK 
            FOREIGN KEY (ID_Employes) REFERENCES Employes(ID_Employes)
)ENGINE=InnoDB;

INSERT INTO Agents_Administratif (ID_Employes) 
VALUES 
(19), (20), (21),
(22), (23), (24),
(25), (26), (27),
(28), (29), (30),
(31), (32), (33),
(34), (35), (36),
(37), (38), (39),
(40), (41), (42),
(43), (44), (45),
(46), (47), (48),
(49), (50), (51),
(52), (53), (54),
(55), (56), (57);

#------------------------------------------------------------
# Table: Agents_Technique
#------------------------------------------------------------

CREATE TABLE Agents_Technique(
        ID_Employes Int NOT NULL,  -- Suppression de AUTO_INCREMENT
        CONSTRAINT Agents_Technique_PK PRIMARY KEY (ID_Employes),
        CONSTRAINT Agents_Tech_Employes_FK 
            FOREIGN KEY (ID_Employes) REFERENCES Employes(ID_Employes)
)ENGINE=InnoDB;

INSERT INTO Agents_Technique (ID_Employes) 
VALUES 

(58), (59), (60),
(61), (62), (63),
(64), (65), (66),
(67), (68), (69),
(70), (71), (72),
(73), (74), (75),

(76), (77), (78),
(79), (80), (81),
(82), (83), (84),
(85), (86), (87),
(88), (89), (90),
(91), (92), (93),

(94), (95), (96),
(97), (98), (99);


#------------------------------------------------------------
# Table: Capteurs
#------------------------------------------------------------

CREATE TABLE Capteurs(
        ID_Agences           Int NOT NULL,
        ID_Capteurs          Int NOT NULL auto_increment,
        Etat_Capteurs        Bool NOT NULL,
        Departement_Capteurs Varchar (60) NOT NULL,
        Prefecture_Capteurs  Varchar (60) NOT NULL,
        ID_Employes          Int NOT NULL,  -- Référence aux Agents Technique
        CONSTRAINT Capteurs_PK PRIMARY KEY (ID_Capteurs),
        CONSTRAINT Capteurs_Agences_FK 
            FOREIGN KEY (ID_Agences) REFERENCES Agences(ID_Agences),
        CONSTRAINT Capteurs_Agents_Technique_FK  -- Correction ici
            FOREIGN KEY (ID_Employes) REFERENCES Agents_Technique(ID_Employes)
)ENGINE=InnoDB;

INSERT INTO Capteurs (Etat_Capteurs, Departement_Capteurs, Prefecture_Capteurs, ID_Agences, ID_Employes)
VALUES
(TRUE, 'Ain', 'Bourg-en-Bresse', 1, 58),
(TRUE, 'Aisne', 'Laon', 7, 64),
(TRUE, 'Allier', 'Moulins', 1, 76),
(TRUE, 'Alpes-de-Haute-Provence', 'Digne-les-Bains', 13, 70),
(TRUE, 'Hautes-Alpes', 'Gap', 13, 88),
(TRUE, 'Alpes-Maritimes', 'Nice', 13, 70),
(TRUE, 'Ardèche', 'Privas', 1, 94),
(TRUE, 'Ardennes', 'Charleville-Mézières', 6, 63),
(TRUE, 'Ariège', 'Foix', 11, 68),
(TRUE, 'Aube', 'Troyes', 6, 81),
(TRUE, 'Aude', 'Carcassonne', 11, 86),
(TRUE, 'Aveyron', 'Rodez', 11, 68),
(TRUE, 'Bouches-du-Rhône', 'Marseille', 13, 88),
(TRUE, 'Calvados', 'Caen', 9, 66),
(TRUE, 'Cantal', 'Aurillac', 1, 58),
(TRUE, 'Charente', 'Angoulême', 10, 67),
(TRUE, 'Charente-Maritime', 'La Rochelle', 10, 85),
(TRUE, 'Cher', 'Bourges', 4, 61),
(TRUE, 'Corrèze', 'Tulle', 10, 67),
(TRUE, 'Corse-du-Sud', 'Ajaccio', 5, 62),
(TRUE, 'Haute-Corse', 'Bastia', 5, 80),
(TRUE, "Côte-d'Or", 'Dijon', 2, 59),
(TRUE, "Côtes-d'Armor", 'Saint-Brieuc', 3, 60),
(TRUE, 'Creuse', 'Guéret', 10, 85),
(TRUE, 'Dordogne', 'Périgueux', 10, 67),
(TRUE, 'Doubs', 'Besançon', 2, 77),
(TRUE, 'Drôme', 'Valence', 1, 76),
(TRUE, 'Eure', 'Évreux', 9, 84),
(TRUE, 'Eure-et-Loir', 'Chartres', 4, 79),
(TRUE, 'Finistère', 'Quimper', 3, 78),
(TRUE, 'Gard', 'Nîmes', 11, 86),
(TRUE, 'Haute-Garonne', 'Toulouse', 11, 68),
(TRUE, 'Gers', 'Auch', 11, 86),
(TRUE, 'Gironde', 'Bordeaux', 10, 85),
(TRUE, 'Hérault', 'Montpellier', 11, 68),
(TRUE, 'Ille-et-Vilaine', 'Rennes', 3, 96),
(TRUE, 'Indre', 'Châteauroux', 4, 97),
(TRUE, 'Indre-et-Loire', 'Tours', 4, 61),
(TRUE, 'Isère', 'Grenoble', 1, 94),
(TRUE, 'Jura', 'Lons-le-Saunier', 2, 95),
(TRUE, 'Landes', 'Mont-de-Marsan', 10, 67),
(TRUE, 'Loir-et-Cher', 'Blois', 4, 79),
(TRUE, 'Loire', 'Saint-Étienne', 1, 58),
(TRUE, 'Haute-Loire', 'Le Puy-en-Velay', 1, 76),
(TRUE, 'Loire-Atlantique', 'Nantes', 12, 69),
(TRUE, 'Loiret', 'Orléans', 4, 97),
(TRUE, 'Lot', 'Cahors', 11, 86),
(TRUE, 'Lot-et-Garonne', 'Agen', 10, 85),
(TRUE, 'Lozère', 'Mende', 11, 68),
(TRUE, 'Maine-et-Loire', 'Angers', 12, 87),
(TRUE, 'Manche', 'Saint-Lô', 9, 66),
(TRUE, 'Marne', 'Châlons-en-Champagne', 6, 99),
(TRUE, 'Haute-Marne', 'Chaumont', 6, 63),
(TRUE, 'Mayenne', 'Laval', 12, 69),
(TRUE, 'Meurthe-et-Moselle', 'Nancy', 6, 81),
(TRUE, 'Meuse', 'Bar-le-Duc', 6, 99),
(TRUE, 'Morbihan', 'Vannes', 3, 60),
(TRUE, 'Moselle', 'Metz', 6, 63),
(TRUE, 'Nièvre', 'Nevers', 2, 59),
(TRUE, 'Nord', 'Lille', 7, 82),
(TRUE, 'Oise', 'Beauvais', 7, 64),
(TRUE, 'Orne', 'Alençon', 9, 84),
(TRUE, 'Pas-de-Calais', 'Arras', 7, 82),
(TRUE, 'Puy-de-Dôme', 'Clermont-Ferrand', 1, 94),
(TRUE, 'Pyrénées-Atlantiques', 'Pau', 10, 85),
(TRUE, 'Hautes-Pyrénées', 'Tarbes', 11, 86),
(TRUE, 'Pyrénées-Orientales', 'Perpignan', 11, 68),
(TRUE, 'Bas-Rhin', 'Strasbourg', 6, 81),
(TRUE, 'Haut-Rhin', 'Colmar', 6, 99),
(TRUE, 'Rhône', 'Lyon', 1, 58),
(TRUE, 'Haute-Saône', 'Vesoul', 2, 77),
(TRUE, 'Saône-et-Loire', 'Mâcon', 2, 95),
(TRUE, 'Sarthe', 'Le Mans', 12, 87),
(TRUE, 'Savoie', 'Chambéry', 1, 76),
(TRUE, 'Haute-Savoie', 'Annecy', 1, 94),
(TRUE, 'Paris', 'Paris', 8, 83),
(TRUE, 'Seine-Maritime', 'Rouen', 9, 66),
(TRUE, 'Seine-et-Marne', 'Melun', 8, 65),
(TRUE, 'Yvelines', 'Versailles', 8, 83),
(TRUE, 'Deux-Sèvres', 'Niort', 10, 67),
(TRUE, 'Somme', 'Amiens', 7, 64),
(TRUE, 'Tarn', 'Albi', 11, 68),
(TRUE, 'Tarn-et-Garonne', 'Montauban', 11, 86),
(TRUE, 'Var', 'Toulon', 13, 70),
(TRUE, 'Vaucluse', 'Avignon', 13, 88),
(TRUE, 'Vendée', 'La Roche-sur-Yon', 12, 69),
(TRUE, 'Vienne', 'Poitiers', 10, 85),
(TRUE, 'Haute-Vienne', 'Limoges', 10, 67),
(TRUE, 'Vosges', 'Épinal', 6, 63),
(TRUE, 'Yonne', 'Auxerre', 2, 59),
(TRUE, 'Territoire de Belfort', 'Belfort', 2, 77),
(TRUE, 'Essonne', 'Évry-Courcouronnes', 8, 65),
(TRUE, 'Hauts-de-Seine', 'Nanterre', 8, 83),
(TRUE, 'Seine-Saint-Denis', 'Bobigny', 8, 65),
(TRUE, 'Val-de-Marne', 'Créteil', 8, 83),
(TRUE, "Val-d'Oise", 'Cergy', 8, 65),
(TRUE, 'Guadeloupe', 'Basse-Terre', 14, 89),
(TRUE, 'Martinique', 'Fort-de-France', 15, 72),
(TRUE, 'Guyane', 'Cayenne', 16, 73),
(TRUE, 'La Réunion', 'Saint-Denis', 17, 74),
(TRUE, 'Mayotte', 'Mamoudzou', 18, 75);



#------------------------------------------------------------
# Table: Rapports
#------------------------------------------------------------

CREATE TABLE Rapports(
        ID_Rapports      Int NOT NULL AUTO_INCREMENT,
        Titre_Rapports   Varchar (100) NOT NULL,
        Ref_Rapports     Varchar (40) NOT NULL,
        Date_Rapports    Date NOT NULL,
        Analyse_Rapports Varchar (600) NOT NULL,
        ID_Agences       Int NOT NULL,
        CONSTRAINT Rapports_PK PRIMARY KEY (ID_Rapports),
        CONSTRAINT Rapports_Agences_FK 
            FOREIGN KEY (ID_Agences) REFERENCES Agences(ID_Agences)
)ENGINE=InnoDB;

INSERT INTO Rapports (Titre_Rapports, Ref_Rapports, Date_Rapports, Analyse_Rapports, ID_Agences)
VALUES
("La concentration d'ozone troposphérique en Occitanie en 2022", 'TOU020423', '2018-04-05', "La concentration en ozone troposphérique est stable pour les capteurs du sud de la région Occitanie, elle a augmenté sur les mois de juin-juillet-août pour les zones de Montpellier et Nîmes.", 11),
("Niveaux de dioxyde d’azote (NO₂) en Île-de-France en 2021", 'IDF110921', '2021-12-09', "Les niveaux de NO₂ ont baissé légèrement par rapport à 2020, notamment autour du périphérique parisien.", 8),
("Évolution des PM10 en Auvergne-Rhône-Alpes en 2020", 'LYO301120', '2020-11-30', "Les particules fines PM10 ont connu un pic hivernal en janvier-février à Grenoble.", 1),
("Concentration en ozone dans les Hauts-de-France en été 2022", 'LIL070722', '2022-07-07', "Des dépassements de seuils ont été enregistrés autour de Lille pendant la canicule.", 7),
("Surveillance du benzène en Nouvelle-Aquitaine (2023)", 'BX230223', '2023-02-23', "Les concentrations en benzène restent inférieures aux seuils réglementaires sur l’ensemble des stations.", 10),
("Analyse du monoxyde de carbone en Bretagne (2021)", 'REN151121', '2021-11-15', "Le CO reste globalement faible sauf pics liés au chauffage résidentiel à Quimper.", 3),
("Concentration de particules PM2.5 en Bourgogne-Franche-Comté", 'DIJ090620', '2020-06-09', "Les niveaux sont restés dans la norme annuelle malgré quelques dépassements localisés.", 2),
("Ozone estival dans la région Provence-Alpes-Côte d'Azur", 'MRS010822', '2022-08-01', "Les concentrations ont atteint des valeurs préoccupantes à Marseille et Avignon.", 13),
("État du dioxyde de soufre en Grand Est", 'STR191219', '2019-12-19', "Très faible concentration générale de SO₂ sauf près des zones industrielles de Mulhouse.", 6),
("Qualité de l’air en Normandie – bilan 2022", 'CAEN050123', '2023-01-05', "L’air est globalement bon mais une vigilance est maintenue sur le NO₂ à Rouen.", 9),
("Rapport sur les hydrocarbures aromatiques à Mayotte", 'MAM101023', '2023-10-10', "Présence ponctuelle d’hydrocarbures liée aux activités portuaires.", 18),
("Teneur en ozone troposphérique en Corse (été 2022)", 'AJA170822', '2022-08-17', "Les stations d’Ajaccio et Bastia ont enregistré des valeurs élevées en juillet.", 5),
("Pollution aux particules PM10 à La Réunion", 'REU280322', '2022-03-28', "Les poussières sahariennes ont provoqué un pic de PM10 à Saint-Denis.", 17),
("Évaluation du dioxyde d’azote dans le Centre-Val de Loire", 'ORL300921', '2021-09-30', "Stabilité des niveaux de NO₂, avec un point de vigilance autour de Tours.", 4),
("Surveillance de l’ozone en Pays de la Loire", 'NAN140622', '2022-06-14', "Les valeurs estivales ont atteint des seuils d'information dans le sud du département.", 12),
("Concentration en benzène à Fort-de-France", 'MART031222', '2022-12-03', "Des concentrations modérées mesurées à proximité des axes routiers.", 15),
("Rapport sur le formaldéhyde en Occitanie", 'TOU270321', '2021-03-27', "Le taux de formaldéhyde est en baisse grâce à l’amélioration des performances énergétiques des bâtiments.", 11),
("Analyse des PM2.5 dans les Alpes", 'GAP081221', '2021-12-08', "Des niveaux modérés ont été enregistrés en vallée, avec influence du chauffage au bois.", 13),
("Pollution estivale à l’ozone dans le Sud-Ouest", 'PAU230722', '2022-07-23', "Des concentrations élevées ont été observées dans le Béarn pendant les pics de chaleur.", 10),
("Évolution du NO₂ dans les zones rurales de Normandie", 'ALN020321', '2021-03-02', "Les niveaux sont faibles mais montrent une légère augmentation due à l'usage accru de véhicules diesel.", 9);


#------------------------------------------------------------
# Table: Mesure
#------------------------------------------------------------

CREATE TABLE Mesure(
        ID_Mesure         Int NOT NULL auto_increment ,
        Date_Mesure       Date NOT NULL ,
        Concentration_ppm Float NOT NULL ,
        ID_Capteurs       Int NOT NULL
	,CONSTRAINT Mesure_PK PRIMARY KEY (ID_Mesure)

	,CONSTRAINT Mesure_Capteurs_FK FOREIGN KEY (ID_Capteurs) REFERENCES Capteurs(ID_Capteurs)
)ENGINE=InnoDB;

INSERT INTO Mesure (Date_Mesure, Concentration_ppm, ID_Capteurs)
VALUES
-- Mesures réalistes pour différents gaz (CO2, NO2, O3, etc.)
('2020-01-15', 412.5, 31),
('2020-02-03', 28.7, 42),
('2020-03-22', 0.045, 58),
('2020-04-10', 104.2, 61),
('2020-05-18', 12.8, 74),
('2020-06-05', 0.12, 39),
('2020-07-30', 420.0, 56),
('2020-08-14', 32.1, 50),
('2020-09-09', 0.038, 16),
('2020-10-25', 110.5, 81),
('2020-11-11', 15.3, 33),
('2020-12-07', 0.09, 47),
('2021-01-20', 415.8, 62),
('2021-02-17', 25.4, 41),
('2021-03-08', 0.042, 59),
('2021-04-01', 108.7, 29),
('2021-05-19', 14.6, 73),
('2021-06-23', 0.11, 18),
('2021-07-04', 418.3, 65),
('2021-08-28', 30.9, 49),
('2021-09-15', 0.036, 22),
('2021-10-10', 112.0, 83),
('2021-11-29', 16.2, 57),
('2021-12-14', 0.085, 11),
('2022-01-05', 419.7, 69),
('2022-02-22', 27.5, 24),
('2022-03-18', 0.04, 38),
('2022-04-11', 105.8, 53),
('2022-05-30', 13.9, 71),
('2022-06-12', 0.095, 64),
('2022-07-07', 421.2, 9),
('2022-08-19', 29.3, 78),
('2022-09-25', 0.035, 40),
('2022-10-08', 107.4, 36),
('2022-11-21', 17.0, 27),
('2022-12-03', 0.08, 48),
('2023-01-17', 423.5, 55),
('2023-02-14', 26.8, 68),
('2023-03-09', 0.037, 30),
('2023-04-27', 109.1, 80),
('2023-05-15', 12.5, 60),
('2023-06-28', 0.105, 51),
('2023-07-11', 417.6, 67),
('2023-08-23', 31.7, 66),
('2023-09-19', 0.033, 19),
('2023-10-31', 111.9, 25),
('2023-11-20', 18.4, 75),
('2023-12-25', 0.075, 43),
('2024-01-09', 425.0, 82),
('2024-02-16', 24.6, 13),
('2024-03-14', 0.041, 37),
('2024-04-05', 106.3, 44),
('2024-05-22', 11.8, 23),
('2024-06-17', 0.115, 21),
('2024-07-29', 419.1, 63),
('2024-08-13', 33.2, 70),
('2024-09-07', 0.032, 58),
('2024-10-19', 113.5, 72),
('2024-11-24', 19.1, 28),
('2024-12-31', 0.07, 10),
('2020-01-08', 410.2, 34),
('2020-01-22', 29.5, 77),
('2020-02-10', 0.047, 32),
('2020-02-28', 103.8, 69),
('2020-03-15', 13.2, 24),
('2020-04-05', 0.125, 17),
('2020-04-20', 418.7, 65),
('2020-05-12', 31.4, 62),
('2020-06-01', 0.039, 46),
('2020-06-18', 109.6, 58),
('2020-07-07', 16.0, 39),
('2020-08-02', 0.088, 23),
('2020-08-20', 421.5, 85),
('2020-09-11', 28.3, 50),
('2020-10-05', 0.034, 29),
('2020-10-22', 111.2, 77),
('2020-11-15', 14.9, 12),
('2020-12-10', 0.082, 51),
('2021-01-12', 414.3, 18),
('2021-02-05', 26.7, 9),
('2021-03-01', 0.043, 40),
('2021-03-19', 107.9, 72),
('2021-04-08', 15.7, 20),
('2021-05-03', 0.108, 34),
('2021-05-25', 416.8, 57),
('2021-06-14', 30.2, 41),
('2021-07-09', 0.037, 73),
('2021-08-01', 110.8, 66),
('2021-08-25', 17.5, 26),
('2021-09-20', 0.087, 22),
('2021-10-15', 422.0, 69),
('2021-11-08', 27.9, 45),
('2021-12-01', 0.031, 35),
('2022-01-10', 417.4, 38),
('2022-02-07', 25.1, 12),
('2022-03-03', 0.044, 54),
('2022-03-25', 104.7, 13),
('2022-04-15', 13.6, 81),
('2022-05-08', 0.098, 62),
('2022-06-02', 419.9, 55),
('2022-06-28', 32.6, 9),
('2022-07-19', 0.035, 49),
('2022-08-12', 108.3, 30),
('2022-09-05', 18.1, 71),
('2022-10-01', 0.079, 56),
('2023-01-25', 424.1, 43),
('2023-02-18', 23.9, 50),
('2023-03-12', 0.046, 61),
('2023-04-03', 105.0, 39),
('2023-04-28', 12.3, 18),
('2023-05-19', 0.112, 65),
('2023-06-11', 418.5, 32),
('2023-07-05', 34.0, 78),
('2023-08-01', 0.029, 21),
('2023-08-27', 112.7, 40),
('2023-09-22', 19.8, 25),
('2023-10-18', 0.068, 29),
('2024-01-14', 426.3, 50),
('2024-02-09', 22.5, 34),
('2024-03-07', 0.048, 57),
('2024-03-29', 104.1, 44),
('2024-04-20', 11.0, 52),
('2024-05-15', 0.121, 69),
('2024-06-09', 420.7, 16),
('2024-07-03', 35.1, 59),
('2024-07-28', 0.026, 28),
('2024-08-24', 114.2, 35),
('2024-09-18', 20.5, 77),
('2024-10-15', 0.063, 8),
('2024-11-10', 427.8, 19),
('2024-12-05', 21.7, 74),
('2024-12-28', 0.051, 56),
('2023-05-10', 1.85, 83),
('2023-05-25', 1.92, 83),
('2023-06-05', 1.78, 83),
('2023-06-15', 1.95, 83),
('2023-05-12', 1.12, 96),
('2023-05-22', 1.08, 96),
('2023-06-03', 1.15, 96),
('2023-06-18', 1.05, 96),
('2023-05-08', 1.45, 68),
('2023-05-20', 1.52, 68),
('2023-06-10', 1.38, 68),
('2023-06-25', 1.42, 68),
('2023-05-15', 1.28, 68),
('2023-05-30', 1.35, 68),
('2023-06-12', 1.22, 68),
('2023-06-28', 1.30, 68);

#------------------------------------------------------------
# Table: Gaz
#------------------------------------------------------------

CREATE TABLE Gaz(
        ID_Gaz      Int NOT NULL auto_increment,
        Nom_Gaz     Varchar (80) NOT NULL ,
        Formule_Gaz Varchar (30) NOT NULL ,
        Type_Gaz    Varchar (4) NOT NULL
	,CONSTRAINT Gaz_PK PRIMARY KEY (ID_Gaz)
)ENGINE=InnoDB;

INSERT INTO Gaz (Nom_Gaz, Formule_Gaz, Type_Gaz)
VALUES
-- Gaz à Effet de Serre (GES)
('Dioxyde de carbone', 'CO₂', 'GES'),
('Méthane', 'CH₄', 'GES'),
('Protoxyde d''azote', 'N₂O', 'GES'),
('Hexafluorure de soufre', 'SF₆', 'GES'),
('Hydrofluorocarbures', 'HFCs', 'GES'),
('Perfluorocarbures', 'PFCs', 'GES'),
('Trifluorure d''azote', 'NF₃', 'GES'),

-- Gaz à Effet de Serre Indirect (GESI) et polluants atmosphériques
('Ozone', 'O₃', 'GESI'),
('Dioxyde d''azote', 'NO₂', 'GESI'),
('Monoxyde d''azote', 'NO', 'GESI'),
('Dioxyde de soufre', 'SO₂', 'GESI'),
('Monoxyde de carbone', 'CO', 'GESI'),
('Particules fines (PM2.5)', 'PM2.5', 'GESI'),
('Particules fines (PM10)', 'PM10', 'GESI'),
('Ammoniac', 'NH₃', 'GESI'),
('Composés organiques volatils', 'COV', 'GESI'),
('Black Carbon', 'BC', 'GESI'),
('Sulfate', 'SO₄²⁻', 'GESI'),
('Nitrate', 'NO₃⁻', 'GESI');

#------------------------------------------------------------
# Table: Rédaction
#------------------------------------------------------------

CREATE TABLE Redaction(
        ID_Rapports Int NOT NULL,
        ID_Employes Int NOT NULL,
        CONSTRAINT Redaction_PK PRIMARY KEY (ID_Rapports, ID_Employes)
)ENGINE=InnoDB;

INSERT INTO Redaction (ID_Rapports, ID_Employes)
VALUES
(58, 1), (59, 2), (60, 3), (61, 4),
(62, 5), (63, 6), (64, 7), (65, 8),
(66,9), (67, 10), (68, 11), (69, 12),
(70,13), (71, 14), (72, 15), (73, 16),
(74, 17), (75, 18), (76, 11), (77, 13);

#------------------------------------------------------------
# Table: Contient
#------------------------------------------------------------

CREATE TABLE Contient(
        ID_Rapports Int NOT NULL ,
        ID_Mesure   Int NOT NULL
	,CONSTRAINT Contient_PK PRIMARY KEY (ID_Rapports,ID_Mesure)

	,CONSTRAINT Contient_Rapports_FK FOREIGN KEY (ID_Rapports) REFERENCES Rapports(ID_Rapports)
	,CONSTRAINT Contient_Mesure0_FK FOREIGN KEY (ID_Mesure) REFERENCES Mesure(ID_Mesure)
)ENGINE=InnoDB;

INSERT INTO Contient (ID_Rapports, ID_Mesure)
VALUES
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
(12, 12), 
(13, 13), 
(14, 14), 
(15, 15), 
(16, 16), 
(17, 17), 
(18, 18), 
(19, 19), 
(20, 20);

#------------------------------------------------------------
# Table: Détecter
#------------------------------------------------------------

CREATE TABLE Detecter(
        ID_Capteurs Int NOT NULL,
        ID_Gaz      Int NOT NULL,
        CONSTRAINT Detecter_PK PRIMARY KEY (ID_Capteurs, ID_Gaz)
)ENGINE=InnoDB;

INSERT INTO Detecter (ID_Capteurs, ID_Gaz)
VALUES
-- Capteurs CO2
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
-- Capteurs NO2  
(6, 9), (7, 9), (8, 9), (9, 9), (10, 9),
-- Capteurs O3
(11, 8), (12, 8), (13, 8), (14, 8), (15, 8),
-- Capteurs PM2.5
(16, 12), (17, 12), (18, 12), (19, 12), (20, 12),
-- Capteurs SO2
(21, 11), (22, 11), (23, 11), (24, 11), (25, 11),
-- Capteurs CO
(26, 10), (27, 10), (28, 10), (29, 10), (30, 10),
-- Autres capteurs (répartition aléatoire)
(75, 2), (32, 3), (33, 4), (34, 5), (35, 6),
(36, 7), (37, 13), (38, 14), (39, 15), (40, 16),
(41, 17), (42, 18), (43, 19), (44, 20), (45, 1),
(46, 9), (47, 8), (48, 12), (49, 11), (50, 10),
(51, 2), (52, 3), (53, 4), (54, 5), (55, 6),
(56, 7), (57, 13), (58, 14), (59, 15), (60, 16),
(61, 17), (62, 18), (63, 19), (64, 20), (65, 1),
(66, 9), (67, 8), (68, 12), (69, 11), (70, 10),
(71, 2), (72, 3), (73, 4), (74, 5), (31, 6),
(76, 7), (77, 13), (78, 14), (79, 15), (80, 16),
(81, 17), (82, 18), (83, 19), (84, 20), (85, 1),
(86, 9), (87, 8), (88, 12), (89, 11), (90, 10),
(91, 2), (92, 3), (93, 4), (94, 5), (95, 6),
(96, 7), (97, 13), (98, 14), (99, 15), (100, 16),

(83, 2),  -- Paris
(96, 2),  -- Rennes
(68, 2);  -- Toulouse/Montpellier


