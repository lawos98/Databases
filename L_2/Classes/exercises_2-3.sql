/*   Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego
zamówienia */

Select OrderID,MAX(UnitPrice),MIN(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
