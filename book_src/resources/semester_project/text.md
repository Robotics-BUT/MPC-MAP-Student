# Semester Project


## Cíle projektu

Cílem semestrálního projektu je vytvořit algoritmus pro předložený simulátor v Matlabu, pomocí kterého dojede robot do cíle v co nejmenším počtu iterací. 
Algoritmus musí fungovat pro různé mapy, počáteční pozice startu a natočení robotu a pozice cíle; robot nesmí narážet do překážek a přejíždět hranice mapy. 
Nezbytným minimem pro splnění projektu je úspěšné zvládnutí  všech předložených vzorových map ve složce `resources`. Metody vhodné pro splnění zadání budou 
probrány na přednáškách a cvičeních, ne všechny musí být použity. Pro splnění zadání je možné pouze vyčítat data ze struktur `read_only_vars` (mapa, data 
ze senzorů, parametry podvozku, aj.) a `public_vars`, nastavovat rychlosti robotu v proměnné `agent_motion_vector` a zapisovat do struktury `public_vars` 
(pro účely vizualizace). Není možné modifikovat základní strukturu hlavní smyčky simulátoru.

## Simulátor

Simulátor je dostupný v repozitáři: <https://github.com/Robotics-BUT/MPC-MAP-Student> Simulátor nesmí být modifikován, hodnotit se bude na předloženém simulátoru.

Vaše řešení musí být spustitelné bez Matlab toolboxů.

V případě nalezení chyby v simulátoru ze strany vyučujících i studentů bude vydána nová verze s opravou, o které budou studenti informování.

## Způsob hodnocení

Vytvořený algoritmus bude vyučujícími otestován na různých mapách s různými souřadnicemi (včetně orientace) startu a cíle. Úspěšnost dojetí do cíle a potřebný počet iterací bude vyhodnocen statisticky opakovaným spouštěním algoritmu.

## Odevzdání

Projekt odevzdejte ve formě komprimovaného souboru obsahující celý spustitelný projekt v Matlab elektronicky na email <tomas.lazna@ceitec.vutbr.cz> do konce 8. týdne semestru (2. 4. 2023, 23:59).

## Bodové hodnocení
 - Úspěšnost dojetí do cíle: 15 b
 - Potřebný počet iterací: 15 b
 - Technické řešení: 20 b
 - Penalizace až -20 b, pokud projekt nelze spustit bez chyb