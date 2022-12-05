use HotelData;

insert into guests (FirstName, LastName, Adress, City, State, Zip, Phone)
values ("Toth", "Leon", "X aderess Y Street", "Miami", "Mi", "X/Y ZIP", "0743821343");

delete from guestreservation where Guest_ID = 7;
delete from guests where Guest_ID = 7;
delete from reservation where Reservation_ID = 7;