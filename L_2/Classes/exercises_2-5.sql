/*   Który z spedytorów był najaktywniejszy w 1997 roku */

Select top 1 ShipVia,COUNT(*) as Unit from Orders where year(ShippedDate)=1997
group by ShipVia order by Unit desc
