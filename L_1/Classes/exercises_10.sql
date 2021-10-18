/*   Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’ */
Select * from Categories where CategoryName LIKE '%Meat%'
Select ProductName,UnitPrice from Products where CategoryID=6
