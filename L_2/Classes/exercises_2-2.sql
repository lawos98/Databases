/*  Posortuj zamówienia wg maksymalnej ceny produktu */

Select ProductID,Max(UnitPrice) as 'Max_Price' from Products GROUP BY ProductID Order By Max_Price
