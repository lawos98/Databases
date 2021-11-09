-- Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza 
-- library). Interesuje nas imię, nazwisko, data urodzenia dziecka i adres
-- zamieszkania dziecka.


Select firstname,lastname,j.birth_date,(a.city+' '+a.street+' '+a.zip) from member inner join juvenile j on member.member_no = j.member_no inner join adult a on a.member_no = j.adult_member_no
