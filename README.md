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
Deux puces sont affichées : SOCVHPS et 5CSEBA6U23.
5CSEBA6U23 c'est l'élément programmable. L'autre correspond au processeur ARM (HPS) intégré dans le SoC.

![image](https://github.com/user-attachments/assets/45a97634-891d-44e3-850d-4630501726e9)

## Test du résultat :(SW(IN_Y24) == Led(PIN_w15)

![WhatsApp Image 2024-12-19 at 08 59 40](https://github.com/user-attachments/assets/2992e9bf-b7cc-44c8-8293-a8e04ebf763a)

## Modification du VHDL

