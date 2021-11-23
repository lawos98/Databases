# Laboratorium 4

## Slajd 1

### Zad.1
Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package
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

### Zad.2
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

### Zad.3
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
