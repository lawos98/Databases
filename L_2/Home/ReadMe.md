# Laboratorium 2 -Zadania Domowe

## Slajd 1

### Zad.1

Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia i zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży).

``` sql
Select OrderID,SUM(UnitPrice) from [Order Details] GROUP BY OrderID order by SUM(UnitPrice) desc
```
---
### Zad.2

Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy

``` sql
Select top 10 OrderID,SUM(UnitPrice) from [Order Details] GROUP BY OrderID order by SUM(UnitPrice) desc
```
---
## Slajd 2

### Zad.1

Podaj liczbę zamówionych jednostek produktów dla produktów, dla których productid < 3

``` sql
Select ProductID,Sum(Quantity) from [Order Details] where ProductID<3 group by ProductID
```
---

### Zad.2

Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę zamówionych jednostek produktu dla wszystkich produktów

``` sql
Select ProductID,Sum(Quantity) from [Order Details] group by ProductID order by ProductID
```
---

### Zad.3

Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których łączna liczba zamawianych jednostek produktów jest > 250

``` sql
Select OrderID,Sum(CONVERT(money,UnitPrice*Quantity*(1-Discount))) from [Order Details] group by OrderID having Sum(Quantity)>250
```
---
## Slajd 3

### Zad.1

Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień

``` sql
Select EmployeeID,COUNT(*) from Orders group by EmployeeID
```
---

### Zad.2

Select ShipVia,SUM(Freight) as "Oplata za przesylke" from Orders group by ShipVia


``` sql
Select ShipVia,SUM(Freight) as "Oplata za przesylke" from Orders group by ShipVia
```
---
### Zad.3

Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień w latach o 1996 do 1997

``` sql
Select ShipVia,SUM(Freight) as "Oplata za przesylke"
from Orders where year(ShippedDate) BETWEEN 1996 and 1997 group by ShipVia
```
---
## Slajd 4

### Zad.1

Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata i miesiące

``` sql
Select EmployeeID,YEAR(OrderDate),MONTH(OrderDate),COUNT(*) from Orders
GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)
```
---
### Zad.2

Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej kategori

``` sql
Select CategoryID,Min(UnitPrice),MAX(UnitPrice) from Products group by CategoryID
```
---
