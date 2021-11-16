-- Napisz polecenie które zwraca o użytkownikach biblioteki o nr 250, 342, i 1675
-- (dla każdego użytkownika: nr, imię i nazwisko członka biblioteki), oraz informację
-- o zarezerwowanych książkach (isbn, data)


SELECT m.member_no, firstname, lastname, isbn, log_date
FROM member m
JOIN reservation r ON m.member_no = r.member_no
WHERE m.member_no IN (250, 342, 1675)
