-- Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których
-- łączna liczbę zamówionych jednostek jest większa niż 250

SELECT O.OrderID, SUM(Quantity)
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY O.OrderID
having sum(Quantity)>250;
