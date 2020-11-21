USE PersonalTrainer;

#Activity 1
#Select all columns from ExerciseCategory and Exercise.
#The tables should be joined on ExerciseCategoryId.
#This query returns all Exercises and their associated ExerciseCategory.
#64 rows
SELECT * FROM ExerciseCategory FULL OUTER JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;#THIS IS INCORRECT FOR ACTIVITY 1 //DISPLAYS AN ERROR WITH SQL SYNTAX
SELECT ExerciseCategoryId, Name, ParentCategoryId, ExerciseId,Name, ExerciseCategoryId FROM ExerciseCategory FULL OUTER JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;#THIS IS INCORRECT FOR ACTIVITY 1 //DISPLAYS AN ERROR WITH SQL SYNTAX
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, ExerciseCategory.ExerciseId,ExerciseCategory.Name, ExerciseCategory.ExerciseCategoryId FROM ExerciseCategory FULL OUTER JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;#THIS IS INCORRECT FOR ACTIVITY 1 //DISPLAYS AN ERROR WITH SQL SYNTAX
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, Exercise.ExerciseId,Exercise.Name, Exercise.ExerciseCategoryId FROM ExerciseCategory FULL OUTER JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;#THIS IS INCORRECT FOR ACTIVITY 1 //DISPLAYS AN ERROR WITH SQL SYNTAX
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, Exercise.ExerciseId,Exercise.Name, Exercise.ExerciseCategoryId FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;#THIS WORKS BUT SEEMS TO REPEAT ExerciseCategoryId RESULTS BUT THAT'S WHAT THE QUERY IS ASKING FOR
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, Exercise.ExerciseId,Exercise.Name FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId

#Activity 2
#Select ExerciseCategory.Name and Exercise.Name where the ExerciseCategory does not have a ParentCategoryId (it is null).
#Again, join the tables on their shared key (ExerciseCategoryId).
#9 rows
SELECT ExerciseCategory.Name, Exercise.Name FROM ExerciseCategory JOIN ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId WHERE ExerciseCategory.ParentCategoryId IS NULL;#THIS IS INCORRECT FOR ACTIVITY 2, IT'S MISSING 'Exercise' BETWEEN JOIN and ON
SELECT ExerciseCategory.Name, Exercise.Name FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId WHERE ExerciseCategory.ParentCategoryId IS NULL;#THIS IS CORRECT FOR ACTIVITY 2

#Activity 3
#The query above is a little confusing. At first glance, it's hard to tell which Name belongs to ExerciseCategory and which belongs to Exercise.
#Rewrite the query using aliases:
#Alias ExerciseCategory.Name as 'CategoryName'.
#Alias Exercise.Name as 'ExerciseName'.
#9 rows
SELECT ExerciseCategory.Name AS CategoryName, Exercise.Name AS ExerciseName FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId WHERE ExerciseCategory.ParentCategoryId IS NULL


#Activity 4
#Select FirstName, LastName, and BirthDate from Client and EmailAddress from Login where Client.BirthDate is in the 1990s.
#Join the tables by their key relationship.
#What is the primary-foreign key relationship?
#35 rows
SELECT FirstName, LastName, BirthDate FROM Client JOIN Login ON Client.ClientId = Login.ClientId WHERE Client.BirthDate BETWEEN '1990/01/01' AND '1990/12/31'


#Activity 5
#Select Workout.Name, Client.FirstName, and Client.LastName for Clients with LastNames starting with 'C'?
#How are Clients and Workouts related?
#25 rows
SELECT  Workout.Name, Client.FirstName, Client.LastName FROM Workout JOIN ClientWorkout ON Workout.WorkoutId = ClientWorkout.WorkoutId;#INCORRECT FOR ACTIVITY 17 // #- Unknown column 'Client.FirstName' in 'field list'
SELECT  Workout.Name, Client.FirstName, Client.LastName FROM Workout JOIN ClientWorkout ON Workout.WorkoutId = ClientWorkout.WorkoutId JOIN Client ON ClientWorkout.ClientId = Client.ClientId WHERE Client.LastName LIKE 'C%';


#Activity 6
#Select Names from Workouts and their Goals.
#This is a many-to-many relationship with a bridge table.
#Use aliases appropriately to avoid ambiguous columns in the result.
#78 rows
SELECT Workout.Name WorkoutName, Goal.Name GoalName FROM Workout JOIN WorkoutGoal ON Workout.WorkoutId = WorkoutGoal.WorkoutId JOIN Goal ON WorkoutGoal.GoalId = Goal.GoalId;


#Activity 7
#Step 1
#Select client names and email addresses.
#Select FirstName and LastName from Client.
#Select ClientId and EmailAddress from Login.
#Join the tables, but make Login optional.
#500 rows
#Step 2
#Using the query above as a foundation, select Clients who do not have a Login.
#200 rows
SELECT Client.FirstName, Client.LastName, Login.EmailAddress FROM Login LEFT OUTER JOIN Client ON Login.ClientId = Client.ClientId;
#NEED TO COMEBACK TO STEP 2

#Activity 8
#Does the Client, Romeo Seaward, have a Login?
#Decide using a single query.
#Depending on how this query is set up, it will return 1 row or 0 rows.
#NEED TO COMEBACK TO


#Activity 9
#Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
#This requires a self-join.
#12 rows
SELECT ExerciseCategory.Name parent, ExerciseCategory.Name child FROM ExerciseCategory parent JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ExerciseCategoryId;#THIS IS INCORRECT FOR ACTICITY 9 //THROWS AN ERROR#1054 - Unknown column 'ExerciseCategory.Name' in 'field list'
SELECT parent.Name , child.Name FROM ExerciseCategory parent JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ExerciseCategoryId;#INCORRECT ANSWER SHOULD HAVE BEEN 12
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory parent JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ExerciseCategoryId;#INCORRECT ANSWER SHOULD HAVE BEEN 12
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory parent JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ParentCategoryId;

#Activity 10
#Rewrite the query above so that every ExerciseCategory.Name is included, even if it doesn't have a parent.
16 rows
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory parent RIGHT JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ExerciseCategoryId;
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory child LEFT JOIN ExerciseCategory parent ON child.ParentCategoryId = parent.ExerciseCategoryId;



#Activity 11
#Are there Clients who are not signed up for a Workout?
#50 rows
SELECT Client.ClientId FROM Client LEFT JOIN ClientWorkout ON Client.ClientId = ClientWorkout.ClientId;#INCORRECT
SELECT Client.ClientId FROM Client LEFT JOIN ClientWorkout ON Client.ClientId = ClientWorkout.ClientId WHERE ClientWorkout.WorkoutId IS null;


#Activity 12
#Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
#Goals are associated to Clients through ClientGoal.
#Goals are associated to Workouts through WorkoutGoal.
#6 rows, 4 unique rows









