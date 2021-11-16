-- Napisz polecenie które zwraca imię i nazwisko (jako pojedynczą kolumnę –
-- name), oraz informacje o adresie: ulica, miasto, stan kod (jako pojedynczą
-- kolumnę – address) dla wszystkich dorosłych członków biblioteki



SELECT CONCAT(firstname,' ', lastname) AS name,
       CONCAT(street,' ', city,' ', zip,' ', state) AS address
FROM adult
JOIN member m ON adult.member_no = m.member_no
