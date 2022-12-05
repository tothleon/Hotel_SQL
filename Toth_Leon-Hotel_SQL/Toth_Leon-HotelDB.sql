DROP DATABASE IF EXISTS HotelData;

CREATE DATABASE HotelData;

use HotelData;

CREATE TABLE Guests (
	Guest_ID int PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Adress varchar(160) not null,
    City varchar(50) not null,
    State varchar(50) not null,
    Zip varchar(50) not null,
    Phone varchar(50) not null
);

CREATE TABLE Amenities (
	Amenitie_ID int PRIMARY KEY,
    Option_1 varchar(50) null,
    Option_2 varchar(50) null,
    Option_3 varchar(50) null
);

CREATE TABLE Rooms (
	RoomNumber int PRIMARY KEY,
    RoomType varchar(50) not null,
    ADA int not null,
    StandardOccupency int not null,
    MaximumOccupancy int not null,
    Price float not null,
    ExtraPersonPrice float null,
    ExtraPersonAlowed int not null,
    Amenitie_ID int not null,
    FOREIGN KEY (Amenitie_ID) REFERENCES Amenities(Amenitie_ID)
);

CREATE TABLE Reservation (
	Reservation_ID int PRIMARY KEY AUTO_INCREMENT,
    RoomNumber int not null,
    FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber),
    Adult int not null,
    Child int not null,
    StartDate date not null,
    EndDate date not null,
    TotalRoomCost float not null
);


CREATE TABLE GuestReservation (
	Guest_ID int not null,
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    Reservation_ID int not null,
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);