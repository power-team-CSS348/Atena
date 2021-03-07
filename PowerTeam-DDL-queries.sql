PRAGMA foreign_keys = ON;

--Table Aircompany
CREATE TABLE [Aircompany]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[AircompanyName] NVARCHAR (50),
	[AircompanyPhone] NVARCHAR (20),
	[AirCompanyAdress] NVARCHAR (100)
);


--Table PLane
CREATE TABLE [Plane]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idAircompany] INTEGER NOT NULL,
	[PlaneModel] NVARCHAR (20),
	[PlaneNumber] NVARCHAR (50),
    CONSTRAINT FK_PlaneToAircompany FOREIGN KEY(idAircompany) REFERENCES Aircompany(id)
);


--Table Country
CREATE TABLE [Country]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[name] NVARCHAR (50)
);

--Table City
CREATE TABLE [City]
(
	[id] INTEGER PRIMARY KEY NOT NULL,
	[idCountry] INTEGER NOT NULL,
	[Name] NVARCHAR (50),
	[Population] BIGINT,
	[GMT] DATETIME,
	[SignGMT] NVARCHAR(1),
    CONSTRAINT FK_CityToCountry FOREIGN KEY(idCountry) REFERENCES Country(id)
);


	
--Table AirPort
CREATE TABLE [AirPort]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idCity] INTEGER NOT NULL,
	[Name] NVARCHAR (50),
    CONSTRAINT FK_AirPortToCity  FOREIGN KEY(idCity) REFERENCES City(id)  
);


--Table Flight
CREATE TABLE [Flight]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idAircompany] INTEGER NOT NULL,
	[idPlane] INTEGER NOT NULL,
	[idAirPort] INTEGER NOT NULL,
	[FlightType] NVARCHAR (20),
	[DateTimeStart] DATETIME,
	[Duration] DATETIME,
	[DateTimeArrival] DATETIME,
	[NumOfFlights] INT,
	[Periodicity] DATETIME,
	[PriceEconom] MONEY,
	[PriceBusiness] MONEY,
	[PriceFirst] MONEY,
	[DateTimeStartGMT] DATETIME,
	[DateTimeArrivalGMT] DATETIME,
	[Status] NVARCHAR (20),
    CONSTRAINT FK_FlightToAircompany FOREIGN KEY(idAircompany) REFERENCES Aircompany(id),
    CONSTRAINT FK_FlightToPlane FOREIGN KEY(idPlane) REFERENCES Plane(id),
    CONSTRAINT FK_FlightToAirPort FOREIGN KEY(idAirPort) REFERENCES AirPort(id)
);

-- Table of Events related to the aircraft
CREATE TABLE [Events]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idFlight] INTEGER NOT NULL,
	[EventType] NVARCHAR (50),
	[DateTimeEvent] DATETIME,
    CONSTRAINT FK_EventsToFlight FOREIGN KEY(idFlight) REFERENCES Flight(id)
);


--Table Unexpected events related to the aircraft
CREATE TABLE [UnexpectedEvents]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idFlight] INTEGER NOT NULL,
	[EventType] NVARCHAR (50),
	[DateTimeEvent] DATETIME,
	[Duration] DATETIME,
	[Reason] TEXT,
    CONSTRAINT FK_UnexpEventsToFlight FOREIGN KEY(idFlight) REFERENCES Flight(id)
    
);

--Table Payment Method
CREATE TABLE [Payment]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[Name] NVARCHAR (50),
	[AddCost] DECIMAL (4, 2)
);


--Table Document TYpe
CREATE TABLE [DocType]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[Name] NVARCHAR (50),
	[Description] NVARCHAR (50),
	[RegularExpression] NVARCHAR (100)
);

--Table Buyer
CREATE TABLE [Buyer]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idPayment] INTEGER NOT NULL,
	[LastName] NVARCHAR (50),
	[FirstName] NVARCHAR (50),
	[Phone] NVARCHAR (15),
	[AltPhone] NVARCHAR (15),
	[TimeToConnect] NVARCHAR (100),
	[DeliveryAdress] NVARCHAR (100),
    CONSTRAINT FK_BuyerToPayment FOREIGN KEY(idPayment) REFERENCES Payment(id)
);


--Table Passengers
CREATE TABLE [Passengers]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idDocType] INTEGER NOT NULL,
	[LastName] NVARCHAR (50),
	[FirstName] NVARCHAR (50),
	[BirthDate] DATE,
	[Gender] NVARCHAR (10),
	[DocNumber] NVARCHAR (20),
    CONSTRAINT FK_PassengersToDocType FOREIGN KEY(idDocType) REFERENCES DocType(id)
);


--Table Tickets
CREATE TABLE [Tickets]
(
	[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
	[idFlight] INTEGER NOT NULL,
	[idPassenger] INTEGER NOT NULL,
	[idBuyer] INTEGER NOT NULL,
	[Class] NVARCHAR (20),
    CONSTRAINT FK_TicketsToFlight FOREIGN KEY(idFlight) REFERENCES Flight(id),
    CONSTRAINT FK_TicketsToPassengers FOREIGN KEY(idPassenger) REFERENCES Passenger(id),
    CONSTRAINT FK_TicketsToBuyer FOREIGN KEY(idBuyer) REFERENCES Buyer(id)
);

