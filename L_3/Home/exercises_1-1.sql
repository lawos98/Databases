-- Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz
-- nazwę klienta.

SELECT O.OrderID, SUM(Quantity)
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY O.OrderID
