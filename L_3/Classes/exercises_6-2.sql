-- Napisz polecenie, które zwraca: isbn, copy_no, on_loan, title, translation, cover,
-- dla książek o isbn 1, 500 i 1000. Wynik posortuj wg ISBN


Select i.isbn,c.copy_no,c.on_loan,t.title,i.translation,i.cover from title t
    inner join item i on t.title_no = i.title_no
    inner join copy c on i.isbn = c.isbn
where i.isbn in (1,500,1000)
order by i.isbn
