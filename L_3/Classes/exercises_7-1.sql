-- Podaj listę członków biblioteki mieszkających w Arizonie (AZ) którzy mają więcej 
-- niż dwoje dzieci zapisanych do biblioteki oraz takich którzy mieszkają w Kaliforni
-- (CA) i mają więcej niż troje dzieci zapisanych do bibliotek

SELECT a.member_no
FROM adult a
JOIN juvenile j ON a.member_no = j.adult_member_no
JOIN member m ON a.member_no = m.member_no
GROUP BY a.member_no, state
HAVING (state = 'AZ' AND COUNT(*) > 2) OR
       (state = 'CA' AND COUNT(*) > 3)
