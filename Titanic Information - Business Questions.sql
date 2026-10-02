-- Create Table --
CREATE TABLE titanic_data (
	passenger_id INTEGER,
	pclass INTEGER,
	name VARCHAR(150),
	sex VARCHAR(20),
	age INTEGER,
	sibsp INTEGER,
	parch INTEGER,
	ticket VARCHAR(100),
	fare DECIMAL(10,2),
	embarked VARCHAR(10),
	survived INTEGER
)

-- Check the data --

-- Check the columns and Data types -- 
SELECT COUNT(*) AS total_passenger
FROM Titanic_data;

Select
	column_name,
	data_type
FROM information_schema.columns
WHERE table_name = 'titanic_data'
ORDER BY ordinal_position;

-- Check The Records & Missing Values --
SELECT *
FROM titanic_data
LIMIT 10;

SELECT
	COUNT(*) - COUNT(passenger_id) AS missing_passenger_id,
	COUNT(*) - COUNT(pclass) AS missing_pclass,
	COUNT(*) - COUNT(name) AS missing_name,
	COUNT(*) - COUNT(sex) AS missing_sex,
	COUNT(*) - COUNT(age) AS missing_age,
	COUNT(*) - COUNT(sibsp) AS missing_sibsp,
	COUNT(*) - COUNT(parch) AS Missing_parch,
	COUNT(*) - COUNT(ticket) AS missing_ticket,
	COUNT(*) - COUNT(fare) AS missing_fare,
	COUNT(*) - COUNT(embarked) AS missing_embarked,
	COUNT(*) - COUNT(survived) AS missing_survived
FROM titanic_data

-- Check the major categorical values --
SELECT DISTINCT sex
FROM titanic_data;

SELECT DISTINCT embarked
FROM titanic_data;

SELECT DISTINCT pclass
FROM titanic_data
ORDER BY pclass;

SELECT DISTINCT survived 
FROM titanic_data
ORDER BY survived;

-- Business Questions -- 
-- 1. How many passengers were in each passenger class? --
SELECT
	pclass,
	COUNT(*) AS passenger_count
FROM titanic_data
GROUP BY pclass
ORDER BY pclass;
-- This analysis examines the number of passengers within each class department and presents how the population was distributed across the three of them. --
-- The data shows that first class had the most passengers with 355, followed by second class who had 326 and third class, holding the least of 319 on board. --

-- 2. How many passengers embarked from each port? --
SELECT
	embarked,
	COUNT(*) AS passenger_count
FROM titanic_data
GROUP BY embarked
ORDER BY passenger_count DESC;
-- This analysis explores the number of passengers who embarked from each port and provides an overview of how passengers were ditributed across different points of embarkation. -- 
-- Based on the data, port Q had the highest number of passengers with 362, followed by the least amount boarding from port S with 310 and port C's count falling in between at 328 in total. --

-- 3. What was the average fare paid by each passenger class? -- 
SELECT 
	pclass,
	ROUND(AVG(fare), 2) AS average_fare 
FROM titanic_data
GROUP BY pclass
ORDER BY pclass;
-- This analysis compares the average fare paid by passengers in each passenger class and shows how the average fare value differed across the three classes. --
-- From what the data shows, first class has the lowest average fare fees paid, $235.84, while the second class passengers paid the highest average of $256.53. Third class between the two with an average fare of $252.71. --

-- 4. How many passengers survived and did not survive? --
SELECT
	survived,
	COUNT(*) AS passenger_count
FROM titanic_data
GROUP BY survived
ORDER BY survived;
-- This analization presents the number of passengers who survived and those who did not. It provides basic overview of the survival outcomes represented in the dataset. --
-- Based on the dataset, there were 508 of the 1000 passengers on board who didn't make it while 492 of those passengers survived. --

-- 5. How many passengers were in each age group? --
SELECT
	CASE
		WHEN age <= 17 THEN '1-17'
		WHEN age <= 30 THEN '18-30'
		WHEN age <= 50 THEN '31-50'
		ELSE '51+'
	END AS age_group,
	COUNT(*) AS passenger_count
FROM titanic_data
GROUP BY age_group
ORDER BY age_group;
-- This analysis groups passengers into age ranges to examine the age composition of the dataset and compare the number of passengers with each age group. --
-- As the Data shows, majority of the passengers aged 51 and above represented the largest group with 335 present. The 31-50 age group followed with 251 passengers while the group from ages 1 to 17 contained 236 of them. The minority was 178 of them from ages 18-30.  --

-- 6. What is the average age of passengers in each passenger class? --
SELECT
	pclass,
	ROUND(AVG(age), 2) AS average_age
FROM titanic_data
GROUP BY pclass
ORDER BY pclass;
-- This analysis compares the average ages of passengers across the three passenger classes and elaborates on a department-level-style comparison of typical passenger age differal by class. --
-- The data shows that the average passenger ages in both the first and thrid classes are close to or around 39 years old while the second class averages to one year below the first and third nearing 38 years of age. --

-- 7. Which passenger class had the most survivors? --
SELECT
	pclass, 
	COUNT(*) AS survivors
FROM titanic_data
WHERE survived = 1
GROUP BY pclass
ORDER BY survivors DESC;
-- This analysis gives the number of surviving passengers within each passenger class, focusing specifically on the surviving population to identify how the number of survivors is distributed across the three classes. --
-- As portrayed by the data, first class had the most survivors of the 1000 people that embarked with 171 passengers followed by the third class with 163. Whereas the second class had a low of 158 survivors. --