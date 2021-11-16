-- Dodaj listę członków biblioteki mieszkających w Arizonie (AZ) mają więcej niż
-- dwoje dzieci zapisanych do biblioteki

SELECT a.member_no
FROM adult a
    JOIN juvenile j ON a.member_no = j.adult_member_no
    JOIN member m ON a.member_no = m.member_no
WHERE state = 'AZ'
GROUP BY a.member_no
HAVING COUNT(*) > 2
