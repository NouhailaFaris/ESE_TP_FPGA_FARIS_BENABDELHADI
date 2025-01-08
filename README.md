# ESE_TP_FPGA_FARIS_BENABDELHADI
## TP1 : Création du projet et fichier VHDL

Un projet dans Quartus est un espace de travail où on peu configurer, développer, compiler et tester notre design pour un FPGA spécifique. Il contient tous les fichiers nécessaires (VHDL, contraintes, configurations, etc.).

![image](https://github.com/user-attachments/assets/cc96e5e8-a7f8-49ce-a5f3-19d23ffa2958)

## Fichier de contrainte

Le fichier de contraintes permet d'indiquer au logiciel Quartus quelles broches physiques du FPGA (pins) correspondent aux signaux définis dans notre code VHDL. Sans ces informations, Quartus ne peut pas relier les signaux logiques aux composants matériels (LEDs, switches, etc.) de la carte.

![image](https://github.com/user-attachments/assets/1a469142-2cc3-4db2-8517-a11b2742fae5)

## Programmation de la carte
avec l'option Auto Detect :
Quartus détecte automatiquement les composants connectés 
Deux puces sont affichées : 

1-SOCVHPS et 5CSEBA6U23.

2-5CSEBA6U23 c'est l'élément programmable. L'autre correspond au processeur ARM .

![image](https://github.com/user-attachments/assets/45a97634-891d-44e3-850d-4630501726e9)

## Test du résultat :(SW(IN_Y24) == Led(PIN_w15)

![WhatsApp Image 2024-12-19 at 08 59 40](https://github.com/user-attachments/assets/2992e9bf-b7cc-44c8-8293-a8e04ebf763a)

## Modification du VHDL

Gestion de plusieurs bits :

- std_logic représente un seul bit (0 ou 1).
- std_logic_vector est un tableau de plusieurs bits, utile pour gérer des données multi-bit comme des bus (par exemple, un groupe de switches ou de LEDs).
Puisque les signaux sw et led sont maintenant des vecteurs de 4 bits, il est nécessaire d’assigner une broche différente pour chaque bit :

![image](https://github.com/user-attachments/assets/67ae2565-d6a0-4155-8fde-bc3412534430)

![WhatsApp Image 2024-12-19 at 09 15 04](https://github.com/user-attachments/assets/71aa478f-3c93-434d-bd23-c824a53a9cf8)

## Faire clignoter une LED

### Code VHDL initial pour faire clignoter une LED

***La broche FPGA_CLK1_50:***

- Elle fournit une fréquence d'horloge de 50 MHz.
- Cette horloge est utilisée pour les designs séquentiels où les opérations dépendent d’un signal temporel.
  
![image](https://github.com/user-attachments/assets/9fde7b2c-c40d-4b93-9eb2-ab7bf954499f)

***Notre shéma:***

![image](https://github.com/user-attachments/assets/d0a386d8-decc-434e-8c9b-f17398916b98)

***Schéma RTL :***
Le schéma RTL (Register Transfer Level) généré par Quartus montre les éléments clés du design :
- Entrée d'horloge i_clk connectée à un basculeur .
- Signal de reset i_rst_n pour réinitialiser la bascule.
- Sortie o_led connectée à l'état de la bascule.
  
![image](https://github.com/user-attachments/assets/4c1861d0-94aa-4348-8ba9-74a797eee164)

### Code modifié pour réduire la fréquence
Pour rendre le clignotement perceptible, un compteur est ajouté pour diviser la fréquence de l'horloge.

***Notre shéma:***
![image](https://github.com/user-attachments/assets/3770c174-7f3d-49cc-b9d1-7fffa2b2f501)

***Schéma RTL :***
![image](https://github.com/user-attachments/assets/4781fbaa-2e15-4bc4-95c2-568a0dab51f3)

### KEY0

***broche du FPGA***

![image](https://github.com/user-attachments/assets/b66abb19-cc61-4097-bc67-61c9261a7466)

***Signal de reset (i_rst_n):***

Rôle : Initialiser les registres et le compteur dans un état connu (ici, 0).

Actif bas (_n) : Le signal est actif lorsque sa valeur est à 0.

### chenillard
![image](https://github.com/user-attachments/assets/0d59728d-2c47-4c4e-a742-797748ae3a03)

***fonctionnement :***
1-Compteur pour réduction de fréquence :

Le compteur divise la fréquence de l'horloge (50 MHz) .

2-Décalage circulaire :

Les bits du vecteur chenille sont décalés de manière circulaire à chaque cycle complet du compteur, créant l'effet de déplacement progressif.

3-Signal de reset :

Permet de réinitialiser le chenillard à son état initial (00000001).

***Bouton poussoir KEY0***

Connexion : Sur la carte DE10-Nano, le bouton poussoir KEY0 est connecté à la broche PIN_AH17.

Utilisation : on utilise ce bouton  pour réinitialiser le chenillard à son état initial.

## TP 2 : Petit projet : Bouncing ENSEA Logo
### Objectif : 
Afficher un logo ENSEA rebondissant sur un écran HDMI, similaire à l'effet observé dans les lecteurs DVD.

### Contrôleur HDMI :

#### Ressources Disponibles:

Les ressources suivantes sont fournies sur Moodle :

Projet Quartus avec le pinout préconfiguré.

DE10_Nano_HDMI_TX.vhd : définissant les entrées/sorties.

I2C_HDMI_Config.v et I2C_Controller.v : Modules pour configurer l'émetteur HDMI.

hdmi_generator.vhd : Module à compléter pour générer les images.

#### Analyse de l'Entity:

1. Paramètres de Résolution (paramètres définis en generic ) :
   
- h_res (Horizontal Resolution)
Rôle : Définit la largeur de l'image en pixels (nombre total de colonnes visibles).
Unité : Pixels.
Valeur par défaut : 720 pixels.

- v_res (Vertical Resolution)
Rôle : Définit la hauteur de l'image en pixels (nombre total de lignes visibles).
Unité : Pixels.
Valeur par défaut : 480 pixels.

2. Paramètres de Timing Horizontal :

- h_sync (Horizontal Sync Pulse Width)
Rôle : Durée de l'impulsion de synchronisation horizontale, signalant la fin d'une ligne de balayage.
Unité : Cycles d'horloge.

- h_fp (Horizontal Front Porch)
Rôle : Temps d'attente avant l'impulsion de synchronisation horizontale. Permet de stabiliser le signal.
Unité :Cycles d'horloge.

- h_bp (Horizontal Back Porch)
Rôle : Temps d'attente après l'impulsion de synchronisation horizontale, avant l'affichage des pixels visibles.
Unité :Cycles d'horloge.

3. Paramètres de Timing vertical :

- v_sync (Vertical Sync Pulse Width)
Rôle : Durée de l'impulsion de synchronisation verticale, signalant la fin d'une trame (frame).
Unité : Lignes.

- v_fp (Vertical Front Porch)
Rôle : emps d'attente avant l'impulsion de synchronisation verticale. Permet de stabiliser le signal verticalement.
Unité : Lignes.

- v_bp (Vertical Back Porch)
Rôle : Temps d'attente après l'impulsion de synchronisation verticale, avant l'affichage des pixels visibles.
Unité : Lignes.

## Ecriture du composant:
#### 1.  Création de compteurs horizontal (h_count):

***Le compteur horizontal est incrémenté à chaque cycle d’horloge et revient à zéro lorsqu’il atteint h_total = h_res+h_fp + h_sync +h_bp . Il génère également le signal de synchronisation o_hdmi_hs.***

Valeurs pour Test :

```
constant h_res    : natural := 32; --Résolution  horizontale en pixel
constant v_res    : natural := 24; --Résolution verticale en pixel
constant h_sync  : natural := 10; -- Sync pulse (lines)
constant  h_fp    : natural := 10; -- Front porch (px)
constant  h_bp    : natural := 10; -- Back porch (px)
constant  v_sync  : natural := 10; -- Sync pulse (lines)
constant  v_fp    : natural := 10; -- Front porch (px)
constant  v_bp    : natural := 10;  -- Back porch (px)

```

![Screenshot_20250107_115145](https://github.com/user-attachments/assets/dd89b115-722e-43c1-8cf4-178a2b2c5f20)

####2.  Création de compteurs vertical (v_count):

***le  compteur vertical (v_count) s'incrémente à chaque fin de ligne horizontale :
Boucle de 0 à v_total = (v_res + v_sync + v_fp + v_bp).
Génère le signal de synchronisation verticale (o_hdmi_vs).***

![Screenshot_20250107_120354](https://github.com/user-attachments/assets/f2b58a67-980c-406b-8261-ee536655c7ae)

####3. Détermination les plages de h_count et v_count où les pixels sont visibles

les pages de h_count sont déterminés par :
 ```
if (h_sync + h_fp = s_h_count ) then
                s_h_act <= '1';
            elsif (s_h_count = h_sync + h_fp + h_res) then
                s_h_act <= '0';
            end if;
```
Valeurs théoriques:

- la page de h_count =[20,52]
- de méme pour la page de v_count =[20,44]

valeurs avec le test :

![h_act_down](https://github.com/user-attachments/assets/ff82e66c-31b9-4034-ac89-3f61dae60683)
![h_act_up](https://github.com/user-attachments/assets/e9278fdd-4b31-4316-a935-e03fabcff2d4)

####4. Production du signal o_hdmi_de lorsqu'un pixel est dans la zone active.donc o_hdmi_de = s_v_act and s_h_act 

![hdmi_de](https://github.com/user-attachments/assets/00ec051f-9858-4246-a7dc-5c2a07f8afc3)

####5. Adresse des Pixels

Un compteur (r_pixel_counter) est utilisé pour générer l'adresse des pixels actifs :

Incrémenté uniquement dans la zone active.

Réinitialisé au début de chaque nouvelle image.
dans notre cas la taille max de r_pixel_counter = h_res * v_res -1 =768 

![r_pixel_counter_767](https://github.com/user-attachments/assets/402b9c8d-c629-4fce-bfd5-c03eb0f766f5)

####6. Compteurs des Pixels

![y_x_conter](https://github.com/user-attachments/assets/b7b755ed-2c87-4b84-8ce6-55d1fda251d4)



