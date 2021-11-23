# Laboratorium 4

## Slajd 1

* 1. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package
``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
WHERE C.CustomerID IN (
    SELECT DISTINCT O.CustomerID FROM Orders AS O WHERE year(O.ShippedDate) = 1997 AND O.ShipVia IN (
        SELECT DISTINCT S.ShipperID FROM Shippers AS S WHERE S.CompanyName = 'United Package'
        )
 )
```

``` sql
SELECT DISTINCT Customers.CompanyName, Customers.Phone FROM Customers
    INNER JOIN Orders O on Customers.CustomerID = O.CustomerID
    INNER JOIN Shippers S on O.ShipVia = S.ShipperID
WHERE year(ShippedDate) = 1997 AND S.CompanyName = 'United Package'

```

* 2. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package
``` sql
SELECT DISTINCT C.CompanyName, C.Phone FROM Customers AS C
WHERE C.CustomerID IN (
    SELECT DISTINCT O.CustomerID FROM Orders AS O WHERE year(O.ShippedDate) = 1997 AND O.ShipVia IN (
        SELECT DISTINCT S.ShipperID FROM Shippers AS S WHERE S.CompanyName = 'United Package'
        )
 )
```
## Zadania do wykonania

1. Wykorzystaj definicje klas `Vector2d`, `MapDirection` oraz `MoveDirection` z laboratorium 2.
8. Utwórz klasę `Animal`, która:
   * określa początkową orientację zwierzęcia jako `NORTH`,
   * określa początkowe położenie zwierzęcia na mapie jako `Vector2d(2,2)` (przyjmij, że zwierzę znajduje się w
     pierwszej ćwiartce układu współrzędnych, a północ jest tożsama z kierunkiem wyznaczanym przez rosnące wartości na
     osi OY),
   * definiuje metodę `toString()`, która w reprezentacji łańcuchowej zawiera informacje o położeniu zwierzęcia (pozycję
     oraz orientację),
   * definiuje metodą `boolean isAt(Vector2d position)`, która zwraca prawdę, jeśli zwierzę znajduje się na pozycji `position`.
   * definuje swoje pola jako prywatne.
9. Utwórz lub zmodyfikuj klasę `World`, która w metodzie `main` stworzy zwierzę i wyświetli w konsoli jego pozycję.
10. Dodaj do klasy `Animal` metodę `move(MoveDirection direction)`, która:
   * Dla kierunków `RIGHT` i `LEFT` zmienia orientację zwierzęcia na mapie, np. kiedy zwierzę jest w pozycji `NORTH` a
     zmiana kierunku to `RIGHT` to orientacja zwierzęcia powinna wynosić `EAST`.
   * Dla kierunków `FORWARD` i `BACKWARD` zmienia pozycję zwierzęcia o 1 pole, uwzględniając jego orientację, np. kiedy zwierzę
     jest na pozycji `(2,2)` i jego orientacja to `NORTH`, to po ruchu `FORWARD` jego pozycja to `(2,3)`.
   * **Uniemożliwia** wyjechanie poza mapę, która ustalona jest od pozycji `(0,0)` do pozycji `(4,4)` (pięć na pięć pól). W
     sytuacji, w której zwierzę miałoby wyjść poza mapę, wywołanie `move` nie ma żadnego skutku.
5. W metodzie `main` dodaj wywołania, które przetestują poprawność implementacji, np. po ciągu wywołań: `RIGHT, FORWARD,
   FORWARD, FORWARD` pozycja zwierzęcia powinna wynosić `(4,2)` a orientacja `EAST`.
6. Utwórz klasę `OptionsParser` a w niej metodę `parse`, która:
   * akceptuje tablicę łańcuchów znaków,
   * zwraca tablicę kierunków ruchu `MoveDirection`,
   * zamienia łańcuchy `f` oraz `forward` na kierunek `MoveDirection.FORWARD`, `b` oraz `backward` na kierunek
     `MoveDirection.BACKWARD`, itd.
   * dla nieznanych kierunków nie umieszcza ich w tablicy wynikowej (tablica wynikowa powinna zawierać wyłącznie prawidłowe kierunki).
7. Zmodyfikuj metodę `main` tak, aby korzystając z klasy `OptionsParser` umożliwiała sterowanie zwierzęciem.
8. Przetestuj zachowanie zwierzęcia dla różnych danych wejściowych.
9. Napisz testy integracyjne weryfiujące poprawność implementacji. Uwzględnij:
    * czy zwierzę ma właściwą orientację,
    * czy zwierzę przemieszcza się na właściwe pozycje,
    * czy zwierzę nie wychodzi poza mapę,
    * czy dane wejściowe podane jako tablica łańcuchów znaków są poprawnie interpretowane.
10. Odpowiedz na pytanie: jak zaimplementować mechanizm, który wyklucza pojawienie się dwóch zwierząt w tym samym
    miejscu.
11. Otaguj gotowe rozwiązanie jako lab3.
