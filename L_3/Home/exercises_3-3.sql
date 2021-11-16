-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
-- obsłużonych przez tego pracownika

SELECT FirstName + ' ' + LastName, SUM(OD.UnitPrice*Quantity*(1-Discount))
FROM Employees E
    INNER JOIN Orders O ON O.EmployeeID = E.EmployeeID
    INNER JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
GROUP BY FirstName + ' ' + LastName;
