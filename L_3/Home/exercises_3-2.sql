-- Który z przewoźników był najaktywniejszy (przewiózł największą liczbę
-- zamówień) w 1997r, podaj nazwę tego przewoźnika

SELECT TOP 1 CompanyName, COUNT(OrderID)
FROM Shippers S
    INNER JOIN Orders O ON O.ShipVia = S.ShipperID
WHERE year(O.ShippedDate) = 1997
GROUP BY CompanyName
ORDER BY 2 DESC
