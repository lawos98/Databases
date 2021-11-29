# Laboratorium 1 -Zadania Domowe

## Slajd 1

### Zad.1

Napisz polecenie select, za pomocą którego uzyskasz tytuł i numer książki

``` sql
Select title,title_no from title
```

---
### Zad.2

Napisz polecenie, które wybiera tytuł o numerze 10

``` sql
Select title,title_no from title where title_no=10
```

---
### Zad.3

Napisz polecenie, które wybiera numer czytelnika i karę dla tych czytelników, którzy mają kary między $8 a $9

``` sql
select member_no,fine_assessed from loanhist where fine_assessed between 8 and 9
```

---
### Zad.4

Napisz polecenie select, za pomocą którego uzyskasz numer książki i autora dla wszystkich książek, których autorem jest Charles Dickens lub Jane Austen

``` sql
select title_no,author from title where author='Charles Dickens' or author='Jane Austen'
```
---
### Zad.5

Napisz polecenie, które wybiera numer tytułu i tytuł dla wszystkich rekordów zawierających string „adventures” gdzieś w tytule.

``` sql
select title_no,title from title where title like '%adventures%'
```
---
### Zad.6

Napisz polecenie, które wybiera numer czytelnika, karę oraz zapłaconą karę dla wszystkich, którzy jeszcze nie zapłacili.

``` sql
select member_no,fine_assessed,fine_paid from loanhist where isnull(fine_assessed,0)> isnull(fine_paid,0) + isnull(fine_waived,0)
```
---
### Zad.7

Napisz polecenie, które wybiera wszystkie unikalne pary miast i stanów z tablicy adult.

``` sql
Select distinct city,state from adult
```
---
## Slajd 2

### Zad.1

Napisz polecenie, które wybiera wszystkie tytuły z tablicy title i wyświetla je w porządku alfabetycznym.

``` sql
Select title from title order by title
```
---
### Zad.2

Napisz polecenie, które:
-> wybiera numer członka biblioteki, isbn książki i wartość naliczonej kary
dla wszystkich wypożyczeń, dla których naliczono karę
-> stwórz kolumnę wyliczeniową zawierającą podwojoną wartość kolumny fine_assessed
-> stwórz alias ‘double fine’ dla tej kolumny

``` sql
Select member_no,isbn,fine_assessed,fine_assessed*2 as 'double fine' from loanhist where isnull(fine_assessed,0)>0
```
---
### Zad.3

Napisz polecenie, które:
-> generuje pojedynczą kolumnę, która zawiera kolumny: imię członka biblioteki,
inicjał drugiego imienia i nazwisko dla wszystkich członków biblioteki, którzy nazywają się Anderson
-> nazwij tak powstałą kolumnę „email_name”
-> zmodyfikuj polecenie, tak by zwróciło „listę proponowanych loginów e-mail” utworzonych przez połączenie
imienia członka biblioteki, z inicjałem drugiego imienia i pierwszymi dwoma literami nazwiska (wszystko małymi literami).
-> wykorzystaj funkcję SUBSTRING do uzyskania części kolumny znakowej oraz LOWER do zwrócenia wyniku małymi literami
-> wykorzystaj operator (+) do połączenia stringów.


``` sql
Select firstname+' '+middleinitial+'. '+lastname as 'email_name' from member where lastname='Anderson'
select lower(firstname+middleinitial+substring(lastname,1,2)) as 'email_name' from member where lastname = 'Anderson'
```
---
### Zad.4

Napisz polecenie, które:
-> generuje pojedynczą kolumnę, która zawiera kolumny: imię członka biblioteki,
inicjał drugiego imienia i nazwisko dla wszystkich członków biblioteki, którzy nazywają się Anderson
-> nazwij tak powstałą kolumnę „email_name”
-> zmodyfikuj polecenie, tak by zwróciło „listę proponowanych loginów e-mail” utworzonych przez połączenie
imienia członka biblioteki, z inicjałem drugiego imienia i pierwszymi dwoma literami nazwiska (wszystko małymi literami).
-> wykorzystaj funkcję SUBSTRING do uzyskania części kolumny znakowej oraz LOWER do zwrócenia wyniku małymi literami
-> wykorzystaj operator (+) do połączenia stringów.


``` sql
Select firstname+' '+middleinitial+'. '+lastname as 'email_name' from member where lastname='Anderson'
select lower(firstname+middleinitial+substring(lastname,1,2)) as 'email_name' from member where lastname = 'Anderson'
```
---
