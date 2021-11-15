-- Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci
-- urodzone przed 1 stycznia 1996



Select (a.city+' '+a.street+' '+a.zip) as A
from member kids
    inner join juvenile j on kids.member_no=j.member_no
    inner join adult a on a.member_no = j.adult_member_no
    inner join member parent on parent.member_no=j.adult_member_no
where YEAR(j.birth_date)<1996
