-- Ajout des contraintes 

-- Table Clients
ALTER TABLE Clients
ADD CONSTRAINT FK_Clients_Foyers FOREIGN KEY (FoyerID) REFERENCES Foyers(FoyerID),
ADD CONSTRAINT FK_Clients_Adresses FOREIGN KEY (AdresseID) REFERENCES Adresses(AdresseID);

-- Table Comptes de Services
ALTER TABLE ComptesDeServices
ADD CONSTRAINT FK_ComptesDeServices_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
ADD CONSTRAINT FK_ComptesDeServices_Offres FOREIGN KEY (OffreID) REFERENCES Offres(OffreID),
ADD CONSTRAINT FK_ComptesDeServices_SIM FOREIGN KEY (SIMID) REFERENCES SIM(SIMID);

-- Table Adresses
ALTER TABLE Adresses
ADD CONSTRAINT FK_Adresses_ZonesDeCouverture FOREIGN KEY (ZoneID) REFERENCES ZonesDeCouverture(ZoneID);

-- Table SIM
ALTER TABLE SIM
ADD CONSTRAINT FK_SIM_ComptesDeServices FOREIGN KEY (CompteID) REFERENCES ComptesDeServices(CompteID);

-- Table Foyers
ALTER TABLE Foyers
ADD CONSTRAINT FK_Foyers_Clients FOREIGN KEY (ContactPrincipal) REFERENCES Clients(ClientID),
ADD CONSTRAINT FK_Foyers_Adresses FOREIGN KEY (AdresseID) REFERENCES Adresses(AdresseID);

-- Table Interventions de Maintenance
ALTER TABLE InterventionsDeMaintenance
ADD CONSTRAINT FK_InterventionsDeMaintenance_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
ADD CONSTRAINT FK_InterventionsDeMaintenance_ZonesDeCouverture FOREIGN KEY (ZoneID) REFERENCES ZonesDeCouverture(ZoneID);
