/*
Napisz polecenie, które wybiera numer tytułu i tytuł dla wszystkich rekordów
zawierających string „adventures” gdzieś w tytule.
*/
select title_no,title from title where title like '%adventures%'
