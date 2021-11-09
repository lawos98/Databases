-- Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza
-- library). Interesuje nas imię, nazwisko i data urodzenia dziecka.

Select firstname,lastname,j.birth_date from member inner join juvenile j on member.member_no = j.member_no
