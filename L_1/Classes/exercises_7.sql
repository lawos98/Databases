/*   Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii */
Select CompanyName,Address from Customers where Country='France' or Country='Spain'
