# Dodatkowe przygotowanie do Kolokwium

## 2015/2016

### Zad.1

Wyświetl imię, nazwisko, dane adresowe oraz ilość wypożyczonych książek dla każdego członka biblioteki. Ilość wypożyczonych książek nie może być nullem, co najwyżej zerem dodatkowo informację, czy dany członek jest dzieckiem


``` sql
Select (firstname+' '+lastname) as name,
        isnull(COUNT(l.title_no),0)as Count,
        (a.street+' '+a.city+' '+a.state)as Adress,
        'Adult' as Age from member m
    inner join loan l on m.member_no = l.member_no
    inner join adult a on m.member_no = a.member_no
group by (firstname+' '+lastname),(a.street+' '+a.city+' '+a.state)
union
Select (firstname+' '+lastname) as name,
        isnull(COUNT(l.title_no),0)as Count,
        (a.street+' '+a.city+' '+a.state) as Adress ,
        'Kid' as Age from member m
    inner join loan l on m.member_no = l.member_no
    inner join juvenile j on m.member_no = j.member_no
    inner join adult a on j.adult_member_no = a.member_no
group by (firstname+' '+lastname),(a.street+' '+a.city+' '+a.state)
```
---

### Zad.2

Wyświetl imiona i nazwiska osób, które nigdy nie wypożyczyły żadnej książki

``` sql
Select (firstname+' '+lastname) as name from member
except
SELECT (firstname+' '+lastname) as name from member
    inner join loanhist l on member.member_no = l.member_no
```

``` sql
SELECT DISTINCT (firstname+' '+lastname) as name from member m1
where not exists(Select * from member m2 where m1.firstname=m2.firstname and m1.lastname=m2.lastname and  
                exists(Select l.member_no from loanhist l where l.member_no=m2.member_no))
```
---

### Zad.3

Wyświetl numery zamówień, których cena dostawy była większa niż średnia cena za przesyłkę w tym roku

``` sql
Select O.OrderID from Orders O where O.Freight>(
    Select AVG(O2.Freight) from Orders O2 where YEAR(O2.ShippedDate)=YEAR(O.ShippedDate))
```

### Zad.4

Wyświetl ile każdy z przewoźników miał dostać wynagrodzenia w poszczególnych latach i miesiącach.

``` sql
Select S.CompanyName,Year(O.OrderDate) as YEAR,MONTH(O.OrderDate) as MONTH,SUM(Freight) as Total from Shippers S
    inner join Orders O on S.ShipperID = O.ShipVia
group by S.CompanyName,Year(O.OrderDate),MONTH(O.OrderDate)
```

### Zad.5

Wypisać ceny produktów, których cena jednostkowa jest nie mniejsza od średniej ceny produktów tej samej kategorii

``` sql
Select P.ProductName,P.UnitPrice from Products P
where P.UnitPrice<(Select AVG(P2.UnitPrice) from Products P2 where P2.CategoryID=P.CategoryID)
```

### Zad.5

Wybierz nazwy i numery telefonów klientów, którzy nie kupili żadnego produktu z kategorii ‘Confections’. Rozwiązać używając mechanizmu podzapytań.

``` sql
Select C.CompanyName,C.Phone from Customers C where C.CustomerID not in (
    Select O.CustomerID from Orders O where O.OrderID in(
        Select OD.OrderID from [Order Details] OD where OD.ProductID in(
            Select P.ProductID from Products P where P.CategoryID in(
                Select Ca.CategoryID from Categories Ca where Ca.CategoryName='Confections'))))
```
