/* Podaj liczbę produktów o cenach mniejszych niż 10$ lub większych niż 20$ */

Select COUNT(*) from Products where UnitPrice<10 or UnitPrice>20
