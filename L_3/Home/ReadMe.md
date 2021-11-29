# Laboratorium 3 -Zadania Domowe

## Slajd 1

### Zad.1

Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz nazwę klienta.

``` sql
SELECT O.OrderID, SUM(Quantity)
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY O.OrderID
```
---
### Zad.2

Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczbę zamówionych jednostek jest większa niż 250

``` sql
SELECT O.OrderID, SUM(Quantity)
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY O.OrderID
having sum(Quantity)>250
```
---
### Zad.3

Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę klienta.

``` sql
SELECT O.OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS 'Price',
C.CompanyName
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
GROUP BY O.OrderID, C.CompanyName
```
---
### Zad.4

Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczba jednostek jest większa niż 250.

``` sql
SELECT O.OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS 'Price',
C.CompanyName
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
GROUP BY O.OrderID, C.CompanyName
HAVING Sum(Quantity)>250
```
---
### Zad.5

Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko pracownika obsługującego zamówienie

``` sql
SELECT O.OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS 'Wartosc',
C.CompanyName, E.FirstName + ' ' + E.LastName AS 'Pracownik'
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY O.OrderID, C.CompanyName, E.FirstName + ' ' + E.LastName
HAVING SUM(Quantity) > 250
```
---

## Slajd 2

### Zad.1

Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klientów jednostek towarów z tek kategorii

``` sql
SELECT CategoryName, SUM(Quantity)
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY CategoryName
```
---
### Zad.2

Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez klientów jednostek towarów z tek kategorii.

``` sql
SELECT CategoryName, SUM(Od.UnitPrice*Quantity*(1-Discount)+O.Freight)
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
    inner join Orders O on OD.OrderID = O.OrderID
GROUP BY CategoryName
```
---
### Zad.3

Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez klientów jednostek towarów z tek kategorii.

``` sql
SELECT CategoryName, SUM(Od.UnitPrice*Quantity*(1-Discount))
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY CategoryName
order by 2
```
---
### Zad.4

Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę

``` sql
SELECT CompanyName, COUNT(OrderID)
FROM Shippers S
    INNER JOIN Orders O ON O.ShipVia = S.ShipperID
WHERE year(O.ShippedDate) = 1997
GROUP BY CompanyName
```
---

## Slajd 3

### Zad.1

Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r

``` sql
SELECT CompanyName, COUNT(OrderID)
FROM Shippers S
    INNER JOIN Orders O ON O.ShipVia = S.ShipperID
WHERE year(O.ShippedDate) = 1997
GROUP BY CompanyName
```
---

### Zad.2

Który z przewoźników był najaktywniejszy (przewiózł największą liczbę zamówień) w 1997r, podaj nazwę tego przewoźnika

``` sql
SELECT TOP 1 CompanyName, COUNT(OrderID)
FROM Shippers S
    INNER JOIN Orders O ON O.ShipVia = S.ShipperID
WHERE year(O.ShippedDate) = 1997
GROUP BY CompanyName
ORDER BY 2 DESC
```
---

### Zad.3

Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika

``` sql
SELECT FirstName + ' ' + LastName, SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees E
    INNER JOIN Orders O ON O.EmployeeID = E.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
GROUP BY FirstName + ' ' + LastName;
```
---
### Zad.4

Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i nazwisko takiego pracownika

``` sql
SELECT TOP 1 FirstName + ' ' + LastName , COUNT(*)
FROM Employees E
    INNER JOIN Orders O ON O.EmployeeID = E.EmployeeID
GROUP BY FirstName + ' ' + LastName
ORDER BY COUNT(OrderID) DESC
```
---
### Zad.5

Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika

``` sql
SELECT TOP 1 FirstName + ' ' + LastName,
SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees
    INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = Orders.OrderID
WHERE year(Orders.ShippedDate) = 1997
GROUP BY FirstName + '' + LastName
ORDER BY 2 DESC;
```
---

## Slajd 4

### Zad.1

Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika Ogranicz wynik tylko do pracowników
a) którzy mają podwładnych
b) którzy nie mają podwładnych

``` sql
SELECT A.FirstName + ' ' + A.LastName,
SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees AS A
    INNER JOIN Employees AS B ON A.EmployeeID = B.ReportsTo
    INNER JOIN Orders ON Orders.EmployeeID = A.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = Orders.OrderID
GROUP BY A.FirstName + '' + A.LastName

SELECT A.FirstName + '' + A.LastName,
SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees AS A
    LEFT JOIN Employees AS B ON A.EmployeeID = B.ReportsTo
    INNER JOIN Orders ON Orders.EmployeeID = A.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = Orders.OrderID
WHERE B.ReportsTo IS NULL
GROUP BY A.FirstName + '' + A.LastName
```
