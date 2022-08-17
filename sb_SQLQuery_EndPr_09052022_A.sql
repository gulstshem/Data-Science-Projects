-- moving to the A_BDG data base 

USE A_BDG
GO

-- View the data uploaded
SELECT * FROM Sh.A_chilledwater_185_L
--DROP TABLE Sh.A_chilledwater_185_L
SELECT * FROM Sh.A_chilledwater_185_M
--DROP TABLE Sh.A_chilledwater_185_M
SELECT * FROM Sh.A_chilledwater_185_R
--DROP TABLE Sh.A_chilledwater_185_R
SELECT * FROM Sh.A_electricity_215_L
SELECT * FROM Sh.A_electricity_215_mL
SELECT * FROM Sh.A_electricity_215_mR
SELECT * FROM Sh.A_electricity_215_R
SELECT * FROM Sh.A_gas
SELECT * FROM Sh.A_hotwater
SELECT * FROM Sh.A_steam_184_L
SELECT * FROM Sh.A_steam_188_R


/*   
    ########################################################
				A. Join the tables part
	########################################################
*/

		--  1. Chilled Water Table

SELECT *
INTO #ChWt1
FROM Sh.A_chilledwater_185_L as A
INNER JOIN Sh.A_chilledwater_185_M As B
ON A.TmSt=B.TmSt_M
ALTER TABLE #ChWt1
DROP COLUMN TmSt_M;

SELECT * FROM #ChWt1
--DROP TABLE #ChWt1



SELECT *
INTO Sh.A_ChWt
FROM #ChWt1 as A
INNER JOIN Sh.A_chilledwater_185_R As B
ON A.TmSt=B.TmSt_R

ALTER TABLE Sh.A_ChWt
DROP COLUMN TmSt_R;

SELECT * FROM Sh.A_ChWt
--DROP TABLE Sh.A_ChWt



			--  2. Steam Table

SELECT *
INTO Sh.A_Stm
FROM Sh.A_steam_184_L as A
INNER JOIN Sh.A_steam_188_R As B
ON A.TmSt=B.TmSt_R
ALTER TABLE Sh.A_Stm
DROP COLUMN TmSt_R;

SELECT * FROM Sh.A_Stm





		--  3. Electricity Table

SELECT *
INTO #El1
FROM Sh.A_electricity_215_L as A
INNER JOIN Sh.A_electricity_215_mL As B
ON A.TmSt=B.TmSt_mL
ALTER TABLE #El1
DROP COLUMN TmSt_mL;

SELECT * FROM #El1

SELECT *
INTO Sh.A_El_L_640
FROM #El1 as A
INNER JOIN Sh.A_electricity_215_mR As B
ON A.TmSt=B.TmSt_mR
ALTER TABLE Sh.A_El_L_640
DROP COLUMN TmSt_mR;

SELECT * FROM Sh.A_El_L_640




/*
SELECT *
INTO Sh.A_El
FROM El2 as A
INNER JOIN Sh.A_electricity_215_R As B
ON A.TmSt=B.TmSt_R

ALTER TABLE Sh.A_El
DROP COLUMN TmSt_R;

SELECT * FROM Sh.A_El
DROP TABLE Sh.A_El

------------  too big - can not create table ... Ussing the last EL (215_R) table as it is.
*/






