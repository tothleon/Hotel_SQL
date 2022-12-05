use HotelData;


-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

select FirstName, LastName, r.RoomNumber, r.StartDate, r.EndDate
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
where r.EndDate between '2023-07-15' and '2023-07-31';

-- Wilfred	Vise	401	2023-07-18	2023-07-21
-- Bettyann	Seery	303	2023-07-28	2023-07-29

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

select FirstName, LastName, r.RoomNumber, r.StartDate, r.EndDate
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID
where a.Option_2 = 'Jacuzzi' or a.Option_3 = 'Jacuzzi';

-- Zachery	Luechtefeld	202	2023-03-29	2023-03-31
-- Walter	Holaway	204	2023-07-13	2023-07-14
-- Aurore	Lipton	302	2023-03-18	2023-03-23
-- Maritza	Tilton	302	2023-12-24	2023-12-28
-- Aurore	Lipton	304	2023-06-17	2023-06-18
-- Wilfred	Vise	207	2023-04-23	2023-04-24
-- Duane	Cullison 305	2023-02-22	2023-02-24
-- Bettyann	Seery	305	2023-08-30	2023-09-01

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

select ro.RoomNumber, FirstName, LastName, r.StartDate, r.Adult + r.Child as TotalPeople
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID
where FirstName = 'Karie' and LastName = 'Yang';

-- 201	Karie	Yang	2023-03-06	4
-- 203	Karie	Yang	2023-09-13	4

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

select r.Reservation_ID, r.TotalRoomCost
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID;

-- 1	299.98
-- 18	149.99
-- 21	449.97
-- 22	599.97
-- 2	999.95
-- 16	199.99
-- 17	349.98
-- 3	349.98
-- 20	1199.97
-- 4	199.99
-- 19	399.98
-- 5	924.95
-- 13	184.99
-- 6	349.98
-- 8	799.96
-- 14	184.99
-- 9	174.99
-- 15	1259.97
-- 10	1199.97
-- 23	699.96
-- 11	599.96
-- 12	599.96

-- 5. Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.

select *
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID
where ro.MaximumOccupancy > 2  and r.StartDate between '2023-04-01' and '2023-04-30';

-- 8	8	8	Walter	Holaway	7556 Arrowhead St.	Cumberland	RI	2864	(446) 396-6785	8	301	1	0	2023-04-09	2023-04-13	799.96	301	Double	0	2	4	199.99	10	1	2	2	Refrigerator

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

select FirstName, LastName, count(r.Reservation_ID) as NumOfReserv
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID
group by gr.Guest_ID
order by NumOfReserv desc;

-- Mack	Simmer	4
-- Bettyann	Seery	3
-- Duane	Cullison	2
-- Karie	Yang	2
-- Aurore	Lipton	2
-- Walter	Holaway	2
-- Wilfred	Vise	2
-- Maritza	Tilton	2
-- Joleen	Tison	2
-- Zachery	Luechtefeld	1

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

select FirstName, LastName, Adress, Phone
from guestreservation gr
join guests g on g.Guest_ID = gr.Guest_ID
join reservation r on r.Reservation_ID = gr.Reservation_ID
join rooms ro on ro.RoomNumber = r.RoomNumber
join amenities a on a.Amenitie_ID = ro.Amenitie_ID
where Phone = '(814) 485-2615'

-- Zachery	Luechtefeld	7 Poplar Dr.	(814) 485-2615