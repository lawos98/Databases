-- Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko
-- pracownika obsługującego zamówienie

SELECT O.OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS 'Wartosc',
C.CompanyName, E.FirstName + ' ' + E.LastName AS 'Pracownik'
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY O.OrderID, C.CompanyName, E.FirstName + ' ' + E.LastName
HAVING SUM(Quantity) > 250
