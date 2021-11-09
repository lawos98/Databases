 -- Napisz polecenie, które podaje tytuły aktualnie wypożyczonych książek

Select t.title from loan inner join title t on loan.title_no = t.title_no group by t.title
