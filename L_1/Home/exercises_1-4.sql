/*
Napisz polecenie select, za pomocą którego uzyskasz numer książki i autora
dla wszystkich książek, których autorem jest Charles Dickens lub Jane Austen
*/
select title_no,author from title where author='Charles Dickens' or author='Jane Austen'
