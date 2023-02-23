#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Ville(
        CodeVille  Varchar (50) NOT NULL ,
        CodePostal Varchar (50) NOT NULL ,
        NomVille   Varchar (50) NOT NULL
	,CONSTRAINT Ville_PK PRIMARY KEY (CodeVille)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------

CREATE TABLE CLIENT(
        NumClient     Varchar (50) NOT NULL ,
        Nomclient     Varchar (50) NOT NULL ,
        Titre         Varchar (50) NOT NULL ,
        Adresseclient Varchar (50) NOT NULL ,
        CodeVille     Varchar (50) NOT NULL
	,CONSTRAINT CLIENT_PK PRIMARY KEY (NumClient)

	,CONSTRAINT CLIENT_Ville_FK FOREIGN KEY (CodeVille) REFERENCES Ville(CodeVille)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Immeuble
#------------------------------------------------------------

CREATE TABLE Immeuble(
        NumImm    Varchar (50) NOT NULL ,
        TypeImm   Varchar (50) NOT NULL ,
        Taxe      Varchar (50) NOT NULL ,
        CodeVille Varchar (50) NOT NULL
	,CONSTRAINT Immeuble_PK PRIMARY KEY (NumImm)

	,CONSTRAINT Immeuble_Ville_FK FOREIGN KEY (CodeVille) REFERENCES Ville(CodeVille)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartement
#------------------------------------------------------------

CREATE TABLE Appartement(
        NumAppart  Varchar (50) NOT NULL ,
        TypeAppart Varchar (50) NOT NULL ,
        Etage      Int NOT NULL ,
        Porte      Int NOT NULL ,
        Superficie Int NOT NULL ,
        NumImm     Varchar (50) NOT NULL
	,CONSTRAINT Appartement_PK PRIMARY KEY (NumAppart)

	,CONSTRAINT Appartement_Immeuble_FK FOREIGN KEY (NumImm) REFERENCES Immeuble(NumImm)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Louer
#------------------------------------------------------------

CREATE TABLE Louer(
        NumAppart       Varchar (50) NOT NULL ,
        NumClient       Varchar (50) NOT NULL ,
        DateSignature   Varchar (50) NOT NULL ,
        DateResiliation Varchar (50) NOT NULL
	,CONSTRAINT Louer_PK PRIMARY KEY (NumAppart,NumClient)

	,CONSTRAINT Louer_Appartement_FK FOREIGN KEY (NumAppart) REFERENCES Appartement(NumAppart)
	,CONSTRAINT Louer_CLIENT0_FK FOREIGN KEY (NumClient) REFERENCES CLIENT(NumClient)
)ENGINE=InnoDB;

