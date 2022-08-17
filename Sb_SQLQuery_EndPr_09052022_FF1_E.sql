--######### Go to Relevant Data Base

USE A_BDG
GO

--###################################

/*
	########################################

E.	Wether table breake in to months and weeks:
	Max,Min,Avg & STD 

	########################################


*/
/*
-------------------------------------------------------------------- (TEST)
SELECT site_id,
AVG (airTemperature) AS AvAirTemp
FROM Sh.Wth WHERE year(TmSt)=2016 and site_id in(
												'Panther',
												'Fox',
												'Eagle',
												'Moose',
												'Bull',
												'Bobcat',
												'Crow',
												'Hog',
												'Peacock',
												'Cockatoo',
												'Swan'
												)
Group by site_id
ORDER BY site_id
---------------------------------------------------------------------
*/

--		 E.0. Createing the Wth table with the relevant selected sites and featuers
--				(featuers / columns were selected with  less then under 30% nulls)

SELECT 
		TmSt,
		site_id,
		airTemperature,
		dewTemperature,
		seaLvlPressure,
		windDirection,
		windSpeed
INTO Sh.A_Wth
FROM Sh.Wth WHERE year(TmSt)=2016 and site_id in(
												'Panther',
												'Fox',
												'Eagle',
												'Moose',
												'Bull',
												'Bobcat',
												'Crow',
												'Hog',
												'Peacock',
												'Cockatoo',
												'Swan'
												)

SELECT * FROM Sh.A_Wth
ORDER BY site_id


/*

	##########################################

	E.1 Wether for Panter

	##########################################

*/




----	E.1.1 Creating the Wether Panter table

SELECT TmSt, airTemperature, dewTemperature, seaLvlPressure, windSpeed, windDirection
INTO Sh.A_Wth_Panther
FROM Sh.A_Wth 
WHERE site_id='Panther'


--DROP TABLE Sh.A_Wth_Panther




/*   
		########################################################

			E.1.1. Panter MAX Wether

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_Wth_Panther



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_Wth_Panther'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_Wth_Pa_MAX;
CREATE TABLE Sh.A_Wth_Pa_MAX (Wkn INT, Wth_Par VARCHAR(50), val_max FLOAT);



/*   ^^^^^^^^^^^^^^^  Stage 5 :   Script for filling the table with the values    ^^^^^^*/

-- declaring variables
DECLARE @bidn AS VARCHAR(50);
DECLARE @sql AS VARCHAR(MAX);
DECLARE @x AS INT;
-- set counter to  0
SET @x = 0
-- main loop
WHILE @x = 0
	BEGIN
-- 
	SET @bidn = (SELECT TOP 1 COLUMN_NAME FROM Sh.COLUMN_NAMES WHERE vstatus = 0); -- put col name fome table col names in to bidn if vstatus is 0

	IF @bidn IS NULL															  -- if no name in set counter to 1
		BEGIN
			SET @x = 1;
		END
--- main statment operation to do
	SET @sql = 'INSERT INTO Sh.A_Wth_Pa_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as Wth_Par, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_max
				FROM Sh.A_Wth_Panther
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Wth_Pa_MAX ORDER BY Wth_Par,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Wth_Pa_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Wth_Pa_MAX_PIV
SELECT *
INTO Sh.A_Wth_Pa_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_Wth_Pa_MAX
		--WHERE Wth_Par = 'airTemperature'
	  ) AS SRC
