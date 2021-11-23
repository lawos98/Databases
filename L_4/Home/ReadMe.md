# Laboratorium 4 -Zadania Domowe

## Slajd 1

##### Zad.1

Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package.

``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
WHERE C.CustomerID IN (
    SELECT DISTINCT O.CustomerID FROM Orders AS O WHERE year(O.ShippedDate) = 1997 AND O.ShipVia IN (
        SELECT DISTINCT S.ShipperID FROM Shippers AS S WHERE S.CompanyName = 'United Package'))
```

``` sql
SELECT DISTINCT Customers.CompanyName, Customers.Phone FROM Customers
    INNER JOIN Orders O on Customers.CustomerID = O.CustomerID
    INNER JOIN Shippers S on O.ShipVia = S.ShipperID
WHERE year(ShippedDate) = 1997 AND S.CompanyName = 'United Package'
```
---
##### Zad.2

Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii Confections.

``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
WHERE C.CustomerID IN (
 SELECT O.CustomerID FROM Orders AS O WHERE O.OrderID IN (
     SELECT OD.OrderID FROM [Order Details] AS OD WHERE OD.ProductID IN (
         SELECT P.ProductID FROM Products AS P WHERE P.CategoryID IN (
             SELECT CAT.CategoryID FROM Categories as CAT where CAT.CategoryName = 'Confections'))))
```

``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
    INNER JOIN Orders O on C.CustomerID = O.CustomerID
    INNER JOIN [Order Details] OD on OD.OrderID = O.OrderID
    INNER JOIN Products P on OD.ProductID = P.ProductID
    INNER JOIN Categories C2 on P.CategoryID = C2.CategoryID
WHERE C2.CategoryName = 'Confections';
```
---
##### Zad.3

Wybierz nazwy i numery telefonów klientów, którzy nie kupowali produktów z kategorii Confections.

``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
WHERE NOT EXISTS (
    SELECT O.CustomerID FROM Orders O WHERE O.CustomerID = C.CustomerID AND
        EXISTS(SELECT D.OrderID FROM [Order Details] D WHERE D.OrderID =O.OrderID AND
                EXISTS(SELECT P.ProductID FROM Products P WHERE P.ProductID =D.ProductID AND
                        EXISTS(SELECT C2.CategoryID FROM Categories C2
                        WHERE C2.CategoryID =P.CategoryID AND C2.CategoryName = 'Confections'))))
```

``` sql
SELECT DISTINCT Cus2.CompanyName, Cus2.Phone FROM Customers AS C
    INNER JOIN Orders O on C.CustomerID = O.CustomerID
    INNER JOIN [Order Details] OD on OD.OrderID = O.OrderID
    INNER JOIN Products P on OD.ProductID = P.ProductID
    INNER JOIN Categories C2 on P.CategoryID = C2.CategoryID and C2.CategoryName = 'Confections'
    right outer join Customers as cus2 on cus2.CustomerID = C.CustomerID where C.CustomerID is null;
```
---
## Slajd 2

##### Zad.1

Dla każdego produktu podaj maksymalną liczbę zamówionych jednostek.

``` sql
SELECT P.ProductName,
       (SELECT MAX(OD.Quantity)FROM [Order Details] OD WHERE OD.ProductID = P.ProductID) AS 'max'
FROM Products P
ORDER BY P.ProductName
```

``` sql
SELECT P.ProductName, MAX(OD.Quantity) as 'max' FROM Products P
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY P.ProductName ORDER BY P.ProductName
```
---
##### Zad.2

Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu.

``` sql
SELECT P.ProductName, P.UnitPrice FROM Products P
WHERE P.UnitPrice < (SELECT AVG(UnitPrice) FROM Products)
```
---
##### Zad.3

Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii.

``` sql
SELECT P.ProductID, P.ProductName FROM Products AS P
WHERE P.UnitPrice < (SELECT AVG(UnitPrice) FROM Products AS P2
                    WHERE P2.CategoryID = P.CategoryID)
```
---
## Slajd 3

##### Zad.1

Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich produktów oraz różnicę między ceną produktu a średnią ceną wszystkich produktów.

``` sql
SELECT P.ProductName, P.UnitPrice,(SELECT AVG(UnitPrice) FROM Products) AS 'averagePrice',
       P.UnitPrice - (SELECT AVG(UnitPrice) FROM Products) AS 'Difference'
FROM Products AS P
```
---
##### Zad.2

Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu a średnią ceną wszystkich produktów danej kategori

``` sql
SELECT (SELECT C.CategoryName FROM Categories AS C WHERE C.CategoryID = P.CategoryID) AS 'CategoryName',
       P.ProductName, P.UnitPrice,
       (SELECT AVG(P2.UnitPrice) FROM Products AS P2 WHERE P2.CategoryID = P.CategoryID) AS 'AveragePriceByCategory',
       P.UnitPrice - (SELECT AVG(P2.UnitPrice) FROM Products AS P2 WHERE P2.CategoryID = P.CategoryID) AS 'Difference'
FROM Products AS P
```
---
## Slajd 4

##### Zad.1

Podaj łączną wartość zamówienia o numerze 1025 (uwzględnij cenę za przesyłkę).

``` sql
SELECT round(O.Freight + (SELECT SUM(OD.UnitPrice*OD.Quantity*(1-OD.Discount))
                    FROM [Order Details] AS OD
                    WHERE OD.OrderID = O.OrderID GROUP BY OD.OrderID),2) as 'Total Price'
FROM Orders AS O
WHERE O.OrderID = 10250
```
---
##### Zad.2

