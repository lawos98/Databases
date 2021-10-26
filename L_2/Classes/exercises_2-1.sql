/* Podaj maksymalną cenę zamawianego produktu dla każdego zamówieni */

Select OrderID,MAX(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
