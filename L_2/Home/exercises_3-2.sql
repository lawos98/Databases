/*  Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę"
przewożonych przez niego zamówień*/

Select ShipVia,SUM(Freight) as "Oplata za przesylke" from Orders group by ShipVia
