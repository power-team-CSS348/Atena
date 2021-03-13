# Atena

Description of the object 
=====================
In our project, we chose the airport. .
The tasks of the airport include: control and management of the movement of aircraft, baggage inspection. The airport also works closely with airlines.
Airlines form flights, the airport makes and adjusts the schedule of movement depending on the workload of the runway, provides a parking space for airline aircraft. Airports are equipped with waiting rooms, where you can see information about the nearest flights on the information board.
In the modern information society, like many organizations, the airport should have its own website, where, for the convenience of users, it would be possible to view information about the nearest flights without leaving home, as well as book a ticket. Booking of air tickets should consist of several stages:

1. Route selection
2. Select the fare offered by the airline
3. Filling in passenger data
4. Choosing the payment and delivery method

The last step is to send the completed data directly to the airline, which contacts the buyer and makes the sale.
The security service is engaged in baggage inspection, in case of successful passage, puts a special mark. In case of failure, establishes contact with the passenger through the airline.


The formation of a flight for an airport includes entering information about the departure time, arrival time, airline, aircraft model, departure and arrival location into the database. Flights are formed by airlines.
Control of the movement of aircraft is carried out by the airport dispatcher. It gives permission for take-off / landing, records delays, unforeseen circumstances, and monitors weather conditions.
The airport must book and sell tickets through the information portal-the website. There you can search, choose a suitable fare, fill in information about passengers, choose a payment method and delivery. Then the completed data is sent directly to the airline, which is engaged in the sale of tickets.
Baggage inspection is carried out by the airport security service. Each baggage is sealed and viewed on an X-ray machine. Next, loading takes place in the cargo compartment of the aircraft. The security service, in case of successful verification, puts a special stamp on the luggage. In case of failure, the security service should contact the passenger.


Goal
====
The main purpose is to record the movement of aircraft and provide information about flights associated with this airport. A secondary task is the sale of tickets.






ER DIAGRAM
------------
We have created an Entity-Relationship diagram

*  Display information about the nearest flights for a certain period of time
* Displaying information about flights by city of departure and arrival
* Display information about events related to this aircraft on this flight
* Displaying information about unforeseen events related to this aircraft on this flight
* Generating a report on the movement of aircraft on a certain day, week, month or other period of time
* Formation of the schedule of aircraft movement on the current day, in a certain period of time
* Displaying information about airlines and their aircraft
* Display information about flights associated with a particular city
* Displaying information about flights associated with a particular country
* Displaying information about the buyer and the tickets purchased by them
* Displaying information about passengers for whom tickets are booked
