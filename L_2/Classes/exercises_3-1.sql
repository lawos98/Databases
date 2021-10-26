/*   Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5 */

Select OrderID,count(*) from [Order Details] group by OrderID having count(*)>5
