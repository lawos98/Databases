/*  . Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę"
przewożonych przez niego zamówień w latach o 1996 do 1997*/

Select ShipVia,SUM(Freight) as "Oplata za przesylke"
from Orders where year(ShippedDate) BETWEEN 1996 and 1997 group by ShipVia
