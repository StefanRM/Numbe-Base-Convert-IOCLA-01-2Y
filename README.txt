  _____ ___ __  __   _     _ 
 |_   _| __|  \/  | /_\   / |
   | | | _|| |\/| |/ _ \  | |
   |_| |___|_|  |_/_/ \_\ |_|
                             
Nume:    Maftei Stefan - Radu
Grupa:   324CD
Materie: IOCLA



	Algoritmul utilizat in cadrul temei este cel din laboratorul 1, pentru
conversia din zecimal:
-> se imparte succesiv numarul la numarul bazei si se retin resturile;
-> cand catul impartirii devine 0, se scriu in ordine inversa;
-> in cazul bazelor mai mari ca 9, atunci cand restul este mai mare sau egal cu
10 se folosesc litere (ex: baza 16, se adauga literele a, b, c, d, e, f pentru
resturile 10, 11, 12, 13, 14, respectiv 15).
	Se initializeaza cu zero registrii eax, ebx si ecx. In ele vom incarca
numarul de convertit, baza in care vom converti si numarul de impartiri efectuate.
Verificam ebx (baza) daca se afla intre 2 si 16, in caz contrar vom afisa mesajul
de eroare "Baza incorecta" declarat in sectiunea '.data'.
	Daca ebx (baza) are valoare corecta, atunci vom calcula efectuand impartiri
repetate. Toate numerele pe care le vom converti sunt pe 32 biti, deci fom folosi
registrii edx:eax pentru deimpartit, unde edx va fi mereu zero (eax este pe 32 biti).
Efectuam impartirile la ebx (baza), catul si restul fiind stocate in eax si edx.
Punem pe stiva valoarea lui edx, deoarece avem nevoie de resturi in ordine inversa,
incrementam ecx (numarul de impartiri efectuate) si reluam impartirile, initializand
din nou cu zero pe edx, iar in eax este deja catul, deci va ramane neschimbat.
	Dupa efectuarea impartirilor, luam de pe stiva resturile in ordine inversa
(ordine de tipul LIFO). Verificam daca restul este mai mic decat 10. Astfel vom
afisa un numar, daca restul este mai mic decat 10, sau o litera in caz contrar.
	Pentru numar punem codul ASCII pentru '0' in edx si adunam la codul ASCII
restul, apoi afisam folosind MACRO-ul PRINT_CHAR.
	Pentru litera punem codul ASCII pentru 'a' in edx, scadem 10 din eax (rest),
deoarece sunt doar 6 resturi de tipul litera, si adunam la codul ASCII, apoi afisam
folosind MACRO-ul PRINT_CHAR.
	Dupa fiecare afisare a cifrei, se decrementeaza ecx (numarul de impartiri
efectuate) si atunci cand devine zero se incheie programul.