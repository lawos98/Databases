/*
Napisz polecenie, które wybiera numer czytelnika, karę oraz zapłaconą
karę dla wszystkich, którzy jeszcze nie zapłacili.
*/
select member_no,fine_assessed,fine_paid from loanhist where isnull(fine_assessed,0)> isnull(fine_paid,0) + isnull(fine_waived,0)
