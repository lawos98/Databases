-- Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez
-- klientów jednostek towarów z tek kategorii.

SELECT CategoryName, SUM(Od.UnitPrice*Quantity*(1-Discount)+O.Freight)
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
    inner join Orders O on OD.OrderID = O.OrderID
GROUP BY CategoryName
