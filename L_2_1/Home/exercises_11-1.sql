/*
Napisz polecenie, które wybiera title i title_no z tablicy title.
-> Wynikiem powinna być pojedyncza kolumna o formacie jak w przykładzie poniżej:
  The title is: Poems, title number 7

-> Czyli zapytanie powinno zwracać pojedynczą kolumnę w oparciu o wyrażenie, które łączy 4 elementy:
  stała znakowa ‘The title is:’
  wartość kolumny title
  stała znakowa ‘title number’
  wartość kolumny title_no

*/
select CONCAT('The title is: ',title,', title number: ',title_no) as 'Title and number' from title

Select MAX(UnitPrice) from Products where UnitPrice<20

Select MIN(UnitPrice),MAX(UnitPrice),AVG(UnitPrice) from Products where QuantityPerUnit like '%bottle%'

SELECT * from Products where UnitPrice>(Select AVG(UnitPrice) from Products)

Select UnitPrice from [Order Details] where OrderID=10250


Select OrderID,MAX(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID

Select ProductID,Max(UnitPrice) as 'Max_Price' from Products GROUP BY ProductID Order By Max_Price

Select OrderID,MAX(UnitPrice),MIN(UnitPrice) as 'Max_Price' from [Order Details] GROUP BY OrderID

Select SupplierID,COUNT(*) from Suppliers GROUP BY SupplierID

Select top 1 ShipVia,COUNT(*) as Unit from Orders where year(ShippedDate)=1997
group by ShipVia order by Unit desc
