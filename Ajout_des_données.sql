-- Zone de couverture 
INSERT INTO ZonesDeCouverture (ZoneID, NomDeLaZone, DescriptionZone, Ville, EtatRegion, CodePostal, Pays) VALUES
(UUID(), 'Zone 1', 'Description de la zone 1', 'Paris', 'Ile-de-France', '75000', 'France'),
(UUID(), 'Zone 2', 'Description de la zone 2', 'Lyon', 'Auvergne-Rhône-Alpes', '69000', 'France');


-- Adresses 
INSERT INTO Adresses (AdresseID, Rue, Ville, EtatRegion, CodePostal, Pays, ZoneID) VALUES
(UUID(), '123 Rue de la Paix', 'Paris', 'Ile-de-France', '75000', 'France', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), '456 Avenue des Champs', 'Paris', 'Ile-de-France', '75001', 'France', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), '789 Boulevard Saint-Germain', 'Paris', 'Ile-de-France', '75006', 'France', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), '1011 Rue de la République', 'Lyon', 'Auvergne-Rhône-Alpes', '69001', 'France', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2')),
(UUID(), '1213 Rue Victor Hugo', 'Lyon', 'Auvergne-Rhône-Alpes', '69002', 'France', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2'));

-- Foyers
INSERT INTO Foyers (FoyerID, NomDuFoyer, ContactPrincipal, AdresseID) VALUES
(UUID(), 'Famille Dupont', NULL, (SELECT AdresseID FROM Adresses WHERE Rue='123 Rue de la Paix')),
(UUID(), 'Famille Curie', NULL, (SELECT AdresseID FROM Adresses WHERE Rue='456 Avenue des Champs')),
(UUID(), 'Famille Einstein', NULL, (SELECT AdresseID FROM Adresses WHERE Rue='789 Boulevard Saint-Germain'));


-- Clients 
INSERT INTO Clients (ClientID, Prenom, Nom, Email, NumeroDeTelephone, DateDeNaissance, FoyerID, AdresseID) VALUES
(UUID(), 'Jean', 'Dupont', 'jean.dupont@example.com', '0612345678', '1980-05-15', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Dupont'), (SELECT AdresseID FROM Adresses WHERE Rue='123 Rue de la Paix')),
(UUID(), 'Marie', 'Curie', 'marie.curie@example.com', '0623456789', '1985-07-20', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Curie'), (SELECT AdresseID FROM Adresses WHERE Rue='456 Avenue des Champs')),
(UUID(), 'Albert', 'Einstein', 'albert.einstein@example.com', '0634567890', '1979-03-14', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Einstein'), (SELECT AdresseID FROM Adresses WHERE Rue='789 Boulevard Saint-Germain')),
(UUID(), 'Isaac', 'Newton', 'isaac.newton@example.com', '0645678901', '1983-01-04', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Einstein'), (SELECT AdresseID FROM Adresses WHERE Rue='1011 Rue de la République')),
(UUID(), 'Nikola', 'Tesla', 'nikola.tesla@example.com', '0656789012', '1981-07-10', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Dupont'), (SELECT AdresseID FROM Adresses WHERE Rue='1213 Rue Victor Hugo')),
(UUID(), 'Ada', 'Lovelace', 'ada.lovelace@example.com', '0667890123', '1985-12-10', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Curie'), (SELECT AdresseID FROM Adresses WHERE Rue='123 Rue de la Paix')),
(UUID(), 'Charles', 'Babbage', 'charles.babbage@example.com', '0678901234', '1981-09-15', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Einstein'), (SELECT AdresseID FROM Adresses WHERE Rue='456 Avenue des Champs')),
(UUID(), 'Grace', 'Hopper', 'grace.hopper@example.com', '0689012345', '1980-12-09', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Dupont'), (SELECT AdresseID FROM Adresses WHERE Rue='789 Boulevard Saint-Germain')),
(UUID(), 'Alan', 'Turing', 'alan.turing@example.com', '0690123456', '1983-06-23', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Curie'), (SELECT AdresseID FROM Adresses WHERE Rue='1011 Rue de la République')),
(UUID(), 'Linus', 'Torvalds', 'linus.torvalds@example.com', '0601234567', '1989-12-28', (SELECT FoyerID FROM Foyers WHERE NomDuFoyer='Famille Einstein'), (SELECT AdresseID FROM Adresses WHERE Rue='1213 Rue Victor Hugo'));


-- Offres 
INSERT INTO Offres (OffreID, NomDeLOffre, DescriptionOffre, Prix, TypeDeService) VALUES
(UUID(), 'Forfait Mobile 50 Go', 'Forfait mobile avec 50 Go de données', 19.99, 'Mobile'),
(UUID(), 'Internet Fibre 1 Gbps', 'Connexion internet fibre à 1 Gbps', 29.99, 'Internet'),
(UUID(), 'Pack TV Premium', 'Pack TV avec chaînes premium', 14.99, 'TV');


-- ComptesDeServices
INSERT INTO ComptesDeServices (CompteID, ClientID, TypeDeService, DateDeDebut, DateDeFin, OffreID, SIMID) VALUES
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Dupont'), 'Mobile', '2023-01-01', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Forfait Mobile 50 Go'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Curie'), 'Internet', '2023-02-01', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Internet Fibre 1 Gbps'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Einstein'), 'TV', '2023-03-01', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Pack TV Premium'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Newton'), 'Mobile', '2023-01-15', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Forfait Mobile 50 Go'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Tesla'), 'Internet', '2023-02-15', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Internet Fibre 1 Gbps'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Lovelace'), 'TV', '2023-03-15', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Pack TV Premium'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Babbage'), 'Mobile', '2023-01-20', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Forfait Mobile 50 Go'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Hopper'), 'Internet', '2023-02-20', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Internet Fibre 1 Gbps'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Turing'), 'TV', '2023-03-20', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Pack TV Premium'), NULL),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Torvalds'), 'Mobile', '2023-01-25', NULL, (SELECT OffreID FROM Offres WHERE NomDeLOffre='Forfait Mobile 50 Go'), NULL);


-- SIM
INSERT INTO SIM (SIMID, NumeroSIM, DateDActivation, DateDDesactivation, CompteID) VALUES
(UUID(), 'SIM1234567890', '2023-01-01', NULL, (SELECT CompteID FROM ComptesDeServices WHERE ClientID = (SELECT ClientID FROM Clients WHERE Nom='Dupont') AND TypeDeService='Mobile')),
(UUID(), 'SIM0987654321', '2023-01-15', NULL, (SELECT CompteID FROM ComptesDeServices WHERE ClientID = (SELECT ClientID FROM Clients WHERE Nom='Newton') AND TypeDeService='Mobile')),
(UUID(), 'SIM1234509876', '2023-01-20', NULL, (SELECT CompteID FROM ComptesDeServices WHERE ClientID = (SELECT ClientID FROM Clients WHERE Nom='Babbage') AND TypeDeService='Mobile')),
(UUID(), 'SIM9876543210', '2023-01-25', NULL, (SELECT CompteID FROM ComptesDeServices WHERE ClientID = (SELECT ClientID FROM Clients WHERE Nom='Torvalds') AND TypeDeService='Mobile'));


-- InterventionsDeMaintenance 
INSERT INTO InterventionsDeMaintenance (InterventionID, ClientID, DateDeLIntervention, NomDuTechnicien, DescriptionIntervention, ZoneID) VALUES
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Dupont'), '2023-04-01', 'Technicien A', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Curie'), '2023-04-02', 'Technicien B', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Einstein'), '2023-04-03', 'Technicien C', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Newton'), '2023-04-04', 'Technicien D', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Tesla'), '2023-04-05', 'Technicien E', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Lovelace'), '2023-04-06', 'Technicien F', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Babbage'), '2023-04-07', 'Technicien G', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Hopper'), '2023-04-08', 'Technicien H', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 1')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Turing'), '2023-04-09', 'Technicien I', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2')),
(UUID(), (SELECT ClientID FROM Clients WHERE Nom='Torvalds'), '2023-04-10', 'Technicien J', 'Installation initiale', (SELECT ZoneID FROM ZonesDeCouverture WHERE NomDeLaZone='Zone 2'));


-- Mise à jour les SIMID dans ComptesDeServices 
UPDATE ComptesDeServices SET SIMID = (SELECT SIMID FROM SIM WHERE CompteID = ComptesDeServices.CompteID) WHERE TypeDeService = 'Mobile';


-- Mise à jour de la colonne "contactPrincipal" dans Foyers
UPDATE Foyers SET ContactPrincipal = (SELECT ClientID FROM Clients WHERE Foyers.AdresseID = Clients.AdresseID LIMIT 1);

