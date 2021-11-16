-- Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o
-- największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika

SELECT TOP 1 FirstName + ' ' + LastName,
SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees
    INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = Orders.OrderID
WHERE year(Orders.ShippedDate) = 1997
GROUP BY FirstName + '' + LastName
ORDER BY 2 DESC;
