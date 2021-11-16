-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
-- obsłużonych przez tego pracownika
-- – Ogranicz wynik tylko do pracowników
-- a) którzy mają podwładnych
-- b) którzy nie mają podwładnych

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
