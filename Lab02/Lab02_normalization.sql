CREATE TABLE Flight (
    flight_number INT PRIMARY KEY,
    departure_airport_name VARCHAR(50) NOT NULL,
    departure_city VARCHAR(50) NOT NULL,
    arrival_airport_name VARCHAR(50) NOT NULL,
    arrival_city VARCHAR(50) NOT NULL,
    airline_name VARCHAR(50) NOT NULL
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    flight_number INT NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Passenger (
    passenger_passport_number VARCHAR(20) PRIMARY KEY,
    passenger_full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Booking_Seat (
    booking_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    passenger_passport_number VARCHAR(20) NOT NULL,
    PRIMARY KEY (booking_id, seat_number)
);

ALTER TABLE Booking
ADD FOREIGN KEY (flight_number)
REFERENCES Flight(flight_number);

ALTER TABLE Booking_Seat
ADD FOREIGN KEY (booking_id)
REFERENCES Booking(booking_id);

ALTER TABLE Booking_Seat
ADD FOREIGN KEY (passenger_passport_number)
REFERENCES Passenger(passenger_passport_number);

INSERT INTO Flight
(flight_number, departure_airport_name, departure_city,
 arrival_airport_name, arrival_city, airline_name)
VALUES
(101, 'Almaty International Airport', 'Almaty',
 'Astana International Airport', 'Astana', 'Air Astana'),
(102, 'Astana International Airport', 'Astana',
 'Almaty International Airport', 'Almaty', 'FlyArystan'),
(103, 'Almaty International Airport', 'Almaty',
 'Istanbul Airport', 'Istanbul', 'Air Astana'),
(104, 'Istanbul Airport', 'Istanbul',
 'Almaty International Airport', 'Almaty', 'Turkish Airlines'),
(105, 'Almaty International Airport', 'Almaty',
 'Dubai International Airport', 'Dubai', 'Air Astana');

INSERT INTO Booking
(booking_id, flight_number, ticket_price)
VALUES
(1001, 101, 25000.00),
(1002, 102, 22000.00),
(1003, 103, 85000.00),
(1004, 104, 90000.00),
(1005, 105, 120000.00);

INSERT INTO Passenger
(passenger_passport_number, passenger_full_name)
VALUES
('N1234567', 'Ivan Petrov'),
('N2345678', 'Anna Smirnova'),
('N3456789', 'Max Kim'),
('N4567890', 'Elena Brown'),
('N5678901', 'Daniel Lee');

INSERT INTO Booking_Seat
(booking_id, seat_number, passenger_passport_number)
VALUES
(1001, '12A', 'N1234567'),
(1002, '15B', 'N2345678'),
(1003, '8C', 'N3456789'),
(1004, '20A', 'N4567890'),
(1005, '7D', 'N5678901');