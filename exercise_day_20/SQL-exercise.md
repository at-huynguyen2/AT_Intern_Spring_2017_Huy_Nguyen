###Basic
1. Revising the Select Query I
	Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.
```sql
SELECT *
FROM CITY 
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA'
```
2. Revising the Select Query II
	Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA. 
```sql
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;
```
3. Select all
	Query all columns (attributes) for every row in the CITY table.
```sql
SELECT * 
FROM CITY;
```
4. Select By ID
	Query all columns for a city in CITY with the ID 1661.
```sql
SELECT * 
FROM CITY
WHERE ID = 1661;
```
5. Japanese Cities' Attributes 
	Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN
```sql
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';
```
6. Japanese Cities' Names
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
```sql
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';
```
7. Weather Observation Station 1
	Query a list of CITY and STATE from the STATION table.
```sql
SELECT CITY,STATE 
FROM STATION;
```
8.  Weather Observation Station 3
	Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.
```sql
SELECT CITY 
FROM STATION 
WHERE ID % 2 = 0 
GROUP BY CITY;
```
9. Weather Observation Station 4
	Let *'N'* be the number of CITY entries in STATION, and let *'N'* be the number of distinct CITY names in STATION; query the value of *N - 'N'* from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
```sql
SELECT (COUNT(*) - COUNT(DISTINCT CITY)) AS COUNT_N 
FROM STATION;
```
	
###Advance
1. Type of Triangle 
```sql
SELECT
CASE WHEN  (A+B)>C AND (A+C)>B AND (C+B)>A
THEN (CASE  WHEN A = B AND B = C THEN 'Equilateral'
            WHEN (A = B AND A <> C) OR (B = C AND A <>C) OR (C = A AND B <> A) THEN 'Isosceles'
            WHEN A <> B AND B <> C AND C <> A THEN 'Scalene'
      END)
ELSE 'Not A Triangle'
END
FROM TRIANGLES;
```
###Join
1. Asian Population
```sql
SELECT SUM(CITY.POPULATION) AS TONG_DAN_SO 
FROM CITY ,COUNTRY 
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Asia';
```
2. African Cities
```sql
SELECT CITY.NAME 
FROM CITY, COUNTRY 
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND CONTINENT = 'Africa'
```
3. Average Population of Each Continent 
```sql
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;
```
4.  The Report
```sql

```

