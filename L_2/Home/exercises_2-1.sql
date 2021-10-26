/* Podaj liczbę zamówionych jednostek produktów dla produktów, dla których
productid < 3 */

Select ProductID,Sum(Quantity) from [Order Details] where ProductID<3 group by ProductID
