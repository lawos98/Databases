/*  . Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę"
przewożonych przez niego zamówień w latach o 1996 do 1997*/

Select EmployeeID,COUNT(*) from Orders group by EmployeeID
