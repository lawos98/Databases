-- Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki
-- dostarczała firma ‘United Package’

Select Customers.CompanyName,Customers.Phone from Customers inner join Orders O on Customers.CustomerID = O.CustomerID inner join Shippers S on O.ShipVia = S.ShipperID
where YEAR(O.ShippedDate)=1997 and S.CompanyName='United Package'
