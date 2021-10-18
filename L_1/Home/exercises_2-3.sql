/*
Napisz polecenie, które:
-> generuje pojedynczą kolumnę, która zawiera kolumny: imię członka biblioteki,
inicjał drugiego imienia i nazwisko dla wszystkich członków biblioteki, którzy nazywają się Anderson
-> nazwij tak powstałą kolumnę „email_name”
-> zmodyfikuj polecenie, tak by zwróciło „listę proponowanych loginów e-mail” utworzonych przez połączenie
imienia członka biblioteki, z inicjałem drugiego imienia i pierwszymi dwoma literami nazwiska (wszystko małymi literami).
-> wykorzystaj funkcję SUBSTRING do uzyskania części kolumny znakowej oraz LOWER do zwrócenia wyniku małymi literami
-> wykorzystaj operator (+) do połączenia stringów.

*/
Select firstname+' '+middleinitial+'. '+lastname as 'email_name' from member where lastname='Anderson'
select lower(firstname+middleinitial+substring(lastname,1,2)) as 'email_name' from member where lastname = 'Anderson'
