-- moving to the A_BDG data base 

USE A_BDG
GO

/*   
    ########################################################

	B. Altering Time tables to Building Weekly Pivot Tables

    ########################################################

*/


/*   
		########################################################

		B.1. ChWt Table (Chilled Water)

		########################################################

*/

/*   
		########################################################

			B.1.1. MAX ChWt

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_ChWt



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_ChWt'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_MAX;
CREATE TABLE Sh.A_ChWt_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_ChWt_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_ChWt
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_ChWt_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_ChWt_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_ChWt_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_ChWt_MAX_PIV




/*   
		########################################################

			B.1.2. Min ChWt

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_ChWt



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_ChWt'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_Min;
CREATE TABLE Sh.A_ChWt_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_ChWt_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_ChWt
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_ChWt_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_ChWt_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_ChWt_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_ChWt_Min_PIV




/*   
		########################################################

			B.1.3. AVG ChWt

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_ChWt



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_ChWt'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_AVG;
CREATE TABLE Sh.A_ChWt_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_ChWt_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_ChWt
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_ChWt_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_ChWt_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_ChWt_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_ChWt_AVG_PIV




/*   
		########################################################

			B.1.4. STDEV ChWt

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_ChWt



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_ChWt'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_AVG;
CREATE TABLE Sh.A_ChWt_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_ChWt_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_ChWt
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_ChWt_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_ChWt_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_ChWt_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_ChWt_STD_PIV







/*   
		########################################################

		B.2. Gas Table 

		########################################################

*/

/*   
		########################################################

			B.2.1. MAX Gas

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_gas



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_gas'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_MAX;
CREATE TABLE Sh.A_gas_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_gas_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_gas
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_gas_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_gas_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_gas_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_gas_MAX_PIV




/*   
		########################################################

			B.2.2. Min gas

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_gas



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_gas'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_gas_Min;
CREATE TABLE Sh.A_gas_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_gas_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_gas
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_gas_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_ChWt_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_ChWt_MAX_PIV
SELECT *
INTO Sh.A_gas_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_gas_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_gas_Min_PIV




/*   
		########################################################

			B.2.3. AVG gas

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_gas



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_gas'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_gas_AVG;
CREATE TABLE Sh.A_gas_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_gas_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_gas
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_gas_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_gas_AVG



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_gas_AVG_PIV
SELECT *
INTO Sh.A_gas_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_gas_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_gas_AVG_PIV




/*   
		########################################################

			B.2.4. STDEV gas

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_gas



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_gas'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_gas_STD;
CREATE TABLE Sh.A_gas_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_gas_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_gas
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_gas_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_gas_STD



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_gas_STD_PIV
SELECT *
INTO Sh.A_gas_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_gas_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_gas_STD_PIV










/*   
		########################################################

		B.3. Hot Water Table 

		########################################################

*/

/*   
		########################################################

			B.3.1. MAX hotwater

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_hotwater



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_hotwater'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_ChWt_MAX;
CREATE TABLE Sh.A_hotwater_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_hotwater_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_hotwater
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_hotwater_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_hotwater_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_hotwater_MAX_PIV
SELECT *
INTO Sh.A_hotwater_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_hotwater_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_hotwater_MAX_PIV




/*   
		########################################################

			B.3.2. Min hotwater

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_hotwater



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_hotwater'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_hotwater_Min;
CREATE TABLE Sh.A_hotwater_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_hotwater_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_hotwater
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_hotwater_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_hotwater_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_hotwater_Min_PIV
SELECT *
INTO Sh.A_hotwater_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_hotwater_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_hotwater_Min_PIV




/*   
		########################################################

			B.3.3. AVG hotwater

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_hotwater



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_hotwater'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_gas_AVG;
CREATE TABLE Sh.A_hotwater_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_hotwater_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_hotwater
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_hotwater_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_hotwater_AVG



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_hotwater_AVG_PIV
SELECT *
INTO Sh.A_hotwater_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_hotwater_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_hotwater_AVG_PIV




/*   
		########################################################

			B.3.4. STDEV hotwater

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_hotwater



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_hotwater'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_hotwater_STD;
CREATE TABLE Sh.A_hotwater_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_hotwater_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_hotwater
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_hotwater_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_hotwater_STD



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_hotwater_STD_PIV
SELECT *
INTO Sh.A_hotwater_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_hotwater_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_hotwater_STD_PIV












/*   
		########################################################

		B.4. steam Table 

		########################################################

*/

