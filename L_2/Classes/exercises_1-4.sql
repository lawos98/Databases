/* Wypisz informację o wszystkich produktach o cenie powyżej średniej */

SELECT * from Products where UnitPrice>(Select AVG(UnitPrice) from Products)
