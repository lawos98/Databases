/*   Wyświetl klientów dla których w 1998 roku zrealizowano więcej niż 8 zamówień
(wyniki posortuj malejąco wg łącznej kwoty za dostarczenie zamówień dla
każdego z klientów */

Select CustomerID,Count(*) as resualt from Orders where OrderDate>'1998' GROUP BY CustomerID  order by resualt desc
