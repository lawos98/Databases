/*  Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej
kategori*/

Select CategoryID,Min(UnitPrice),MAX(UnitPrice) from Products group by CategoryID
