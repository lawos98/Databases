-- czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak
-- to pokaż ich dane adresowe

Select Orders.CustomerID,YEar(OrderDate) from Customers left join Orders on Customers.CustomerID = Orders.CustomerID
where not (YEAR(OrderDate)=1997 or OrderDate is NULL)
