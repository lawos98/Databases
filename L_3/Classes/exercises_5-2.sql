-- Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza
-- northwind)



Select (B.LastName+' '+B.FirstName)from Employees as E
    right join Employees B on E.ReportsTo=B.EmployeeID where E.ReportsTo is null
