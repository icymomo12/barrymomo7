#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Rayons
#------------------------------------------------------------

CREATE TABLE Rayons(
        CodeRayon       Varchar (50) NOT NULL ,
        IntitituleRayon Varchar (50) NOT NULL
	,CONSTRAINT Rayons_PK PRIMARY KEY (CodeRayon)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Auteurs
#------------------------------------------------------------

CREATE TABLE Auteurs(
        CodeAuteur   Varchar (50) NOT NULL ,
        NomAuteur    Varchar (50) NOT NULL ,
        PrenomAuteur Varchar (50) NOT NULL
	,CONSTRAINT Auteurs_PK PRIMARY KEY (CodeAuteur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MotsCles
#------------------------------------------------------------

CREATE TABLE MotsCles(
        CodeMot Varchar (50) NOT NULL ,
        Mots    Varchar (50) NOT NULL
	,CONSTRAINT MotsCles_PK PRIMARY KEY (CodeMot)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Adherents
#------------------------------------------------------------

CREATE TABLE Adherents(
        CodeAdherent    Varchar (50) NOT NULL ,
        NomAdherent     Varchar (50) NOT NULL ,
        PrenomAdherent  Varchar (50) NOT NULL ,
        AdresseAdherent Varchar (50) NOT NULL
	,CONSTRAINT Adherents_PK PRIMARY KEY (CodeAdherent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ouvrages
#------------------------------------------------------------

CREATE TABLE Ouvrages(
        CodeOuvrage  Varchar (50) NOT NULL ,
        Titre        Varchar (50) NOT NULL ,
        CodeRayon    Varchar (50) NOT NULL ,
        CodeAdherent Varchar (50) NOT NULL
	,CONSTRAINT Ouvrages_PK PRIMARY KEY (CodeOuvrage)

	,CONSTRAINT Ouvrages_Rayons_FK FOREIGN KEY (CodeRayon) REFERENCES Rayons(CodeRayon)
	,CONSTRAINT Ouvrages_Adherents0_FK FOREIGN KEY (CodeAdherent) REFERENCES Adherents(CodeAdherent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: auteur_de
#------------------------------------------------------------

CREATE TABLE auteur_de(
        CodeOuvrage Varchar (50) NOT NULL ,
        CodeAuteur  Varchar (50) NOT NULL
	,CONSTRAINT auteur_de_PK PRIMARY KEY (CodeOuvrage,CodeAuteur)

	,CONSTRAINT auteur_de_Ouvrages_FK FOREIGN KEY (CodeOuvrage) REFERENCES Ouvrages(CodeOuvrage)
	,CONSTRAINT auteur_de_Auteurs0_FK FOREIGN KEY (CodeAuteur) REFERENCES Auteurs(CodeAuteur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: indexe
#------------------------------------------------------------

CREATE TABLE indexe(
        CodeOuvrage Varchar (50) NOT NULL ,
        CodeMot     Varchar (50) NOT NULL
	,CONSTRAINT indexe_PK PRIMARY KEY (CodeOuvrage,CodeMot)

	,CONSTRAINT indexe_Ouvrages_FK FOREIGN KEY (CodeOuvrage) REFERENCES Ouvrages(CodeOuvrage)
	,CONSTRAINT indexe_MotsCles0_FK FOREIGN KEY (CodeMot) REFERENCES MotsCles(CodeMot)
)ENGINE=InnoDB;

