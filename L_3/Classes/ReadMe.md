# Laboratorium 3 -Zadania

## Slajd 1

### Zad.1

Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy

``` sql
Select ProductName,UnitPrice,S.Address from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID
where UnitPrice BETWEEN 20 and 30
```

---
### Zad.2

Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’

``` sql
Select ProductName,UnitsInStock from Products JOIN Suppliers S on S.SupplierID = Products.SupplierID
where S.CompanyName='Tokyo Traders'
```

---
### Zad.3

czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe

``` sql
Select Orders.CustomerID,YEar(OrderDate) from Customers
      left join Orders on Customers.CustomerID = Orders.CustomerID
where not (YEAR(OrderDate)=1997 or OrderDate is NULL)
```
---
### Zad.4

Wybierz nazwy i numery telefonów dostawców, dostarczających produkty,których aktualnie nie ma w magazynie

``` sql
Select Orders.CustomerID,YEar(OrderDate) from Customers
      left join Orders on Customers.CustomerID = Orders.CustomerID
where not (YEAR(OrderDate)=1997 or OrderDate is NULL)
```

## Slajd 2

---
### Zad.1

Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko i data urodzenia dziecka.

``` sql
Select firstname,lastname,j.birth_date from member inner join juvenile j on member.member_no = j.member_no
```

---
### Zad.2

Napisz polecenie, które podaje tytuły aktualnie wypożyczonych książek

``` sql
Select t.title from loan inner join title t on loan.title_no = t.title_no group by t.title
```
---
### Zad.3

Podaj informacje o karach zapłaconych za przetrzymywanie książki o tytule ‘Tao Teh King’. Interesuje nas data oddania książki, ile dni była przetrzymywana i jaką zapłacono karę

``` sql
Select in_date,DATEDIFF(day,out_date,in_date),fine_paid from loanhist inner join title t on loanhist.title_no = t.title_no
where t.title='Tao Teh King'
```
---
### Zad.4

Napisz polecenie które podaje listę książek (mumery ISBN) zarezerwowanych przez osobę o nazwisku: Stephen A. Graff

``` sql
Select isbn,lastname from reservation inner join member m on reservation.member_no = m.member_no where
firstname = 'Stephen' and lastname ='Graff' and middleinitial='A'
```
---
## Slajd 3

---
### Zad.1

Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy, interesują nas tylko produkty z kategorii ‘Meat/Poultry’

``` sql
Select ProductName,UnitPrice,S.Address from Products
    inner JOIN Suppliers S on S.SupplierID = Products.SupplierID
    inner join Categories C on Products.CategoryID = C.CategoryID
where (UnitPrice BETWEEN 20 and 30) and C.CategoryName='Meat/Poultry'
```

---
### Zad.2

Wybierz nazwy i ceny produktów z kategorii ‘Confections’ dla każdego produktu podaj nazwę dostawcy.

``` sql
Select ProductName,UnitPrice,S.CompanyName from Products
    inner JOIN Suppliers S on S.SupplierID = Products.SupplierID
    inner join Categories C on Products.CategoryID = C.CategoryID
where C.CategoryName='Confections'
```
---
### Zad.3

Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma ‘United Package’

``` sql
Select Customers.CompanyName,Customers.Phone from Customers
    inner join Orders O on Customers.CustomerID = O.CustomerID
    inner join Shippers S on O.ShipVia = S.ShipperID
where YEAR(O.ShippedDate)=1997 and S.CompanyName='United Package'
```
---
### Zad.4

Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii ‘Confections’

``` sql
Select CompanyName,Phone from Customers
    left join Orders O on Customers.CustomerID = O.CustomerID
    left join [Order Details] OD on O.OrderID = OD.OrderID
    left join Products P on P.ProductID=OD.ProductID
    left join Categories C on P.CategoryID = C.CategoryID
where C.CategoryName='Confections'
group by CompanyName, Phone
```
---
## Slajd 4

---
### Zad.1

Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko, data urodzenia dziecka i adres zamieszkania dziecka.

``` sql
Select firstname,lastname,j.birth_date,(a.city+' '+a.street+' '+a.zip)
from member
    inner join juvenile j on member.member_no = j.member_no
    inner join adult a on a.member_no = j.adult_member_no
```

---
### Zad.2

Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko, data urodzenia dziecka, adres zamieszkania dziecka oraz imię i nazwisko rodzica.

