create database Ola;
use Ola;

# SQL Questions:
# 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = "Success";

# 1. Retrieve all successful bookings:
select * from Successful_Bookings;

# 2. Find the average ride distance for each vehicle type:
create view Ride_Distance as
SELECT Vehicle_Type,avg(Ride_Distance) as Avg_distance from bookings 
group by Vehicle_Type;

select * from Ride_Distance;

# 3. Get the total number of cancelled rides by customers:
Create view Canceled_by_Customer as 
select count(*) from bookings 
where Booking_Status ="Canceled by Customer";

select * from Canceled_by_Customer;

# 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID ,count(Booking_ID) as Total_Rides
from bookings
group by Customer_ID
order by Total_Rides Desc limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Canceled_Rides_by_Driver as
select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

select * from Canceled_Rides_by_Driver;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Ratings as
Select max(Driver_Ratings) as Max_Rating,
min(Driver_Ratings) as Min_Rating
from bookings 
where Vehicle_Type = "Prime Sedan";

select * from Max_Min_Ratings;

# 7. Retrieve all rides where payment was made using UPI:
create view Payment_By_UPI as
select * from bookings
where Payment_Method = "UPI"; 

select * from Payment_By_UPI;

# 8. Find the average customer rating per vehicle type:
select Vehicle_Type , avg(Customer_Rating) as Rating
from bookings 
group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
create view Booking_Status as 
select Booking_Status,Booking_Value as Sum from bookings
where Booking_Status = "Success"
group by Booking_Status;

select * from Booking_Status;

# 10. List all incomplete rides along with the reason:
