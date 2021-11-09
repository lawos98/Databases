-- Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza
-- library). Interesuje nas imię, nazwisko, data urodzenia dziecka, adres
-- zamieszkania dziecka oraz imię i nazwisko rodzica.



Select (m1.lastname+' '+m1.firstname)as parent,(m2.lastname+' '+m2.firstname)as child,j.birth_date,(a.city+' '+a.street+' '+a.zip) from member m1 cross join member m2 left join juvenile j on m2.member_no=j.member_no inner join adult a on a.member_no = j.adult_member_no where adult_member_no=m1.member_no
