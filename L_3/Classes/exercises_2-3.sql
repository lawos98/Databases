-- Podaj informacje o karach zapłaconych za przetrzymywanie książki o tytule ‘Tao
-- Teh King’. Interesuje nas data oddania książki, ile dni była przetrzymywana i jaką
-- zapłacono karę

Select in_date,DATEDIFF(day,out_date,in_date),fine_paid from loanhist inner join title t on loanhist.title_no = t.title_no where t.title='Tao Teh King'
