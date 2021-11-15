-- Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza
-- northwind)



Select (E.LastName+' '+E.FirstName) as emp,(B.LastName+' '+B.FirstName)as boss from Employees as E
    inner join Employees B on E.ReportsTo=B.EmployeeID
