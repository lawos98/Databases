/* Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których
łączna liczba zamawianych jednostek produktów jest > 250 */

Select OrderID,Sum(CONVERT(money,UnitPrice*Quantity*(1-Discount))) from [Order Details] group by OrderID having Sum(Quantity)>250