/*   
		########################################################

			B.4.1. MAX Stm (steam)

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_Stm



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_Stm'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_Stm_MAX;
CREATE TABLE Sh.A_Stm_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_Stm_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_Stm
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Stm_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Stm_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Stm_MAX_PIV
SELECT *
INTO Sh.A_Stm_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_Stm_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Stm_MAX_PIV




/*   
		########################################################

			B.4.2. Min Stm

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_Stm



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_Stm'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_Stm_Min;
CREATE TABLE Sh.A_Stm_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_Stm_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_Stm
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Stm_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Stm_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Stm_Min_PIV
SELECT *
INTO Sh.A_Stm_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_Stm_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Stm_Min_PIV




/*   
		########################################################

			B.4.3. AVG Stm

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_Stm



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_Stm'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_Stm_AVG;
CREATE TABLE Sh.A_Stm_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_Stm_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_Stm
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Stm_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Stm_AVG



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Stm_AVG_PIV
SELECT *
INTO Sh.A_Stm_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_Stm_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Stm_AVG_PIV




/*   
		########################################################

			B.4.4. STDEV Stm

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_Stm



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_Stm'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_hotwater_STD;
CREATE TABLE Sh.A_Stm_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_Stm_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_Stm
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_Stm_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_Stm_STD



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_Stm_STD_PIV
SELECT *
INTO Sh.A_Stm_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_Stm_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_Stm_STD_PIV















/*   
		########################################################

		B.5a. El_L_640 Table (electricity left 640 columns)

		########################################################

*/

/*   
		########################################################

			B.5a.1. MAX El_L_640

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_El_L_640



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_El_L_640'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_El_L_640_MAX;
CREATE TABLE Sh.A_El_L_640_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_El_L_640_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_El_L_640
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_El_L_640_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_El_L_640_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_El_L_640_MAX_PIV
SELECT *
INTO Sh.A_El_L_640_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_El_L_640_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_El_L_640_MAX_PIV




/*   
		########################################################

			B.5a.2. Min El_L_640

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_El_L_640



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_El_L_640'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_El_L_640_Min;
CREATE TABLE Sh.A_El_L_640_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_El_L_640_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_El_L_640
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_El_L_640_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_El_L_640_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_El_L_640_Min_PIV
SELECT *
INTO Sh.A_El_L_640_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_El_L_640_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_El_L_640_Min_PIV




/*   
		########################################################

			B.5a.3. AVG El_L_640

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_El_L_640



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_El_L_640'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_El_L_640_AVG;
CREATE TABLE Sh.A_El_L_640_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_El_L_640_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_El_L_640
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_El_L_640_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_El_L_640_AVG



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_El_L_640_AVG_PIV
SELECT *
INTO Sh.A_El_L_640_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_El_L_640_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_El_L_640_AVG_PIV




/*   
		########################################################

			B.5a.4. STDEV El_L_640

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_El_L_640



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_El_L_640'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_El_L_640_STD;
CREATE TABLE Sh.A_El_L_640_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_El_L_640_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_El_L_640
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_El_L_640_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_El_L_640_STD



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_El_L_640_STD_PIV
SELECT *
INTO Sh.A_El_L_640_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_El_L_640_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_El_L_640_STD_PIV









/*   
		########################################################

		B.5b. electricity_215_R Table (electricity right 215 columns)

		########################################################

*/

/*   
		########################################################

			B.5b.1. MAX electricity_215_R

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_electricity_215_R



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_electricity_215_R'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_electricity_215_R_MAX;
CREATE TABLE Sh.A_electricity_215_R_MAX (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_electricity_215_R_MAX 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MAX(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_electricity_215_R
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_electricity_215_R_MAX ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_electricity_215_R_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_electricity_215_R_MAX_PIV
SELECT *
INTO Sh.A_electricity_215_R_MAX_PIV
FROM (
		SELECT  *
		FROM Sh.A_electricity_215_R_MAX
	  ) AS SRC
PIVOT(
		MAX(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_electricity_215_R_MAX_PIV




/*   
		########################################################

			B.5b.2. Min electricity_215_R

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_electricity_215_R



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_electricity_215_R'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_electricity_215_R_Min;
CREATE TABLE Sh.A_electricity_215_R_Min (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_electricity_215_R_Min 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, MIN(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_electricity_215_R
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_electricity_215_R_Min ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_electricity_215_R_MAX



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_electricity_215_R_Min_PIV
SELECT *
INTO Sh.A_electricity_215_R_Min_PIV
FROM (
		SELECT  *
		FROM Sh.A_electricity_215_R_Min
	  ) AS SRC
PIVOT(
		MIN(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_electricity_215_R_Min_PIV




/*   
		########################################################

			B.5b.3. AVG electricity_215_R

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_electricity_215_R



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_El_L_640'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_electricity_215_R_AVG;
CREATE TABLE Sh.A_electricity_215_R_AVG (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_electricity_215_R_AVG 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, AVG(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_electricity_215_R
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_electricity_215_R_AVG ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_electricity_215_R_AVG



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_electricity_215_R_AVG_PIV
SELECT *
INTO Sh.A_electricity_215_R_AVG_PIV
FROM (
		SELECT  *
		FROM Sh.A_electricity_215_R_AVG
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_electricity_215_R_AVG_PIV




/*   
		########################################################

			B.5b.4. STDEV electricity_215_R

		########################################################

*/

