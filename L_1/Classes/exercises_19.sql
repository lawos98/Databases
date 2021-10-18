/*
Napisz instrukcję select tak aby wybrać numer zlecenia, datę zamówienia, numer klienta dla wszystkich
niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna
*/
Select * from Orders where (ShippedDate is NULL or ShippedDate>getdate()) and ShipCountry='Argentina'
