-- Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza
-- library). Interesuje nas imię, nazwisko, data urodzenia dziecka, adres
-- zamieszkania dziecka oraz imię i nazwisko rodzica.



Select (kids.lastname+' '+kids.firstname)as child,
       (parent.lastname+' '+parent.firstname)as parent,
       j.birth_date,(a.city+' '+a.street+' '+a.zip) as Adress
from member kids
    inner join juvenile j on kids.member_no=j.member_no
    inner join adult a on a.member_no = j.adult_member_no
    inner join member parent on parent.member_no=j.adult_member_no
