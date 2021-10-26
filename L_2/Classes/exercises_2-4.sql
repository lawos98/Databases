/*   Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów
(przewoźników) */

Select OrderID,MAX(UnitPrice),MIN(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID
