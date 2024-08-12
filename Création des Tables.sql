-- Création des Tables 

-- Table Clients
CREATE TABLE Clients (
    ClientID CHAR(36) PRIMARY KEY,
    Prenom VARCHAR(50),
    Nom VARCHAR(50),
    Email VARCHAR(100),
    NumeroDeTelephone VARCHAR(15),
    DateDeNaissance DATE,
    FoyerID CHAR(36),
    AdresseID CHAR(36)
);

-- Table Comptes de Services
CREATE TABLE ComptesDeServices (
    CompteID CHAR(36) PRIMARY KEY,
    ClientID CHAR(36),
    TypeDeService VARCHAR(50),
    DateDeDebut DATE,
    DateDeFin DATE,
    OffreID CHAR(36),
    SIMID CHAR(36)
);

-- Table Adresses
CREATE TABLE Adresses (
    AdresseID CHAR(36) PRIMARY KEY,
    Rue VARCHAR(100),
    Ville VARCHAR(50),
    EtatRegion VARCHAR(50),
    CodePostal VARCHAR(10),
    Pays VARCHAR(50),
    ZoneID CHAR(36)
);

-- Table SIM
CREATE TABLE SIM (
    SIMID CHAR(36) PRIMARY KEY,
    NumeroSIM VARCHAR(20),
    DateDActivation DATE,
    DateDDesactivation DATE,
    CompteID CHAR(36)
);

-- Table Foyers
CREATE TABLE Foyers (
    FoyerID CHAR(36) PRIMARY KEY,
    NomDuFoyer VARCHAR(50),
    ContactPrincipal CHAR(36),
    AdresseID CHAR(36)
);

-- Table Interventions de Maintenance
CREATE TABLE InterventionsDeMaintenance (
    InterventionID CHAR(36) PRIMARY KEY,
    ClientID CHAR(36),
    DateDeLIntervention DATE,
    NomDuTechnicien VARCHAR(50),
    DescriptionIntervention TEXT,
    ZoneID CHAR(36)
);

-- Table Zones de Couverture
CREATE TABLE ZonesDeCouverture (
    ZoneID CHAR(36) PRIMARY KEY,
    NomDeLaZone VARCHAR(50),
    DescriptionZone TEXT,
    Ville VARCHAR(50),
    EtatRegion VARCHAR(50),
    CodePostal VARCHAR(10),
    Pays VARCHAR(50)
);

-- Table Offres
CREATE TABLE Offres (
    OffreID CHAR(36) PRIMARY KEY,
    NomDeLOffre VARCHAR(50),
    DescriptionOffre TEXT,
    Prix DECIMAL(10, 2),
    TypeDeService VARCHAR(50)
);
