-- Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii
-- ‘Confections’

Select CompanyName,Phone from Customers
    left join Orders O on Customers.CustomerID = O.CustomerID
    left join [Order Details] OD on O.OrderID = OD.OrderID
    left join Products P on P.ProductID=OD.ProductID
    left join Categories C on P.CategoryID = C.CategoryID
where C.CategoryName='Confections'
group by CompanyName, Phone
