-- Wybierz nazwy i numery telefonów dostawców, dostarczających produkty, 
-- których aktualnie nie ma w magazynie

Select CompanyName,Phone from Suppliers INNER JOIN Products on Suppliers.SupplierID = Products.SupplierID where Products.UnitsInStock=0
