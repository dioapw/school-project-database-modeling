# On-demand Database Modeling 

## Background
Moving or carrying goods is a troublesome thing when we want to move house, or when we just want to move goods from one area to another but do not have an adequate vehicle to transport quite a lot of luggage, and this is still a problem for some people to this day. Then in this era, more and more customers want it to be easy to take care of their goods to the place of delivery of goods because they just want to stay at home without having to take care of it, because of that, a shuttle service offering transportation of goods in large quantities called On-demand Delivery was born. On-demand Delivery is an application that provides services or services for transporting luggage in large quantities, later customers can order pick ups or ankles that are adjusted to the amount of cargo to be transported so that if the customer wants to move home or wants to pick up and pick up luggage in large quantities now no need to bother anymore, we just need to order a pick up or ankle when we want to move our luggage. In this report that we have compiled, we will do data modeling on this on-demand delivery system and describe the relationships in the On-demand Delivery application, what are the entities, attributes, and relationships between entities in the application?, how is the arrangement of the data in the On-demand Delivery so that the application can run well and smoothly? And others. Finally, the purpose of writing this report is to fulfill one of the tasks in the database modeling course and as a process for the final assignment in this course.

## Business Rules
- There are 3 users, namely customer, driver, and employee.
- One employee can only have one role.
- Customers can choose to do phone verification or not
- Each customer can only order the service once for a period or not Make two orders at one time.
- Each driver can only receive and make deliveries once in a period.
- Only drivers who have registered and completed their documents can take customer orders.
- One customer can have many e-money or not have the same very.
- Documents that must be uploaded by the driver are the driver's license, KTP, STNK, photo of the driver and the truck.
- Drivers must upload a profile picture.
- Customers are not required to upload a profile picture.
- One customer can register their payment card into the system.
- The types of payment cards that can be stored are debit and credit cards.
- Every customer has a usage promo for each promo they have.
- One customer can use multiple promo codes.
- Promo code has a deadline of availability in terms of time.
- Promo code can last continuously/repeatedly.
- Promo code can be different for each city.
- Promo code has a maximum usage amount per user and available amount.
- Promo code is generated based on the type of service and item.
- Every customer can top up e-money.
- Every e-money transaction can be saved in the transaction history.
- The top-up methods offered are mobile banking, internet banking, ATM and via email direct drivers.
- The choices of trucks offered are crankcase, ankle box, pickup tub and pickup box.
- Phone verification can only be done once for each user number.
- Each customer can see a list of deliveries that have been made.
- Each customer can save the saved location of the delivery, both the destination and the pickup.
- Services available are regular, express, standard overnight, 2day, priority overnight, economy.
- Service fee based on distance per km/mile.
- Customers can see the estimated time, distance, and shipping costs.
- Customers can see the delivery times offered by each service.
- Total driver income is obtained from the sum of trip income, bonuses, and customer tips.
- The cost of delivery of goods based on distance per km/mile, choice of truck, type of goods, type service and additional costs for drivers if any.
- Payment methods available are card, cash and e-money.
- Customers can give tips through the system.
- Drivers can get bonuses from the company.
- One delivery can bring a lot of customers.
- Items have several types that are subject to additional fees, namely valuables, fragile items and very heavy items.
- Each driver has their own income that can be taken per day.
- The customer can cancel the order before the driver picks up the goods
- The driver can cancel the customer's request if it has been accepted but the goods haven't taken.
- The Nearest drivers and driving trucks according to customer needs can take service orders.
- Each delivery completed by the customer can give an assessment to the driver.
- Customer ratings are made based on their activeness in using the service.
- Drivers have ratings that can only be seen by customers.
- Customers have ratings that only drivers can see.
- Drivers can see a list of trips that have been made.
- For cash payments must be made at the beginning of delivery while non-cash payment  can be done before or after delivery.

## Entity Relationship Diagram

![Alt text](https://user-images.githubusercontent.com/55073908/140640336-2054e282-1151-4214-b43f-21b6cbcc3fdd.png)


## Relational Schema

![Alt text](https://user-images.githubusercontent.com/55073908/140640349-5518114d-651f-44d6-bd44-5a982518b9be.png)


This Project Was Built by Dio Aditya, Rezki Fauzan and Freza Rio.
