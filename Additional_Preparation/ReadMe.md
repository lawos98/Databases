# Dodatkowe przygotowanie do Kolokwium

## 2015/2016

##### Zad.1

Wyświetl imię, nazwisko, dane adresowe oraz ilość wypożyczonych książek dla każdego członka biblioteki. Ilość wypożyczonych książek nie może być nullem, co najwyżej zerem dodatkowo informację, czy dany członek jest dzieckiem


``` sql
Select (firstname+' '+lastname) as name,isnull(COUNT(l.title_no),0),(a.street+' '+a.city+' '+a.state),'Adult' as Adress from member m
    inner join loan l on m.member_no = l.member_no
    inner join adult a on m.member_no = a.member_no
group by (firstname+' '+lastname),(a.street+' '+a.city+' '+a.state)
union
Select (firstname+' '+lastname) as name,isnull(COUNT(l.title_no),0),(a.street+' '+a.city+' '+a.state),'Kid' as Adress from member m
    inner join loan l on m.member_no = l.member_no
    inner join juvenile j on m.member_no = j.member_no
    inner join adult a on j.adult_member_no = a.member_no
group by (firstname+' '+lastname),(a.street+' '+a.city+' '+a.state)
```
---
