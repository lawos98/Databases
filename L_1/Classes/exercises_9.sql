/*   Wybierz nazwy i ceny produktów z kategorii ‘meat’ */
Select * from Categories where CategoryName LIKE '%Meat%'
Select ProductName,UnitPrice from Products where CategoryID=6
