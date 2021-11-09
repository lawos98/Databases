-- Wybierz nazwy i ceny produktów z kategorii ‘Confections’ dla każdego produktu
-- podaj nazwę dostawcy.

Select ProductName,UnitPrice,S.Address from Products inner JOIN Suppliers S on S.SupplierID = Products.SupplierID inner join Categories C on Products.CategoryID = C.CategoryID where C.CategoryName='Confections'