/*   ^^^^^^^^^^^^^^^  Stage 1 :   Look at the relevant table  ^^^^^^^^^^^^^^^*/
SELECT * FROM Sh.A_electricity_215_R



/*   ^^^^^^^^^^^^^^^  Stage 2 :   Get the relevant table's column names and put into new table with flag column (vstatus)  ^^^^^^^^^^^^^^^*/

--DROP TABLE Sh.COLUMN_NAMES

SELECT COLUMN_NAME, 0 AS vstatus
INTO Sh.COLUMN_NAMES
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'A_electricity_215_R'

SELECT * FROM Sh.COLUMN_NAMES

DELETE FROM Sh.COLUMN_NAMES WHERE ( COLUMN_NAME = 'TmSt') -- Delete the Time Stamp
SELECT * FROM Sh.COLUMN_NAMES


/*   ^^^^^^^^^^^^^^^  Stage 3 :   Put in to vstatus (flag column) 0 (flag down)    ^^^^^*/
UPDATE Sh.COLUMN_NAMES SET vstatus = 0
SELECT * FROM Sh.COLUMN_NAMES




/*   ^^^^^^^^^^^^^^^  Stage 4 :   Creat table for aggregation resulte    ^^^^^^^^^^^^^^^*/

-- DROP TABLE Sh.A_El_L_640_STD;
CREATE TABLE Sh.A_electricity_215_R_STD (Wkn INT, BIDn VARCHAR(50), val_avg FLOAT);



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
	SET @sql = 'INSERT INTO Sh.A_electricity_215_R_STD 
				SELECT DATENAME(WW,TmSt) AS Wkn, ' + CHAR(39) + @bidn + CHAR(39) + ' as BIDn, STDEV(CAST('+ @bidn +' AS FLOAT)) AS val_avg
				FROM Sh.A_electricity_215_R
				WHERE YEAR(TmSt) =2016 
				GROUP BY DATENAME(WW,TmSt)'; 
-- insert line into agg table , the Week Name (number 1-52), the column / building name and the avarge of that Weekly building  consumption form the relevatn table grouped by Week 


    SELECT @bidn;   ---  to check process - like de-bug
	--SELECT @sql;   -- to see result insted of / before using execute... alternative to next row

	EXEC( @sql );   --- run code insted of select@sql if all is OK

	UPDATE Sh.COLUMN_NAMES SET vstatus = 1 WHERE COLUMN_NAME = @bidn;    -- after executing @sql script for one name - set status (flag) as done

	END  -- end of loop


/*   ^^^^^^^^^^^^^^^  Stage 5 :   Look at the resulte aggregation table aggregation  - Delete the Time Stamp and check if it worked properly   ^^^^^^^^^^^^^^^*/


SELECT *  FROM Sh.A_electricity_215_R_STD ORDER BY BIDn,Wkn;  -- veiw filnal table result.
-- DROP TABLE Sh.A_electricity_215_R_STD



/*   ^^^^^^^^^^^^^^^  Stage 6 :   Using Pivot to Traspoze rows to columns - Building Id name as rows and months as lines   ^^^^^^^^^^^^^^^*/

-- pivot the agg table ; transpose lines to columns
--DROP TABLE Sh.A_electricity_215_R_STD_PIV
SELECT *
INTO Sh.A_electricity_215_R_STD_PIV
FROM (
		SELECT  *
		FROM Sh.A_electricity_215_R_STD
	  ) AS SRC
PIVOT(
		AVG(val_avg)
		FOR Wkn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[36],[37],[38],[39],[40],[41],[42],[43],[44],[45],[46],[47],[48],[49],[50],[51],[52],[53])
	 ) AS PIV0 

SELECT * FROM Sh.A_electricity_215_R_STD_PIV


