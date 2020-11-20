USE PersonalTrainer;

#Activity 1: Select all rows and columns from the Exercise table. (64 rows)
SELECT * FROM Exercise;

#Activity 2: Select all rows and columns from the Client table. (500 rows)
SELECT * FROM Client;

#Activity 3: Select all columns from Client where the City is Metairie. (29 rows)
SELECT * FROM CLIENT WHERE city = "Metairie";

#Activity 4: Is there a Client with the ClientId '818u7faf-7b4b-48a2-bf12-7a26c92de20c'? (0 rows)
SELECT * FROM Client WHERE ClientId = "818u7faf-7b4b-48a2-bf12-7a26c92de20c";

#Activity 5: How many rows are in the Goal table? (17 rows)
SELECT * FROM Goal;


#Activity 6: Select Name and LevelId from the Workout table. (26 rows)
SELECT Name, LevelId from Workout;

#Activity 7 Select Name, LevelId, and Notes from Workout where LevelId is 2. (11 rows)
SELECT Name, LevelId, Name FROM Workout WHERE LevelId =2;


#Activity 8: Select FirstName, LastName, and City from Client where City is Metairie, Kenner, or Gretna. (77 rows)
SELECT FirstName, LastName, City FROM Client WHERE city = "Metairie" OR "Kenner" or "Gretna";#THIS IS INCORRECT FOR ACTIVITY 8
SELECT FirstName, LastName, City FROM Client WHERE city = ("Metairie" OR city ="Kenner" or city = "Gretna");#THIS IS INCORRECT FOR ACTIVITY 8 NEVER DO THIS
SELECT FirstName, LastName, City FROM Client WHERE city = "Metairie" OR city ="Kenner" or city = "Gretna";#THIS IS CORRECT FOR ACTIVITY 8
SELECT FirstName, LastName, City FROM Client WHERE city IN ("Metairie","Kenner","Gretna");#THIS IS CORRECT FOR ACTIVITY 8

#Activity 9: Select FirstName, LastName, and BirthDate from Client for Clients born in the 1980s. (72 rows)
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= 1980-01-01 OR BirthDate <= 1980-12-31;#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= 1980-01-01 AND BirthDate <= 1980-12-31;#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= "1980-01-01" OR BirthDate <= "1980-12-31";#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= "1980-01-01" AND "BirthDate <= 1980-12-31";#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate BETWEEN "1980-01-01" AND "1980-12-31";#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= '1980-01-01' AND BirthDate <= '1980-12-31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= '1980-01-01' OR BirthDate <= '1980-12-31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= '1980/01/01' OR BirthDate <= '1980/12/31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate >= '1980/01/01' AND BirthDate <= '1980/12/31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate BETWEEN '1980-01-01' AND '1980-12-31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM client WHERE BirthDate BETWEEN '1980/010/1' AND '1980/12/31';#THIS IS INCORRECT FOR ACTIVITY 9
SELECT FirstName, LastName, BirthDate FROM Client WHERE BirthDate BETWEEN '1980/01/01' AND '1980/12/31';#THIS IS CORRECT FOR ACTIVITY 9 //error made earlier saying it's incorrect

Activity 10: Write the query above in a different way. If you used BETWEEN, you can't use it again. If you didn't use BETWEEN, use it!
SELECT FirstName, LastName, BirthDate from Client WHERE BirthDate >= '1980-01-01' AND  <= '1980-12-31';#THIS IS INCORRECT FOR ACTIVITY 10
SELECT FirstName, LastName, BirthDate from Client WHERE BirthDate >= '1980-01-01' AND  BirthDate <= '1980-12-31';#THIS IS CORRECT FOR ACTIVITY 10

Activity 11: How many rows in the Login table have a .gov EmailAddress? (17 rows)
SELECT * FROM `Login` WHERE `EmailAddress` LIKE '%.gov%';

Activity 12: How many Logins do NOT have a .com EmailAddress? (122 rows)
SELECT * FROM Login WHERE EmailAddress LIKE !('%.com%');#THIS IS INCORRECT FOR ACTIVITY 12
SELECT * FROM `Login` WHERE EmailAddress !(LIKE '%.goc%');#THIS IS INCORRECT FOR ACTIVITY 12//ALSO GIVES ERROR
SELECT * FROM `Login` WHERE EmailAddress NOT LIKE '%.com%';#THIS IS CORRECT FOR ACTIVITY 12// https://stackoverflow.com/questions/232935/sql-query-where-field-does-not-contain-x


#Activity 13: Select first and last name of Clients without a BirthDate. (37 rows) 
SELECT FirstName, LastName FROM Client WHERE BirthDate IS NULL;

Activity 14: Select the Name of each ExerciseCategory that has a parent (ParentCategoryId value is not null). (12 rows)
SELECT name FROM ExerciseCategory WHERE ParentCategoryId IS NOT NULL;

Activity 15: Select Name and Notes of each level 3 Workout that contains the word 'you' in its Notes. (4 rows)
SELECT Name, Notes FROM Workout WHERE LevelId = 3 AND NOTES LIKE '%you%';


#Activity 16 Select FirstName, LastName, City from Client whose LastName starts with L,M, or N and who live in LaPlace. (5 rows)
SELECT FirstName, LastName, City FROM Client WHERE LastName LIKE 'L%' OR LastName LIKE 'M%' OR LastName LIKE 'N%';

#Activity 17: Select InvoiceId, Description, Price, Quantity, ServiceDate and the line item total, a calculated value, from InvoiceLineItem, where the line item total is between 15 and 25 dollars. (667 rows)
SELECT InvoiceId, Description, Price, Quantity, ServiceDate FROM InvoiceLineItem WHERE Price > 15 AND Price <25;
SELECT InvoiceId, Description, Price, Quantity, ServiceDate, (Price > 15 AND Price <25) AS line_item_total FROM InvoiceLineItem WHERE Price > 15 AND Price <25;#NEED TO COME BACK

#Activity 18
#Does the database include an email address for the Client, Estrella Bazely? (YES)
#This requires two queries:
#Select a Client record for Estrella Bazely. Does it exist?
#If it does, select a Login record that matches its ClientId.
SELECT * FROM `Client` WHERE FirstName = 'Estrella' AND LastName = 'Bazely';#CLIENT ID = 87976c42-9226-4bc6-8b32-23a8cd7869a5
SELECT * FROM Login WHERE ClientId = '87976c42-9226-4bc6-8b32-23a8cd7869a5';

#Activity 19 
#What are the Goals of the Workout with the Name 'This Is Parkour'?(Endurance, Muscle Bulk, Focus: Shoulders)
SELECT `WorkoutId``Name` FROM `Workout` WHERE Name = 'This Is Parkour';#workout id = 12
SELECT * FROM `WorkoutGoal` WHERE WorkoutId = 12;#goal ids returened are 3, 8, 15
SELECT * FROM Goal WHERE GoalId = 3 OR GoalId = 8 OR GoalId=15 ;