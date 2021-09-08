# Miskolc Citizens' Assembly - simulated annealing
Script for randomly selecting members of the Miskolc Citizens' Assembly, while taking into account a set of demographic criteria.

Written in R. Uses simmulated annealing with genSA package.

Version 3.0

Original version of the code was created by Nikodem Mrożek, PhD

# Simulated annealing (EN)

First, we define an evaluation function for a given composition. Suppose we are looking for a panel consisting of Xm men and Xk women and Yp people with primary education, YS with secondary education and YW with tertiary education. For a given panel composition P, we count the number of women men and people with a given education and denote these numbers by XM(P), XK(P), YP(P), YS(P), YW(P) respectively.
We define the evaluation function for a given panel P as

> F(P)=( Xm(P)-Xm)^2+( Xk(P)-Xk)^2+( Yp(P)-Yp)^2+( Ys(P)-Ys)^2+( Yw(P)-Yw)^2

The ideal panel composition is equivalent to the condition F(P)=0. 

When the composition of the panel is defined by more parameters on the same principle we add them to the evaluation function.

Description of the algorithm (selecting N persons for the panel)
1. We set a parameter T called temperature.
1. We randomly select N persons to form the panel P. 1.
1. Calculate the value of the evaluation function F(P). 1.
1. We draw a new panel composition P' in a neighborhood P according to normal probability with mean at P and variance equal to T. 1.
1. We calculate the value of the evaluation function F(P').
1. We calculate the value of A=e(F(P)-F(P'))/T. We draw a number x from the interval [0,1]. If it is smaller than A, we replace the composition of panel P by the composition of panel P'. 1.
1. Reduce the temperature T by ΔT.
1. If the temperature is greater than zero we return to step 3, otherwise we return the composition of panel P.

We select the parameters T and ΔT on a test basis to optimise the performance of the algorithm in a given situation.

# Simulated annealing (HU)
A panel összetételének kiválasztási folyamata a szimulált lágyítás algoritmusán alapul.
Ez a következőképpen működik - kezdetben meghatározzuk egy adott kompozíció értékelési funkcióját. Tegyük fel, hogy egy olyan panelt keresünk, melynek XM férfiből és XK nőből, valamint YP alapfokú végzettséggel, YS középfokú végzettséggel és YW  felsőfokú végzettséggel rendelkező emberből kell állnia. A P panel adott összetételének esetében számoljuk, hogy hány nő, férfi és adott végzettségű ember van benne, és ezeket a számokat megfelelően, XM(P), XK(P), YP(P), YS(P), YW(P)-ként jelöljük meg.
Egy adott P panel kiértékelési funkcióját így definiáljuk

> F(P)=( Xm(P)-Xm)^2+( Xk(P)-Xk)^2+( Yp(P)-Yp)^2+( Ys(P)-Ys)^2+( Yw(P)-Yw)^2

A panel ideális összetétele megegyezik az F(P) = 0 feltétellel. 
Ha a panel összetételét több paraméter határozza meg, ugyanazon az elven hozzáadjuk azokat a kiértékelési funkcióhoz.

Az algoritmus leírása (N személy hozzárendelése a panelhez):
1. Meghatározzuk a hőmérsékletnek nevezett T paramétert.
2. Véletlenszerűen kiválasztunk N személyt, akik a P panelt alkotják.
3. Kiszámítjuk az F(P) kiértékelő függvény értékét.
4. Kisorsoljuk a P' panel új összetételét a P környezetében normál valószínűség szerint, P pontban lévő átlaggal és T-vel egyenlő varianciával.
5. Kiszámítjuk az F(P') kiértékelő függvény értékét.
6. Kiszámítjuk az A=e(F(P)-F(P’))/T értéket. Kisorsoljuk az x számot a [0,1] intervallumból. Ha kisebb, mint A, akkor a P panel összetételét a P' panel összetételére cseréljük.
7. Csökkentjük a T hőmérsékletet ΔT-vel.
8. Ha a hőmérséklet nullánál nagyobb, visszatérünk a 3. pontra, ellenkező esetben a P panel összetételét adjuk vissza.

A T és ΔT paramétereket tesztek alapján választjuk ki annak érdekében, hogy optimalizáljuk az algoritmus működését adott helyzetben.
