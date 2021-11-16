 -- Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r

 SELECT CompanyName, COUNT(OrderID)
 FROM Shippers S
     INNER JOIN Orders O ON O.ShipVia = S.ShipperID
 WHERE year(O.ShippedDate) = 1997
 GROUP BY CompanyName
