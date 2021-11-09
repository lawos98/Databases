-- Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii 
-- ‘Confections’


Select CompanyName,Phone from Customers
    left join Orders O on Customers.CustomerID = O.CustomerID
    left join [Order Details] on O.OrderID = [Order Details].OrderID
    left join Products on Products.ProductID=[Order Details].ProductID
    left join Categories C on Products.CategoryID = C.CategoryID
where C.CategoryName='Confections'
group by CompanyName, Phone
