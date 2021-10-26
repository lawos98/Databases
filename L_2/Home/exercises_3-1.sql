/*  Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień*/

Select EmployeeID,COUNT(*) from Orders group by EmployeeID