PIVOT(
		MAX(val_max)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Wth_Pa_MAX_PIV



SELECT * FROM Sh.A_Wth
ORDER BY site_id











----------------------------------------------------------------------------
--DROP TABLE #Pa_Max_AirT_Jan
SELECT Wth_Par AS Site_Id ,[1] AS AirT_Max_Wk1,[2] AS AirT_Max_Wk2,[3] AS AirT_Max_Wk3,[4] AS AirT_Max_Wk4,[5] AS AirT_Max_Wk5
INTO #Pa_Max_AirT_Jan
FROM Sh.A_Wth_Pa_MAX_PIV
WHERE Wth_Par = 'airTemperature'
UPDATE #Pa_Max_AirT_Jan SET Site_Id = 'Jan_Panther'

SELECT * FROM #Pa_Max_AirT_Jan






--DROP TABLE #Pa_Max_DewT_Jan
SELECT Wth_Par AS Site_Id ,[1] AS DewT_Max_Wk1,[2] AS DewT_Max_Wk2,[3] AS DewT_Max_Wk3,[4] AS DewT_Max_Wk4,[5] AS DewT_Max_Wk5
INTO #Pa_Max_DewT_Jan
FROM Sh.A_Wth_Pa_MAX_PIV
WHERE Wth_Par = 'dewTemperature'
UPDATE #Pa_Max_DewT_Jan SET Site_Id = 'Jan_Panther'

SELECT * FROM #Pa_Max_DewT_Jan

SELECT Wth_Par AS Site_Id ,[1] AS AirT_Max_Wk1,[2] AS AirT_Max_Wk2,[3] AS AirT_Max_Wk3,[4] AS AirT_Max_Wk4,[5] AS AirT_Max_Wk5
INTO #Pa_Max_AirT_Jan
FROM Sh.A_Wth_Pa_MAX_PIV
WHERE Wth_Par = 'seaLvlPressure'
UPDATE #Pa_Max_AirT_Jan SET Site_Id = 'Jan_Panther'

SELECT * FROM #Pa_Max_AirT_Jan


SELECT Wth_Par AS Site_Id ,[1] AS AirT_Max_Wk1,[2] AS AirT_Max_Wk2,[3] AS AirT_Max_Wk3,[4] AS AirT_Max_Wk4,[5] AS AirT_Max_Wk5
INTO #Pa_Max_AirT_Jan
FROM Sh.A_Wth_Pa_MAX_PIV
WHERE Wth_Par = 'windDirection'
UPDATE #Pa_Max_AirT_Jan SET Site_Id = 'Jan_Panther'

SELECT * FROM #Pa_Max_AirT_Jan

SELECT Wth_Par AS Site_Id ,[1] AS AirT_Max_Wk1,[2] AS AirT_Max_Wk2,[3] AS AirT_Max_Wk3,[4] AS AirT_Max_Wk4,[5] AS AirT_Max_Wk5
INTO #Pa_Max_AirT_Jan
FROM Sh.A_Wth_Pa_MAX_PIV
WHERE Wth_Par = 'windSpeed'
UPDATE #Pa_Max_AirT_Jan SET Site_Id = 'Jan_Panther'

SELECT * FROM #Pa_Max_AirT_Jan













/*   
		########################################################

			E.1.2 Panter Min Wether

		########################################################

*/


/*   ^^^^^^^^^^^^^^^  Stage 1 (new 3) :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 2 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_Wth_Pa_Min;
CREATE TABLE Sh.A_Wth_Pa_Min (Wkn INT, Wth_Par VARCHAR(50), val_min FLOAT);


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Script for filling the table with the values    ^^^^^^*/

-- declaring variables
DECLARE @bidn AS VARCHAR(50);
DECLARE @sql AS VARCHAR(MAX);
DECLARE @x AS INT;
-- set counter to  0
SET @x = 0
-- main loop
WHILE @x = 0
	BEGIN
-- 
	SET @bidn = (SELECT TOP 1 COLUMN_NAME FROM Sh.COLUMN_NAMES WHERE vstatus = 0); -- put col name fome table col names in to bidn if vstatus is 0

	IF @bidn IS NULL															  -- if no name in set counter to 1
		BEGIN
			SET @x = 1;
		END
--- main statment operation to do
	SET @sql = 'INSERT INTO Sh.A_Wth_Pa_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as Wth_Par, Min(CAST('+ @bidn +' AS FLOAT)) AS val_min
				FROM Sh.A_Wth_Panther
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Wth_Pa_Min ORDER BY Wth_Par,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Wth_Pa_Min



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Wth_Pa_Min_PIV
SELECT *
INTO Sh.A_Wth_Pa_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_Wth_Pa_Min
	  ) AS SRC
PIVOT(
		MAX(val_min)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Wth_Pa_Min_PIV

