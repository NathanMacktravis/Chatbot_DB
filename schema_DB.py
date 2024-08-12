## A python code to plot the schema of the database used for the project

import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(15, 10))

def draw_table(ax, name, attributes, x, y):
    width = 2
    height = 0.2 * len(attributes)
    ax.add_patch(patches.Rectangle((x, y), width, height, fill=True, edgecolor='black', facecolor='lightgrey'))
    plt.text(x + 0.1, y + height - 0.15, name, fontsize=12, fontweight='bold')
    for i, attr in enumerate(attributes):
        plt.text(x + 0.1, y + height - (i + 1) * 0.2, attr, fontsize=10)

# Tables definitions
tables = [
    ("Clients", ["ClientID (PK)", "Prenom", "Nom", "Email", "NumeroDeTelephone", "DateDeNaissance", "FoyerID (FK)", "AdresseID (FK)"], 1, 8),
    ("ComptesDeServices", ["CompteID (PK)", "ClientID (FK)", "TypeDeService", "DateDeDebut", "DateDeFin", "OffreID (FK)", "SIMID (FK)"], 5, 8),
    ("Adresses", ["AdresseID (PK)", "Rue", "Ville", "EtatRegion", "CodePostal", "Pays", "ZoneID (FK)"], 1, 4),
    ("SIM", ["SIMID (PK)", "NumeroSIM", "DateDActivation", "DateDDesactivation", "CompteID (FK)"], 5, 4),
    ("Foyers", ["FoyerID (PK)", "NomDuFoyer", "ContactPrincipal (FK)", "AdresseID (FK)"], 9, 8),
    ("InterventionsDeMaintenance", ["InterventionID (PK)", "ClientID (FK)", "DateDeLIntervention", "NomDuTechnicien", "DescriptionIntervention", "ZoneID (FK)"], 1, 0),
    ("ZonesDeCouverture", ["ZoneID (PK)", "NomDeLaZone", "DescriptionZone", "Ville", "EtatRegion", "CodePostal", "Pays"], 5, 0),
    ("Offres", ["OffreID (PK)", "NomDeLOffre", "DescriptionOffre", "Prix", "TypeDeService"], 9, 4)
]

# Draw each table
for table in tables:
    draw_table(ax, table[0], table[1], table[2], table[3])

# Draw relations
def draw_relation(ax, start, end, text, start_offset=(0,0), end_offset=(0,0)):
    start_x, start_y = start[0] + start_offset[0], start[1] + start_offset[1]
    end_x, end_y = end[0] + end_offset[0], end[1] + end_offset[1]
    ax.annotate(text, xy=(start_x, start_y), xytext=(end_x, end_y),
                arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=-0.2"))

# Relations
relations = [
    ((3, 8.2), (5, 8.2), "FK"),
    ((1.5, 4.2), (1.5, 8), "FK"),
    ((5, 4.2), (5, 8), "FK"),
    ((3, 0.2), (1.5, 4), "FK"),
    ((3, 0.2), (5, 0), "FK"),
    ((5, 4), (5, 0.2), "FK"),
    ((1.5, 0.2), (1.5, 8), "FK"),
]

for relation in relations:
    draw_relation(ax, relation[0], relation[1], relati