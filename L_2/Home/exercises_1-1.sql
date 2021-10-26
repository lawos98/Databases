/* Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia i
zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży). */

Select OrderID,SUM(UnitPrice) from [Order Details] GROUP BY OrderID order by SUM(UnitPrice) desc
