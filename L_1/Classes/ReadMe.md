# Laboratorium 1 -Zadania

## Zad.1

Wybierz nazwy i adresy wszystkich klientów.

``` sql
Select CompanyName,Address from Customers
```

## Zad.2

Wybierz nazwiska i numery telefonów pracowników.

``` sql
Select LastName,HomePhone from Employees
```
---
## Zad.3

Wybierz nazwy i ceny produktów.

``` sql
Select ProductName,UnitPrice from Products
```

---

## Zad.4

Pokaż nazwy i opisy wszystkich kategorii produktów.

``` sql
Select CategoryName,Description from Categories
```

---
## Zad.5

Pokaż nazwy i adresy stron www dostawców.

``` sql
Select CompanyName,HomePage from Suppliers
```
---
## Zad.6

Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie.

``` sql
Select CompanyName,Address from Customers where City='London'
```
---
## Zad.7

Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii.

``` sql
Select CompanyName,Address from Customers where Country='France' or Country='Spain'
```
---
## Zad.8

Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20 a 30.

``` sql
Select ProductName,UnitPrice from Products where UnitPrice>20 and UnitPrice<30
```
---
## Zad.9

Wybierz nazwy i ceny produktów z kategorii ‘meat’.

``` sql
Select * from Categories where CategoryName LIKE '%Meat%'
Select ProductName,UnitPrice from Products where CategoryID=6
```
---
## Zad.10

Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’.

``` sql
Select SupplierID,CompanyName from Suppliers where CompanyName='Tokyo Traders'
Select ProductName,UnitsInStock from Products where SupplierID=4
```
---
## Zad.11

Wybierz nazwy produktów których nie ma w magazynie.

``` sql
Select ProductName from Products where UnitsInStock=0
```
---
## Zad.12

Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’)

``` sql
Select * from Products where QuantityPerUnit like '%bottle%'
```
---
## Zad.13

Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę B lub L

``` sql
Select Title from Employees where LastName like '[BL]%'
```
---
## Zad.14

Znajdź nazwy kategorii, które w opisie zawierają przecinek

``` sql
Select CategoryName from Categories where Description like '%,%'
```
---
## Zad.15

Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu słowo ‘Store’

``` sql
Select * from Customers where CompanyName like '%store%'
```
---
## Zad.16

Szukamy informacji o produktach o cenach mniejszych niż 10 lub większych niż 20

``` sql
Select * from Products where UnitPrice not BETWEEN 10 and 20
```
---
## Zad.17

Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20.00 a 30.00

``` sql
Select ProductName,UnitPrice from Products where UnitPrice not BETWEEN 20 and 30
```
---
## Zad.18

Wybierz nazwy i kraje wszystkich klientów mających siedziby w Japonii (Japan) lub we Włoszech (Italy).

``` sql
Select CompanyName,Country from Customers where Country='Japan' or Country='Italy'
```
---
## Zad.19

Napisz instrukcję select tak aby wybrać numer zlecenia, datę zamówienia, numer klienta dla wszystkich niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna

``` sql
Select * from Orders where (ShippedDate is NULL or ShippedDate>getdate()) and ShipCountry='Argentina'
```
---
## Zad.20

Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj według kraju, w ramach danego kraju nazwy firm posortuj alfabetycznie

``` sql
Select CompanyName,Country from Customers order by Country,CompanyName
```
---
## Zad.21

Wybierz informację o produktach (grupa, nazwa, cena), produkty posortuj wg grup a w grupach malejąco wg ceny

``` sql
Select CategoryID,ProductName,UnitPrice from Products order by CategoryID desc,UnitPrice
```
---
## Zad.22

Wybierz nazwy i kraje wszystkich klientów mających siedziby w Wielkiej Brytanii (UK) lub we Włoszech (Italy), wyniki posortuj według kraju, w ramach danego kraju nazwy firm posortuj alfabetycznie

``` sql
Select CompanyName,Country from Customers where Country='UK' or Country='Italy' order by Country,CompanyName
```
