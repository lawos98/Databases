-- Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej
-- pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy,
-- interesują nas tylko produkty z kategorii ‘Meat/Poultry’

Select ProductName,UnitPrice,S.Address from Products inner JOIN Suppliers S on S.SupplierID = Products.SupplierID inner join Categories C on Products.CategoryID = C.CategoryID where (UnitPrice BETWEEN 20 and 30) and C.CategoryName='Meat/Poultry'
