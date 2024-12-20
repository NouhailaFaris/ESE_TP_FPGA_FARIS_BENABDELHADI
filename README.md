# ESE_TP_FPGA_FARIS_BENABDELHADI
## Création du projet et fichier VHDL

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

