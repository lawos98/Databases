/* Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20$ */

Select MAX(UnitPrice) from Products where UnitPrice<20
