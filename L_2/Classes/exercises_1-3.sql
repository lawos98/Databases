/* Podaj maksymalną i minimalną i średnią cenę produktu dla produktów o
produktach sprzedawanych w butelkach (‘bottle’) */

Select MIN(UnitPrice),MAX(UnitPrice),AVG(UnitPrice) from Products where QuantityPerUnit like '%bottle%'
