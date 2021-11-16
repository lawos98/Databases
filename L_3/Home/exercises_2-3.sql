-- Posortuj wyniki w zapytaniu z poprzedniego punktu wg:
-- a) łącznej wartości zamówień
-- b) łącznej liczby zamówionych przez klientów jednostek towarów.

SELECT CategoryName, SUM(Od.UnitPrice*Quantity*(1-Discount))
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY CategoryName

order by 2

order by SUM(Quantity)
