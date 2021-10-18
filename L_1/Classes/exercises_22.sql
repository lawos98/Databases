/*
Wybierz nazwy i kraje wszystkich klientów mających siedziby w Wielkiej Brytanii (UK)
lub we Włoszech (Italy), wyniki posortuj według kraju, w ramach danego
kraju nazwy firm posortuj alfabetycznie
*/
Select CompanyName,Country from Customers where Country='UK' or Country='Italy' order by Country,CompanyName
