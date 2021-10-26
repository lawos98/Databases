/* Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę 
zamówionych jednostek produktu dla wszystkich produktów */

Select ProductID,Sum(Quantity) from [Order Details] group by ProductID order by ProductID
