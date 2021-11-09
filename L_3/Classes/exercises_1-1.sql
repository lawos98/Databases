-- Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej
-- pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy

Select ProductName,UnitPrice,S.Address from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID where UnitPrice BETWEEN 20 and 30
