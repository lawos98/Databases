-- Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę

SELECT CompanyName, COUNT(OrderID)
FROM Shippers S
    INNER JOIN Orders O ON O.ShipVia = S.ShipperID
WHERE year(O.ShippedDate) = 1997
GROUP BY CompanyName
