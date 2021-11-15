-- Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci
-- urodzone przed 1 stycznia 1996. Interesują nas tylko adresy takich członków
-- biblioteki, którzy aktualnie nie przetrzymują książek.



Select (a.city+' '+a.street+' '+a.zip),j.birth_date as A
from member kids
    join juvenile j on kids.member_no=j.member_no
    join adult a on a.member_no = j.adult_member_no
    join member parent on parent.member_no=j.adult_member_no
    left join loan on parent.member_no=loan.member_no
where YEAR(j.birth_date)<1996 and (loan.member_no is null or due_date>GETDATE())
