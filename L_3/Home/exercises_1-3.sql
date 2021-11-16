-- Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę
-- klienta.

SELECT O.OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS 'Price',
C.CompanyName
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
GROUP BY O.OrderID, C.CompanyName
