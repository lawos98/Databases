/* Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych
10 wierszy. */

Select top 10 OrderID,SUM(UnitPrice) from [Order Details] GROUP BY OrderID order by SUM(UnitPrice) desc
