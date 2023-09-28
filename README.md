# Udacity-Project-Chinook-Database
An open ended project to explore the database of Chinook (a musical store).

![Chinook-logo-91A58517E7-seeklogo com](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/e46f5db4-f0fb-4f56-9d28-5ac949f162a7)

This project was part of the requirement for graduating from the Business Analytics course on Udacity. In this project, I queried the Chinook Database. The Chinook Database holds information about a music store. For this project, I assisted the Chinook team with understanding the media in their store, their customers and employees, and their invoice information. The Entity Relationship Diagram (ERD) of Chinook Database as provided below assisted in knowing the relationship that existed between the tables in the database.

![SQL Project ERD](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/4269bd18-0bf4-4100-b87e-7b9e6c1ce727)

Queries were written using SQLite to generate insights in respect of the questions posed below;


Question 1: How many quantities were sold each year?
  
![Picture1](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/49d362a8-a4af-4da2-97c8-161f55650b02)

From the visual above, it can be deduced that the highest quantity of tracks was sold in the year 2010 to the tune of 455 quantities. The closest to this is 454 quantities sold in 2009. However, 2013 and 2011 had the lowest quantities of 442 tracks sold in each year. This shows a decline in the yearly sales and it is recommended that efforts be put to sales promotion.


Question 2: Which month(s) has the highest revenue generated in each year?

![Picture2](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/0be3a7b7-30c4-4f79-a039-9e4c65031244)

Based on the above visual, it was discovered that all the months in 2009, except January generated the same revenue of 37.62 and also happened to be the highest for the year. Also, January, April, August, and November had the highest revenue for the years 2010, 2011, 2012, and 2013 respectively.


Question 3: What are the top 10 selling tracks based on the revenue generated? Show their Unit sold as well

![Picture3](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/b42c0611-a31a-4a1d-abfc-6fd148f5f13a)

The visual reveals the top 10 selling tracks based on the revenue generated and the highest of all is **‘The Trooper’** with 5 quantities sold. The essence of displaying the units sold alongside the revenue generated is to check if there is a relationship between these two variables. The visual revealed a linear relationship between these two variables. This implies that the more units sold, the more the revenue generated. Hence, more efforts could be channeled towards the quantity of products sold.


Question 4: How many artists write the top 3 expensive genres (based on unit price) in each country?

![Picture4](https://github.com/quyum-fatai/Udacity-Project-Chinook-Database/assets/127361595/571dea46-6ccc-4fce-9ddd-c53bf23fca59)

This part is a bit tricky and technical. The approach applied was that, the 3 most expensive generes based on unit price were derived first using a CTE then this was fed into the query used to obtain the number of artists who writes them in each country (if the country has such genre). Based on the results of the query and as displayed in the visual above, it can be seen that Drama, TV Shows, and Comedy happens to be the most 3 expensive genres. In addition, Czech Republic had the highest number of Drama artists, the USA had the highest number of TV Shows artists as well as the highest number of Comedy artists. With this, the store would know where and how to channel resources to improve sales and performance. 
 



 
