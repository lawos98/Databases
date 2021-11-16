-- Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez
-- klientów jednostek towarów z tek kategorii

SELECT CategoryName, SUM(Quantity)
FROM Categories C
    INNER JOIN Products P ON P.CategoryID = C.CategoryID
    INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY CategoryName
