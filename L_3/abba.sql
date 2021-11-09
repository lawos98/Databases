Select ProductName,UnitPrice,S.Address from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID where UnitPrice BETWEEN 20 and 30

Select ProductName,UnitsInStock from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID where S.CompanyName='Tokyo Traders'

Select Orders.CustomerID,YEar(OrderDate) from Customers left JOIN Orders on Customers.CustomerID = Orders.CustomerID
and YEAR(OrderDate)=1997 where YEAR(OrderDate) is null

Select isbn,lastname from reservation inner join member m on reservation.member_no = m.member_no where
firstname = 'Stephen' and lastname ='Graff' and middleinitial='A'
