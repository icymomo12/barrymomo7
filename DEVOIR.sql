#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Pays
#------------------------------------------------------------

CREATE TABLE Pays(
        Id_Pays         Varchar (50) NOT NULL ,
        Nom             Varchar (50) NOT NULL ,
        Nombre_Habitans Int NOT NULL ,
        Superficie      Int NOT NULL
	,CONSTRAINT Pays_PK PRIMARY KEY (Id_Pays)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Marques
#------------------------------------------------------------

CREATE TABLE Marques(
        Id_marque Varchar (50) NOT NULL ,
        Nom       Varchar (50) NOT NULL
	,CONSTRAINT Marques_PK PRIMARY KEY (Id_marque)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Agence
#------------------------------------------------------------

CREATE TABLE Agence(
        Id_Agence   Varchar (50) NOT NULL ,
        Nom         Varchar (50) NOT NULL ,
        Nb_empolyes Varchar (50) NOT NULL ,
        Id_Pays     Varchar (50) NOT NULL
	,CONSTRAINT Agence_PK PRIMARY KEY (Id_Agence)

	,CONSTRAINT Agence_Pays_FK FOREIGN KEY (Id_Pays) REFERENCES Pays(Id_Pays)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Modele
#------------------------------------------------------------

CREATE TABLE Modele(
        Id_Modele    Varchar (50) NOT NULL ,
        Denomination Varchar (50) NOT NULL ,
        Puissance    Varchar (50) NOT NULL
	,CONSTRAINT Modele_PK PRIMARY KEY (Id_Modele)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        Id_client   Varchar (50) NOT NULL ,
        Nom         Varchar (50) NOT NULL ,
        Adresse     Varchar (50) NOT NULL ,
        Code_postal Varchar (50) NOT NULL ,
        Ville       Varchar (50) NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (Id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type
#------------------------------------------------------------

CREATE TABLE Type(
        Id_type Varchar (50) NOT NULL ,
        Libelle Varchar (50) NOT NULL
	,CONSTRAINT Type_PK PRIMARY KEY (Id_type)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Categorie
#------------------------------------------------------------

CREATE TABLE Categorie(
        Id_categorie Varchar (50) NOT NULL ,
        Libelle      Varchar (50) NOT NULL
	,CONSTRAINT Categorie_PK PRIMARY KEY (Id_categorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vehicule
#------------------------------------------------------------

CREATE TABLE Vehicule(
        Id_vehicule     Varchar (50) NOT NULL ,
        Immatriculation Varchar (50) NOT NULL ,
        Age             Int NOT NULL ,
        Etat            Varchar (50) NOT NULL ,
        Id_marque       Varchar (50) NOT NULL ,
        Id_Agence       Varchar (50) NOT NULL ,
        Id_type         Varchar (50) NOT NULL ,
        Id_categorie    Varchar (50) NOT NULL ,
        Id_Modele       Varchar (50) NOT NULL
	,CONSTRAINT Vehicule_PK PRIMARY KEY (Id_vehicule)

	,CONSTRAINT Vehicule_Marques_FK FOREIGN KEY (Id_marque) REFERENCES Marques(Id_marque)
	,CONSTRAINT Vehicule_Agence0_FK FOREIGN KEY (Id_Agence) REFERENCES Agence(Id_Agence)
	,CONSTRAINT Vehicule_Type1_FK FOREIGN KEY (Id_type) REFERENCES Type(Id_type)
	,CONSTRAINT Vehicule_Categorie2_FK FOREIGN KEY (Id_categorie) REFERENCES Categorie(Id_categorie)
	,CONSTRAINT Vehicule_Modele3_FK FOREIGN KEY (Id_Modele) REFERENCES Modele(Id_Modele)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: A_loue
#------------------------------------------------------------

CREATE TABLE A_loue(
        Id_client    Varchar (50) NOT NULL ,
        Id_vehicule  Varchar (50) NOT NULL ,
        Date_retrait Varchar (50) NOT NULL ,
        Date_retour  Varchar (50) NOT NULL
	,CONSTRAINT A_loue_PK PRIMARY KEY (Id_client,Id_vehicule)

	,CONSTRAINT A_loue_Client_FK FOREIGN KEY (Id_client) REFERENCES Client(Id_client)
	,CONSTRAINT A_loue_Vehicule0_FK FOREIGN KEY (Id_vehicule) REFERENCES Vehicule(Id_vehicule)
)ENGINE=InnoDB;