Podaj łączną wartość zamówień każdego zamówienia (uwzględnij cenę za przesyłkę).


``` sql
SELECT OrderID,round(O.Freight + (SELECT SUM(OD.UnitPrice*OD.Quantity*(1-OD.Discount))
                    FROM [Order Details] AS OD
                    WHERE OD.OrderID = O.OrderID GROUP BY OD.OrderID),2) as 'Total Price'
FROM Orders AS O
```
---
##### Zad.3

Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresow

``` sql
SELECT CompanyName,C.Address FROM Customers AS C
WHERE C.CustomerID NOT IN (
    SELECT O.CustomerID FROM Orders AS O WHERE year(O.OrderDate) = 1997)
```

``` sql
SELECT Distinct CompanyName,Address from Customers
except
SELECT Distinct CompanyName,Address from Customers
    inner join Orders on Orders.CustomerID=Customers.CustomerID
where year(OrderDate)=1997
```
---
##### Zad.4

Podaj produkty kupowane przez więcej niż jednego klienta

``` sql
select distinct P.ProductName from Products P
     join [Order Details] OD on OD.ProductID = P.ProductID
     join Orders O on OD.OrderID = O.OrderID
 where exists
     (select ProductID from [Order Details] OD join Orders O2 on OD.OrderID = O2.OrderID
     where ProductID = P.ProductID and O2.CustomerID <> O.CustomerID)
```

``` sql
select P.ProductName from Products as P
    inner join [Order Details] OD on OD.ProductID = P.ProductID
    inner join Orders O on OD.OrderID = O.OrderID
group by P.ProductName
having count(*) > 1
```
---
## Slajd 5

##### Zad.1

Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika (przy obliczaniu wartości zamówień uwzględnij cenę za przesyłkę).

``` sql
SELECT E.FirstName + ' ' + E.LastName AS 'Name',
       round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
       from Orders AS O
           INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
       WHERE E.EmployeeID = O.EmployeeID)
           +
       (SELECT sum(O.Freight)
       from Orders as O
       WHERE O.EmployeeID = e.EmployeeID),2) as 'TotalPrice'
FROM Employees AS E
```
---
##### Zad.2

Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika).

``` sql
SELECT TOP 1 E.FirstName + ' ' + E.LastName as 'Name',
             round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
             from Orders AS O
                 INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
             WHERE E.EmployeeID = O.EmployeeID AND year(O.ShippedDate) = 1997),2) AS 'TotalPrice'
FROM Employees E
ORDER BY 2 DESC
```
---
##### Zad.3

Ogranicz wynik z pkt 1 tylko do pracowników

* którzy mają podwładnych

``` sql
SELECT E.FirstName + ' ' + E.LastName AS 'Name',
       round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
       from Orders AS O
           INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
       WHERE E.EmployeeID = O.EmployeeID)
           +
       (SELECT sum(O.Freight)
       from Orders as O
       WHERE O.EmployeeID = e.EmployeeID),2) as 'TotalPrice'
FROM Employees AS E
WHERE e.EmployeeID IN
      (select distinct a.EmployeeID
      from Employees as a
          inner join Employees as b on a.EmployeeID = b.ReportsTo)
```

* którzy nie mają podwładnych

``` sql
SELECT E.FirstName + ' ' + E.LastName AS 'Name',
       round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
       from Orders AS O
           INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
       WHERE E.EmployeeID = O.EmployeeID)
           +
       (SELECT sum(O.Freight)
       from Orders as O
       WHERE O.EmployeeID = e.EmployeeID),2) as 'TotalPrice'
FROM Employees AS E
WHERE e.EmployeeID IN
      (select distinct a.EmployeeID
      from Employees as a
          left join Employees as b on a.EmployeeID = b.ReportsTo)
```
---
##### Zad.4

Zmodyfikuj rozwiązania z pkt 3 tak aby dla pracowników pokazać jeszcze datę
ostatnio obsłużonego zamówienia

* którzy mają podwładnych

``` sql
SELECT E.FirstName + ' ' + E.LastName AS 'Name',
       round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
       from Orders AS O
           INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
       WHERE E.EmployeeID = O.EmployeeID)
           +
       (SELECT sum(O.Freight)
       from Orders as O
       WHERE O.EmployeeID = e.EmployeeID),2) as 'TotalPrice',
       (Select top 1 O.OrderDate from Orders O where O.EmployeeID=E.EmployeeID order by 1 desc) as 'LastOrder'
FROM Employees AS E
WHERE e.EmployeeID IN
      (select distinct a.EmployeeID
      from Employees as a
          left join Employees as b on a.EmployeeID = b.ReportsTo)
```

* którzy nie mają podwładnych

``` sql
SELECT E.FirstName + ' ' + E.LastName AS 'Name',
       round((SELECT SUM(OD.UnitPrice*OD.quantity*(1-OD.Discount))
       from Orders AS O
           INNER JOIN [Order Details] as OD ON O.OrderID = OD.OrderID
       WHERE E.EmployeeID = O.EmployeeID)
           +
       (SELECT sum(O.Freight)
       from Orders as O
       WHERE O.EmployeeID = e.EmployeeID),2) as 'TotalPrice',
       (Select top 1 O.OrderDate from Orders O where O.EmployeeID=E.EmployeeID order by 1 desc) as 'LastOrder'
FROM Employees AS E
WHERE e.EmployeeID IN
      (select distinct a.EmployeeID
      from Employees as a
          INNER join Employees as b on a.EmployeeID = b.ReportsTo)
```
