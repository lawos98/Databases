/*
Napisz polecenie, które wybiera numer czytelnika i karę
dla tych czytelników, którzy mają kary między $8 a $9
*/
select member_no,fine_assessed from loanhist where fine_assessed between 8 and 9