``` sql
Select (kids.lastname+' '+kids.firstname)as child,
       (parent.lastname+' '+parent.firstname)as parent,
       j.birth_date,(a.city+' '+a.street+' '+a.zip) as Adress
from member kids
    inner join juvenile j on kids.member_no=j.member_no
    inner join adult a on a.member_no = j.adult_member_no
    inner join member parent on parent.member_no=j.adult_member_no
```
---
## Slajd 5

---
### Zad.1

Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza northwind)

``` sql
Select (E.LastName+' '+E.FirstName) as emp,(B.LastName+' '+B.FirstName)as boss from Employees as E
    inner join Employees B on E.ReportsTo=B.EmployeeID
```

---
### Zad.2

Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza northwind)

``` sql
Select (E.LastName+' '+E.FirstName) from Employees as E
    left join Employees B on B.ReportsTo=E.EmployeeID where B.ReportsTo is null
```
---
### Zad.3

Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci urodzone przed 1 stycznia 1996

``` sql
Select (a.city+' '+a.street+' '+a.zip) as A
from member kids
    inner join juvenile j on kids.member_no=j.member_no
    inner join adult a on a.member_no = j.adult_member_no
    inner join member parent on parent.member_no=j.adult_member_no
where YEAR(j.birth_date)<1996
```

---
### Zad.4

Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci urodzone przed 1 stycznia 1996. Interesują nas tylko adresy takich członków biblioteki, którzy aktualnie nie przetrzymują książek.

``` sql
Select (a.city+' '+a.street+' '+a.zip),j.birth_date as A
from member kids
    join juvenile j on kids.member_no=j.member_no
    join adult a on a.member_no = j.adult_member_no
    join member parent on parent.member_no=j.adult_member_no
    left join loan on parent.member_no=loan.member_no
where YEAR(j.birth_date)<1996 and (loan.member_no is null or due_date>GETDATE())
```
---
## Slajd 6

---
### Zad.1

Napisz polecenie które zwraca imię i nazwisko (jako pojedynczą kolumnę – name), oraz informacje o adresie: ulica, miasto, stan kod (jako pojedynczą kolumnę – address) dla wszystkich dorosłych członków biblioteki

``` sql
SELECT CONCAT(firstname,' ', lastname) AS name,
       CONCAT(street,' ', city,' ', zip,' ', state) AS address
FROM adult
JOIN member m ON adult.member_no = m.member_no
```

---
### Zad.2

Napisz polecenie, które zwraca: isbn, copy_no, on_loan, title, translation, cover, dla książek o isbn 1, 500 i 1000. Wynik posortuj wg ISBN

``` sql
Select i.isbn,c.copy_no,c.on_loan,t.title,i.translation,i.cover from title t
    inner join item i on t.title_no = i.title_no
    inner join copy c on i.isbn = c.isbn
where i.isbn in (1,500,1000)
order by i.isbn
```
---
### Zad.3

Napisz polecenie które zwraca o użytkownikach biblioteki o nr 250, 342, i 1675 (dla każdego użytkownika: nr, imię i nazwisko członka biblioteki), oraz informację o zarezerwowanych książkach (isbn, data)

``` sql
SELECT m.member_no, firstname, lastname, isbn, log_date
FROM member m
JOIN reservation r ON m.member_no = r.member_no
WHERE m.member_no IN (250, 342, 1675)
```

---
### Zad.4

Dodaj listę członków biblioteki mieszkających w Arizonie (AZ) mają więcej niż dwoje dzieci zapisanych do biblioteki

``` sql
SELECT a.member_no
FROM adult a
    JOIN juvenile j ON a.member_no = j.adult_member_no
    JOIN member m ON a.member_no = m.member_no
WHERE state = 'AZ'
GROUP BY a.member_no
HAVING COUNT(*) > 2
```
---
## Slajd 7

---
### Zad.1

Podaj listę członków biblioteki mieszkających w Arizonie (AZ) którzy mają więcej niż dwoje dzieci zapisanych do biblioteki oraz takich którzy mieszkają w Kaliforni (CA) i mają więcej niż troje dzieci zapisanych do bibliotek

``` sql
SELECT a.member_no
FROM adult a
JOIN juvenile j ON a.member_no = j.adult_member_no
JOIN member m ON a.member_no = m.member_no
GROUP BY a.member_no, state
HAVING (state = 'AZ' AND COUNT(*) > 2) OR
       (state = 'CA' AND COUNT(*) > 3)
```

---
