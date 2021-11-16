-- Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza
-- northwind)



Select (E.LastName+' '+E.FirstName) from Employees as E
    left join Employees B on B.ReportsTo=E.EmployeeID where B.ReportsTo is null
    
