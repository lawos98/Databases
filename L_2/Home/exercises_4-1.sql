/*  Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z
podziałem na lata i miesiące*/

Select EmployeeID,YEAR(OrderDate),MONTH(OrderDate),COUNT(*) from Orders GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)
