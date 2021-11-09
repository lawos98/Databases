-- Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów
-- dostarczanych przez firmę ‘Tokyo Traders’

Select ProductName,UnitsInStock from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID where S.CompanyName='Tokyo Traders'
