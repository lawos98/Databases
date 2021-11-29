# Laboratorium 2 -Zadania Domowe

## Slajd 1

### Zad.1

Podaj liczbę produktów o cenach mniejszych niż 10$ lub większych niż 20$.

``` sql
Select COUNT(*) from Products where UnitPrice<10 or UnitPrice>20
```
---
### Zad.2

Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20$.

``` sql
Select MAX(UnitPrice) from Products where UnitPrice<20
```
---
### Zad.3

Podaj maksymalną i minimalną i średnią cenę produktu dla produktów o produktach sprzedawanych w butelkach (‘bottle’).

``` sql
Select MIN(UnitPrice),MAX(UnitPrice),AVG(UnitPrice) from Products where QuantityPerUnit like '%bottle%'
```
---
### Zad.4

Wypisz informację o wszystkich produktach o cenie powyżej średniej.

``` sql
SELECT * from Products where UnitPrice>(Select AVG(UnitPrice) from Products)
```
---
### Zad.5

Podaj wartość zamówienia o numerze 10250.

``` sql
Select SUM(UnitPrice) from [Order Details] where OrderID=10250
```
---
## Slajd 2

### Zad.1

Podaj maksymalną cenę zamawianego produktu dla każdego zamówieni.

``` sql
Select OrderID,MAX(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
```
---

### Zad.2

Posortuj zamówienia wg maksymalnej ceny produktu.

``` sql
Select ProductID,Max(UnitPrice) as 'Max_Price' from Products GROUP BY ProductID Order By Max_Price
```
---

### Zad.3

Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia.

``` sql
Select OrderID,MAX(UnitPrice),MIN(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
```
---
### Zad.4

Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)

``` sql
Select OrderID,MAX(UnitPrice),MIN(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
```
---
### Zad.5

Który z spedytorów był najaktywniejszy w 1997 roku

``` sql
Select top 1 ShipVia,COUNT(*) as Unit from Orders where year(ShippedDate)=1997 group by ShipVia order by Unit desc
```
---
## Slajd 3

### Zad.1

Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5

``` sql
Select OrderID,count(*) from [Order Details] group by OrderID having count(*)>5
```
---

### Zad.2

Wyświetl klientów dla których w 1998 roku zrealizowano więcej niż 8 zamówień
(wyniki posortuj malejąco wg łącznej kwoty za dostarczenie zamówień dla
każdego z klientów */

``` sql
Select CustomerID,Count(*) as resualt from Orders where OrderDate>'1998' GROUP BY CustomerID  order by resualt desc
```
---
## Slajd 4

### Zad.1

Wyświetl klientów dla których w 1998 roku zrealizowano więcej niż 8 zamówień(wyniki posortuj malejąco wg łącznej kwoty za dostarczenie zamówień dla
każdego z klientów.

``` sql
Select CustomerID,Count(*) as resualt from Orders where OrderDate>'1998' GROUP BY CustomerID  order by resualt desc
```
---
