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

Gestion de plusieurs bits :

- std_logic représente un seul bit (0 ou 1).
- std_logic_vector est un tableau de plusieurs bits, utile pour gérer des données multi-bit comme des bus (par exemple, un groupe de switches ou de LEDs).
Puisque les signaux sw et led sont maintenant des vecteurs de 4 bits, il est nécessaire d’assigner une broche différente pour chaque bit :

![image](https://github.com/user-attachments/assets/67ae2565-d6a0-4155-8fde-bc3412534430)

![WhatsApp Image 2024-12-19 at 09 15 04](https://github.com/user-attachments/assets/71aa478f-3c93-434d-bd23-c824a53a9cf8)

## Faire clignoter une LED

 ### La broche FPGA_CLK1_50:
- Elle fournit une fréquence d'horloge de 50 MHz.
- Cette horloge est utilisée pour les designs séquentiels où les opérations dépendent d’un signal temporel.
  
![image](https://github.com/user-attachments/assets/9fde7b2c-c40d-4b93-9eb2-ab7bf954499f)

### Notre shéma:

![image](https://github.com/user-attachments/assets/d0a386d8-decc-434e-8c9b-f17398916b98)

### Schéma RTL :
Le schéma RTL (Register Transfer Level) généré par Quartus montre les éléments clés du design :
- Entrée d'horloge i_clk connectée à un basculeur (flip-flop).
- Signal de reset i_rst_n pour réinitialiser la bascule.
- Sortie o_led connectée à l'état de la bascule.

### RTL1
![image](https://github.com/user-attachments/assets/4c1861d0-94aa-4348-8ba9-74a797eee164)

### RTL2
![image](https://github.com/user-attachments/assets/715b1f95-a903-4f64-a0d2-17e297bdb073)


