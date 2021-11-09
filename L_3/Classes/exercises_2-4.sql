-- Napisz polecenie które podaje listę książek (mumery ISBN) zarezerwowanych
-- przez osobę o nazwisku: Stephen A. Graff
 

Select isbn,lastname from reservation inner join member m on reservation.member_no = m.member_no where
firstname = 'Stephen' and lastname ='Graff' and middleinitial='A'
