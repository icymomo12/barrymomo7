#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Marques
#------------------------------------------------------------

CREATE TABLE Marques(
        Code_Marque Varchar (50) NOT NULL ,
        Nom         Varchar (50) NOT NULL
	,CONSTRAINT Marques_PK PRIMARY KEY (Code_Marque)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Categorie
#------------------------------------------------------------

CREATE TABLE Categorie(
        Code_Categorie Varchar (50) NOT NULL ,
        Intitule_Cat   Varchar (50) NOT NULL
	,CONSTRAINT Categorie_PK PRIMARY KEY (Code_Categorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type_Piece
#------------------------------------------------------------

CREATE TABLE Type_Piece(
        Code_TM        Varchar (50) NOT NULL ,
        Code_Categorie Varchar (50) NOT NULL
	,CONSTRAINT Type_Piece_PK PRIMARY KEY (Code_TM)

	,CONSTRAINT Type_Piece_Categorie_FK FOREIGN KEY (Code_Categorie) REFERENCES Categorie(Code_Categorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pieces
#------------------------------------------------------------

CREATE TABLE Pieces(
        Code_Piece Varchar (50) NOT NULL ,
        Etat       Varchar (50) NOT NULL ,
        Date_Recap Date NOT NULL ,
        Code_TM    Varchar (50) NOT NULL
	,CONSTRAINT Pieces_PK PRIMARY KEY (Code_Piece)

	,CONSTRAINT Pieces_Type_Piece_FK FOREIGN KEY (Code_TM) REFERENCES Type_Piece(Code_TM)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Modeles
#------------------------------------------------------------

CREATE TABLE Modeles(
        Code_Modele  Varchar (50) NOT NULL ,
        Nom_Mod      Varchar (50) NOT NULL ,
        Annee_Modele Date NOT NULL ,
        Code_Marque  Varchar (50) NOT NULL
	,CONSTRAINT Modeles_PK PRIMARY KEY (Code_Modele)

	,CONSTRAINT Modeles_Marques_FK FOREIGN KEY (Code_Marque) REFERENCES Marques(Code_Marque)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: convient_a
#------------------------------------------------------------

CREATE TABLE convient_a(
        Code_Modele Varchar (50) NOT NULL ,
        Code_TM     Varchar (50) NOT NULL
	,CONSTRAINT convient_a_PK PRIMARY KEY (Code_Modele,Code_TM)

	,CONSTRAINT convient_a_Modeles_FK FOREIGN KEY (Code_Modele) REFERENCES Modeles(Code_Modele)
	,CONSTRAINT convient_a_Type_Piece0_FK FOREIGN KEY (Code_TM) REFERENCES Type_Piece(Code_TM)
)ENGINE=InnoDB;

