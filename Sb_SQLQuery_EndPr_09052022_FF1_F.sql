-- moving to the A_BDG data base 

USE A_BDG
GO

/*
	###########################################################################
F.		Creating the relevant Building Meta data table
		*   The columns with more then 30% nuls were droped
		**  The rows (buildings id) were filtered to yes electricity
			to mach the building meter table
		*** The 11 /19 sites selected in the preview data stage were selected
	###########################################################################
*/
-- DROP TABLE Sh.A_BMD

SELECT  
		building_id AS BID,
		site_id AS [SID],  
		primaryspaceusage AS PrUs,
		sub_primaryspaceusage As SbPrUs,
		sqm,
		lat,
		lng,
		timezone As TmZ,
		electricity As El
INTO Sh.A_BMD
FROM Sh.BMD
WHERE site_id in (
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
	and electricity = 'Yes'
SELECT * FROM Sh.A_BMD
ORDER BY BID


-- F.1. after using electricity column no need for it eny more

ALTER TABLE Sh.A_BMD DROP COLUMN El

SELECT * FROM Sh.A_BMD
ORDER BY BID


-- Delet the building Bobcat_education_Seth that has 4 meters missing data

DELETE FROM Sh.A_BMD WHERE BID='Bobcat_education_Seth'
SELECT * FROM Sh.A_BMD
ORDER BY BID

-- Count site ids  to check match with FF1 meters table just for checking
SELECT [SID], 
COUNT([SID]) AS Sid_C
FROM Sh.A_BMD
GROUP BY [SID]

-- F.2. Creating the BIDn monthly name duplicated BMD table

-- F.2.1 Jan -----------------
SELECT * 
INTO #BMD_Jan
FROM Sh.A_BMD

ALTER TABLE #BMD_Jan ADD BIDm varchar(255)
UPDATE #BMD_Jan
SET BIDm='Jan_'+BID 

SELECT * FROM #BMD_Jan 

-- F.2.2 Feb ------------------
SELECT * 
INTO #BMD_Feb
FROM Sh.A_BMD

ALTER TABLE #BMD_Feb ADD BIDm varchar(255)
UPDATE #BMD_Feb
SET BIDm='Feb_'+BID 

SELECT * FROM #BMD_Feb


-- F.2.3 Mar ------------------
SELECT * 
INTO #BMD_Mar
FROM Sh.A_BMD

ALTER TABLE #BMD_Mar ADD BIDm varchar(255)
UPDATE #BMD_Mar
SET BIDm='Mar_'+BID 

SELECT * FROM #BMD_Mar

-- F.2.4 Apr ------------------
SELECT * 
INTO #BMD_Apr
FROM Sh.A_BMD

ALTER TABLE #BMD_Apr ADD BIDm varchar(255)
UPDATE #BMD_Apr
SET BIDm='Apr_'+BID 

SELECT * FROM #BMD_Apr


-- F.2.5 May ------------------
SELECT * 
INTO #BMD_May
FROM Sh.A_BMD

ALTER TABLE #BMD_May ADD BIDm varchar(255)
UPDATE #BMD_May
SET BIDm='May_'+BID 

SELECT * FROM #BMD_May


-- F.2.6 Jun ------------------
SELECT * 
INTO #BMD_Jun
FROM Sh.A_BMD

ALTER TABLE #BMD_Jun ADD BIDm varchar(255)
UPDATE #BMD_Jun
SET BIDm='Jun_'+BID 

SELECT * FROM #BMD_Jun



-- F.2.7 Jul ------------------
SELECT * 
INTO #BMD_Jul
FROM Sh.A_BMD

ALTER TABLE #BMD_Jul ADD BIDm varchar(255)
UPDATE #BMD_Jul
SET BIDm='Jul_'+BID 

SELECT * FROM #BMD_Jul

-- F.2.8 Aug ------------------
SELECT * 
INTO #BMD_Aug
FROM Sh.A_BMD

ALTER TABLE #BMD_Aug ADD BIDm varchar(255)
UPDATE #BMD_Aug
SET BIDm='Aug_'+BID 

SELECT * FROM #BMD_Aug


-- F.2.9 Sep ------------------
SELECT * 
INTO #BMD_Sep
FROM Sh.A_BMD

ALTER TABLE #BMD_Sep ADD BIDm varchar(255)
UPDATE #BMD_Sep
SET BIDm='Sep_'+BID 

SELECT * FROM #BMD_Sep


-- F.2.10 Oct ------------------
SELECT * 
INTO #BMD_Oct
FROM Sh.A_BMD

ALTER TABLE #BMD_Oct ADD BIDm varchar(255)
UPDATE #BMD_Oct
SET BIDm='Oct_'+BID 

SELECT * FROM #BMD_Oct



-- F.2.11 Nov ------------------
SELECT * 
INTO #BMD_Nov
FROM Sh.A_BMD

ALTER TABLE #BMD_Nov ADD BIDm varchar(255)
UPDATE #BMD_Nov
SET BIDm='Nov_'+BID 

SELECT * FROM #BMD_Nov

-- F.2.12 Dec ------------------
SELECT * 
INTO #BMD_Dec
FROM Sh.A_BMD

ALTER TABLE #BMD_Dec ADD BIDm varchar(255)
UPDATE #BMD_Dec
SET BIDm='Dec_'+BID 

SELECT * FROM #BMD_Dec
-------------------------

-- F.3 connecting all the part tables in to one
INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Feb

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Mar

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Apr

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_May

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Jun

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Jul

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Aug

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Sep

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Oct

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Nov

INSERT INTO #BMD_Jan
SELECT * FROM #BMD_Dec

SELECT * FROM #BMD_Jan

----

/*
		##################################################

F.4		Joining BMD table with duplicate monthly rows (BMD_Jan) 
		with meter parameters summry weekly table (FF1_V)
		In an orderly veiew (first the BMD and then meters)

		###################################################


*/

--- moving from view to temp table to delet Rat building
SELECT * 
INTO #FF1_a
FROM Sh.FF1_V

SELECT * FROM #FF1_a ORDER BY BIDn

DELETE FROM #FF1_a WHERE BIDn LIKE '%_Rat_%'

SELECT * FROM #FF1_a ORDER BY BIDn


--- Creating joining the tables into FF2

SELECT *
INTO #FF2
FROM #FF1_a AS a
LEFT JOIN #BMD_Jan AS b
ON a.BIDn=b.BIDm

--DROP TABLE #FF2
SELECT * FROM #FF2

-- Droping un nesessery column BID
ALTER TABLE #FF2 DROP COLUMN BID

SELECT * FROM #FF2

-- Bringing the BMD to the first columns

--DROP TABLE #FF3
SELECT BIDn,BIDm,[SID] as SIDn,PrUs,SbPrUs,sqm,lat,lng,Tmz
INTO #FF3
FROM #FF2

-- Droping the duble BIDn (=BMDm) column 
ALTER TABLE #FF3 DROP COLUMN BIDn

SELECT * FROM #FF3
SELECT * FROM #FF1_a ORDER BY BIDn

-- Joining the tables in the right order

--DROP TABLE #FF4
SELECT *
INTO #FF4
FROM #FF3 AS a
LEFT JOIN #FF1_a as b
ON a.BIDm=b.BIDn


-- getting the final FF to be used

SELECT *
INTO Sh.BGP_FF
FROM #FF4

SELECT * FROM Sh.BGP_FF


/*   &&&&&&&&&& NOT USED

-- Recreating the Site Id from the BIDn in FF1 table
-- to eneble joinning with BMD table


SELECT BIDn 
INTO #BID		-- temp table to work on
FROM Sh.FF1_V
 
ALTER TABLE #BID ADD SIDn varchar(255) -- add column for result

SELECT * FROM #BID

-- Trimming thte month shortcut
UPDATE #BID 
SET SIDn = SUBSTRING (BIDn, (CHARINDEX('_', BIDn)+1), LEN(BIDn))


-- adding a column to count the length of the site name in the building name
ALTER TABLE #BID ADD SIDn1 varchar(255) 

UPDATE #BID 
SET SIDn1 = CHARINDEX('_', SIDn) -- finding the lenght

-- the final result column
ALTER TABLE #BID ADD SIDn2 varchar(255) 

UPDATE #BID 
SET SIDn2 = SUBSTRING (SIDn, 1, SIDn1-1)  -- the final site id name

-- droping the work colunms
ALTER TABLE #BID DROP COLUMN SIDn, SIDn1 

SELECT * FROM #BID ORDER BY SIDn2






--CREATE VIEW Sh.FF2_V
SELECT a.SIDn2 as SIDn, b.*
INTO #BID2
FROM #BID as a
LEFT JOIN Sh.FF1_V AS b
ON a.BIDn=b.BIDn

SELECT * 
FROM #BID2 as a
LEFT JOIN Sh.A_BMD AS b
ON a.SIDn = b.[SID]

*/





