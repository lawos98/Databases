-- Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i
-- nazwisko takiego pracownika

SELECT TOP 1 FirstName + ' ' + LastName , COUNT(*)
FROM Employees E
    INNER JOIN Orders O ON O.EmployeeID = E.EmployeeID
GROUP BY FirstName + ' ' + LastName
ORDER BY COUNT(OrderID) DESC
