-- moving to the A_BDG data base 

USE A_BDG
GO


/*
	################################################
	
	C. Braking piv tables to months creating BIDn+Month

	################################################
*/





/*
			######################################################
	
				C.1.	Calculating the relevant weeks per month
						for spliting the pivot tables to monts

			#######################################################
*/

SELECT DATENAME(WW,TmSt) AS Wkn, MONTH(TmSt) AS Mon
FROM Sh.A_gas
WHERE year(TmSt)=2016
GROUP BY DATENAME(WW,TmSt),MONTH(TmSt) 
ORDER BY MONTH(TmSt)


/*
				Jan, Jul, and Oct of 2016 have 6 weeks (partial weeks)
				all others have 5 weeks, in order to have even 5 weeks per month
				one week (that manifests in the next month) was dropped from them
				The weeks to months brake down is:
								Jan: 1-5, Feb: 6-10, Mar: 10-14, Apr: 14-18, May: 19-23, Jun: 23-27
								Jul: 27-31, Aug: 32-36, Sep: 36-40, Oct: 40-44, Nov: 45-49, Dec: 49-53 

*/

/*
			######################################################
	
				C.2.1 Breaking ChWt Max PIV table	

			#######################################################
*/


-- C.2.1.1  Jan ChWt Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_ChWt_MAX_Jan
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Jan


-- C.2.1.2  Feb ChWt Max PIV table

SELECT BIDn,[6] Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_ChWt_MAX_Feb
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Feb

-- C.2.1.3  Mar ChWt Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_ChWt_MAX_Mar
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Mar

-- C.2.1.4  Apr ChWt Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_ChWt_MAX_Apr
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Apr


-- C.2.1.5  May ChWt Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_ChWt_MAX_May
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_May


-- C.2.1.6  Jun ChWt Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_ChWt_MAX_Jun
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Jun


-- C.2.1.7  Jul ChWt Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_ChWt_MAX_Jul
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Jul


-- C.2.1.8  Aug ChWt Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_ChWt_MAX_Aug
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Aug


-- C.2.1.9  Sep ChWt Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_ChWt_MAX_Sep
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Sep

-- C.2.1.10  Oct ChWt Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_ChWt_MAX_Oct
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Oct

-- C.2.1.11  Nov ChWt Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_ChWt_MAX_Nov
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Nov

-- C.2.1.12  Dec ChWt Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_ChWt_MAX_Dec
FROM Sh.A_ChWt_MAX_PIV
UPDATE Sh.A_ChWt_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_ChWt_MAX_Dec





/*
			######################################################
	
				C.2.2 Breaking ChWt Min PIV table	

			#######################################################
*/


-- C.2.2.1  Jan ChWt Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_ChWt_Min_Jan
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Jan

-- C.2.2.2  Feb ChWt Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_ChWt_Min_Feb
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Feb

-- C.2.2.3  Mar ChWt Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_ChWt_Min_Mar
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Mar

-- C.2.2.4  Apr ChWt Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_ChWt_Min_Apr
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Apr


-- C.2.2.5  May ChWt Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_ChWt_Min_May
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_May

-- C.2.2.6  Jun ChWt Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_ChWt_Min_Jun
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Jun

-- C.2.2.7  Jul ChWt Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_ChWt_Min_Jul
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Jul


-- C.2.2.8  Aug ChWt Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_ChWt_Min_Aug
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Aug


-- C.2.2.9  Sep ChWt Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_ChWt_Min_Sep
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Sep

-- C.2.2.10  Oct ChWt Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_ChWt_Min_Oct
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Oct

-- C.2.2.11  Nov ChWt Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_ChWt_Min_Nov
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Nov

-- C.2.2.12  Dec ChWt Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_ChWt_Min_Dec
FROM Sh.A_ChWt_Min_PIV
UPDATE Sh.A_ChWt_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_ChWt_Min_Dec





/*
			######################################################
	
				C.2.3 Breaking ChWt AVG PIV table	

			#######################################################
*/


-- C.2.3.1  Jan ChWt AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_ChWt_AVG_Jan
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Jan

-- C.2.3.2  Feb ChWt AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_ChWt_AVG_Feb
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Feb

-- C.2.3.3  Mar ChWt AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_ChWt_AVG_Mar
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Mar

-- C.2.3.4  Apr ChWt AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_ChWt_AVG_Apr
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Apr


-- C.2.3.5  May ChWt AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_ChWt_AVG_May
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_May

-- C.2.3.6  Jun ChWt AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_ChWt_AVG_Jun
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Jun

-- C.2.3.7  Jul ChWt AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_ChWt_AVG_Jul
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Jul


-- C.2.3.8  Aug ChWt AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_ChWt_AVG_Aug
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Aug


-- C.2.3.9  Sep ChWt AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_ChWt_AVG_Sep
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Sep

-- C.2.3.10  Oct ChWt AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_ChWt_AVG_Oct
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Oct

-- C.2.3.11  Nov ChWt AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_ChWt_AVG_Nov
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Nov

-- C.2.3.12  Dec ChWt AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_ChWt_AVG_Dec
FROM Sh.A_ChWt_AVG_PIV
UPDATE Sh.A_ChWt_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_ChWt_AVG_Dec





/*
			######################################################
	
				C.2.4 Breaking ChWt STD PIV table	

			#######################################################
*/


-- C.2.4.1  Jan ChWt STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_ChWt_STD_Jan
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Jan

-- C.2.4.2  Feb ChWt STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_ChWt_STD_Feb
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Feb

-- C.2.4.3  Mar ChWt STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_ChWt_STD_Mar
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Mar

-- C.2.4.4  Apr ChWt STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_ChWt_STD_Apr
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Apr


-- C.2.4.5  May ChWt STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_ChWt_STD_May
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_May

-- C.2.4.6  Jun ChWt STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_ChWt_STD_Jun
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Jun

-- C.2.4.7  Jul ChWt STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_ChWt_STD_Jul
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Jul


-- C.2.4.8  Aug ChWt STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_ChWt_STD_Aug
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Aug


-- C.2.4.9  Sep ChWt STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_ChWt_STD_Sep
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Sep

-- C.2.4.10  Oct ChWt STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_ChWt_STD_Oct
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Oct

-- C.2.4.11  Nov ChWt STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_ChWt_STD_Nov
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Nov

-- C.2.4.12  Dec ChWt STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_ChWt_STD_Dec
FROM Sh.A_ChWt_STD_PIV
UPDATE Sh.A_ChWt_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_ChWt_STD_Dec




/*
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C.2a	Changing Wk Week column names to relevant and unique
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
--Jan
EXEC sp_rename 'Sh.A_ChWt_MAX_Jan.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jan.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jan.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jan.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jan.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Jan

EXEC sp_rename 'Sh.A_ChWt_Min_Jan.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jan.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jan.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jan.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jan.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Jan

EXEC sp_rename 'Sh.A_ChWt_AVG_Jan.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jan.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jan.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jan.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jan.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Jan


EXEC sp_rename 'Sh.A_ChWt_STD_Jan.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jan.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jan.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jan.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jan.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Jan

--Feb
EXEC sp_rename 'Sh.A_ChWt_MAX_Feb.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Feb.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Feb.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Feb.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Feb.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Feb

EXEC sp_rename 'Sh.A_ChWt_Min_Feb.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Feb.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Feb.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Feb.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Feb.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Feb

EXEC sp_rename 'Sh.A_ChWt_AVG_Feb.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Feb.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Feb.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Feb.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Feb.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Feb


EXEC sp_rename 'Sh.A_ChWt_STD_Feb.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Feb.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Feb.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Feb.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Feb.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Feb



--Mar

EXEC sp_rename 'Sh.A_ChWt_MAX_Mar.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Mar.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Mar.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Mar.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Mar.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Mar

EXEC sp_rename 'Sh.A_ChWt_Min_Mar.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Mar.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Mar.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Mar.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Mar.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Mar

EXEC sp_rename 'Sh.A_ChWt_AVG_Mar.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Mar.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Mar.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Mar.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Mar.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Mar


EXEC sp_rename 'Sh.A_ChWt_STD_Mar.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Mar.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Mar.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Mar.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Mar.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Mar


--Apr
EXEC sp_rename 'Sh.A_ChWt_MAX_Apr.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Apr.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Apr.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Apr.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Apr.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Apr

EXEC sp_rename 'Sh.A_ChWt_Min_Apr.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Apr.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Apr.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Apr.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Apr.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Apr

EXEC sp_rename 'Sh.A_ChWt_AVG_Apr.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Apr.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Apr.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Apr.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Apr.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Apr


EXEC sp_rename 'Sh.A_ChWt_STD_Apr.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Apr.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Apr.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Apr.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Apr.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Apr



--May

EXEC sp_rename 'Sh.A_ChWt_MAX_May.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_May.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_May.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_May.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_May.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_May

EXEC sp_rename 'Sh.A_ChWt_Min_May.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_May.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_May.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_May.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_May.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_May

EXEC sp_rename 'Sh.A_ChWt_AVG_May.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_May.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_May.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_May.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_May.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_May


EXEC sp_rename 'Sh.A_ChWt_STD_May.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_May.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_May.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_May.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_May.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_May


-- Jun

EXEC sp_rename 'Sh.A_ChWt_MAX_Jun.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jun.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jun.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jun.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jun.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Jun

EXEC sp_rename 'Sh.A_ChWt_Min_Jun.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jun.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jun.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jun.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jun.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Jun

EXEC sp_rename 'Sh.A_ChWt_AVG_Jun.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jun.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jun.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jun.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jun.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Jun


EXEC sp_rename 'Sh.A_ChWt_STD_Jun.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jun.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jun.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jun.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jun.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Jun



-- Jul
EXEC sp_rename 'Sh.A_ChWt_MAX_Jul.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jul.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jul.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jul.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Jul.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Jul

EXEC sp_rename 'Sh.A_ChWt_Min_Jul.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jul.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jul.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jul.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Jul.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Jul

EXEC sp_rename 'Sh.A_ChWt_AVG_Jul.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jul.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jul.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jul.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Jul.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Jul


EXEC sp_rename 'Sh.A_ChWt_STD_Jul.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jul.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jul.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jul.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Jul.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Jul


--Aug

EXEC sp_rename 'Sh.A_ChWt_MAX_Aug.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Aug.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Aug.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Aug.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Aug.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Aug

EXEC sp_rename 'Sh.A_ChWt_Min_Aug.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Aug.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Aug.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Aug.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Aug.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Aug

EXEC sp_rename 'Sh.A_ChWt_AVG_Aug.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Aug.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Aug.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Aug.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Aug.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Aug


EXEC sp_rename 'Sh.A_ChWt_STD_Aug.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Aug.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Aug.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Aug.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Aug.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Aug


-- Sep
EXEC sp_rename 'Sh.A_ChWt_MAX_Sep.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Sep.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Sep.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Sep.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Sep.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Sep

EXEC sp_rename 'Sh.A_ChWt_Min_Sep.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Sep.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Sep.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Sep.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Sep.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Sep

EXEC sp_rename 'Sh.A_ChWt_AVG_Sep.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Sep.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Sep.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Sep.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Sep.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Sep


EXEC sp_rename 'Sh.A_ChWt_STD_Sep.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Sep.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Sep.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Sep.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Sep.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Sep


--Oct
EXEC sp_rename 'Sh.A_ChWt_MAX_Oct.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Oct.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Oct.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Oct.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Oct.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Oct

EXEC sp_rename 'Sh.A_ChWt_Min_Oct.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Oct.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Oct.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Oct.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Oct.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Oct

EXEC sp_rename 'Sh.A_ChWt_AVG_Oct.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Oct.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Oct.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Oct.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Oct.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Oct


EXEC sp_rename 'Sh.A_ChWt_STD_Oct.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Oct.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Oct.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Oct.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Oct.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Oct

--Nov

EXEC sp_rename 'Sh.A_ChWt_MAX_Nov.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Nov.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Nov.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Nov.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Nov.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Nov

EXEC sp_rename 'Sh.A_ChWt_Min_Nov.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Nov.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Nov.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Nov.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Nov.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Nov

EXEC sp_rename 'Sh.A_ChWt_AVG_Nov.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Nov.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Nov.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Nov.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Nov.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Nov


EXEC sp_rename 'Sh.A_ChWt_STD_Nov.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Nov.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Nov.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Nov.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Nov.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Nov



-- Dec

EXEC sp_rename 'Sh.A_ChWt_MAX_Dec.Wk1', 'ChWt_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Dec.Wk2', 'ChWt_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Dec.Wk3', 'ChWt_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Dec.Wk4', 'ChWt_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_MAX_Dec.Wk5', 'ChWt_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_MAX_Dec

EXEC sp_rename 'Sh.A_ChWt_Min_Dec.Wk1', 'ChWt_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Dec.Wk2', 'ChWt_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Dec.Wk3', 'ChWt_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Dec.Wk4', 'ChWt_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_Min_Dec.Wk5', 'ChWt_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_Min_Dec

EXEC sp_rename 'Sh.A_ChWt_AVG_Dec.Wk1', 'ChWt_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Dec.Wk2', 'ChWt_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Dec.Wk3', 'ChWt_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Dec.Wk4', 'ChWt_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_AVG_Dec.Wk5', 'ChWt_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_AVG_Dec


EXEC sp_rename 'Sh.A_ChWt_STD_Dec.Wk1', 'ChWt_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Dec.Wk2', 'ChWt_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Dec.Wk3', 'ChWt_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Dec.Wk4', 'ChWt_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_ChWt_STD_Dec.Wk5', 'ChWt_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_ChWt_STD_Dec











/*
			######################################################
	
				C.3.1 Breaking El_L_640 Max PIV table	

			#######################################################
*/


-- C.3.1.1  Jan El_L_640 Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_El_L_640_MAX_Jan
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Jan

-- C.3.1.2  Feb El_L_640 Max PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_El_L_640_MAX_Feb
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Feb

-- C.3.1.3  Mar El_L_640 Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_El_L_640_MAX_Mar
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Mar

-- C.3.1.4  Apr El_L_640 Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_El_L_640_MAX_Apr
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Apr


-- C.3.1.5  May El_L_640 Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_El_L_640_MAX_May
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_May

-- C.3.1.6  Jun El_L_640 Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_El_L_640_MAX_Jun
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Jun

-- C.3.1.7  Jul El_L_640 Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_El_L_640_MAX_Jul
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Jul


-- C.3.1.8  Aug El_L_640 Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_El_L_640_MAX_Aug
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Aug


-- C.3.1.9  Sep El_L_640 Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_El_L_640_MAX_Sep
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Sep

-- C.3.1.10  Oct El_L_640 Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_El_L_640_MAX_Oct
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Oct

-- C.3.1.11  Nov El_L_640 Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_El_L_640_MAX_Nov
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Nov

-- C.3.1.12  Dec El_L_640 Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_El_L_640_MAX_Dec
FROM Sh.A_El_L_640_MAX_PIV
UPDATE Sh.A_El_L_640_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_El_L_640_MAX_Dec





/*
			######################################################
	
				C.3.2 Breaking El_L_640 Min PIV table	

			#######################################################
*/


-- C.3.2.1  Jan El_L_640 Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_El_L_640_Min_Jan
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Jan

-- C.3.2.2  Feb El_L_640 Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_El_L_640_Min_Feb
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Feb

-- C.3.2.3  Mar El_L_640 Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_El_L_640_Min_Mar
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Mar

-- C.3.2.4  Apr El_L_640 Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_El_L_640_Min_Apr
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Apr


-- C.3.2.5  May El_L_640 Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_El_L_640_Min_May
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_May

-- C.3.2.6  Jun El_L_640 Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_El_L_640_Min_Jun
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Jun

-- C.3.2.7  Jul El_L_640 Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_El_L_640_Min_Jul
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Jul


-- C.3.2.8  Aug El_L_640 Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_El_L_640_Min_Aug
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Aug


-- C.3.2.9  Sep El_L_640 Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_El_L_640_Min_Sep
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Sep

-- C.3.2.10  Oct El_L_640 Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_El_L_640_Min_Oct
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Oct

-- C.3.2.11  Nov El_L_640 Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_El_L_640_Min_Nov
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Nov

-- C.3.2.12  Dec El_L_640 Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_El_L_640_Min_Dec
FROM Sh.A_El_L_640_Min_PIV
UPDATE Sh.A_El_L_640_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_El_L_640_Min_Dec





/*
			######################################################
	
				C.3.3 Breaking El_L_640 AVG PIV table	

			#######################################################
*/


-- C.3.3.1  Jan El_L_640 AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_El_L_640_AVG_Jan
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Jan

-- C.3.3.2  Feb El_L_640 AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_El_L_640_AVG_Feb
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Feb

-- C.3.3.3  Mar El_L_640 AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_El_L_640_AVG_Mar
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Mar

-- C.3.3.4  Apr El_L_640 AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_El_L_640_AVG_Apr
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Apr


-- C.3.3.5  May El_L_640 AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_El_L_640_AVG_May
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_May

-- C.3.3.6  Jun El_L_640 AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_El_L_640_AVG_Jun
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Jun

-- C.3.3.7  Jul El_L_640 AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_El_L_640_AVG_Jul
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Jul


-- C.3.3.8  Aug El_L_640 AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_El_L_640_AVG_Aug
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Aug


-- C.3.3.9  Sep El_L_640 AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_El_L_640_AVG_Sep
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Sep

-- C.3.3.10  Oct El_L_640 AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_El_L_640_AVG_Oct
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Oct

-- C.3.3.11  Nov El_L_640 AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_El_L_640_AVG_Nov
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Nov

-- C.3.3.12  Dec El_L_640 AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_El_L_640_AVG_Dec
FROM Sh.A_El_L_640_AVG_PIV
UPDATE Sh.A_El_L_640_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_El_L_640_AVG_Dec





/*
			######################################################
	
				C.3.4 Breaking El_L_640 STD PIV table	

			#######################################################
*/


-- C.3.4.1  Jan El_L_640 STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_El_L_640_STD_Jan
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Jan

-- C.3.4.2  Feb El_L_640 STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_El_L_640_STD_Feb
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Feb

-- C.3.4.3  Mar El_L_640 STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_El_L_640_STD_Mar
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Mar

-- C.3.4.4  Apr El_L_640 STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_El_L_640_STD_Apr
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Apr


-- C.3.4.5  May El_L_640 STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_El_L_640_STD_May
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_May

-- C.3.4.6  Jun El_L_640 STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_El_L_640_STD_Jun
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Jun

-- C.3.4.7  Jul El_L_640 STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_El_L_640_STD_Jul
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Jul


-- C.3.4.8  Aug El_L_640 STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_El_L_640_STD_Aug
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Aug


-- C.3.4.9  Sep El_L_640 STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_El_L_640_STD_Sep
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Sep

-- C.3.4.10  Oct El_L_640 STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_El_L_640_STD_Oct
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Oct

-- C.3.4.11  Nov El_L_640 STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_El_L_640_STD_Nov
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Nov

-- C.3.4.12  Dec El_L_640 STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_El_L_640_STD_Dec
FROM Sh.A_El_L_640_STD_PIV
UPDATE Sh.A_El_L_640_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_El_L_640_STD_Dec








/*
			######################################################
	
				C.4.1 Breaking electricity_215_R Max PIV table	

			#######################################################
*/


-- C.4.1.1  Jan electricity_215_R Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Jan
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Jan ORDER BY BIDn

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)

SELECT *
INTO Sh.A_El_Mx_Jan
FROM Sh.A_El_L_640_MAX_Jan

INSERT INTO Sh.A_El_Mx_Jan
SELECT * FROM Sh.A_electricity_215_R_MAX_Jan

SELECT * FROM Sh.A_El_Mx_Jan ORDER BY BIDn



-- C.4.1.2  Feb electricity_215_R Max PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Feb
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Feb

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Feb
FROM Sh.A_El_L_640_MAX_Feb

INSERT INTO Sh.A_El_Mx_Feb
SELECT * FROM Sh.A_electricity_215_R_MAX_Feb

SELECT * FROM Sh.A_El_Mx_Feb ORDER BY BIDn


-- C.4.1.3  Mar electricity_215_R Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Mar
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Mar

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Mar
FROM Sh.A_El_L_640_MAX_Mar

INSERT INTO Sh.A_El_Mx_Mar
SELECT * FROM Sh.A_electricity_215_R_MAX_Mar

SELECT * FROM Sh.A_El_Mx_Mar ORDER BY BIDn


-- C.4.1.4  Apr electricity_215_R Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Apr
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Apr

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Apr
FROM Sh.A_El_L_640_MAX_Apr

INSERT INTO Sh.A_El_Mx_Apr
SELECT * FROM Sh.A_electricity_215_R_MAX_Apr

SELECT * FROM Sh.A_El_Mx_Apr ORDER BY BIDn



-- C.4.1.5  May electricity_215_R Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_electricity_215_R_MAX_May
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_May

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_May
FROM Sh.A_El_L_640_MAX_May

INSERT INTO Sh.A_El_Mx_May
SELECT * FROM Sh.A_electricity_215_R_MAX_May

SELECT * FROM Sh.A_El_Mx_May ORDER BY BIDn



-- C.4.1.6  Jun electricity_215_R Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Jun
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Jun

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Jun
FROM Sh.A_El_L_640_MAX_Jun

INSERT INTO Sh.A_El_Mx_Jun
SELECT * FROM Sh.A_electricity_215_R_MAX_Jun

SELECT * FROM Sh.A_El_Mx_Jun ORDER BY BIDn


-- C.4.1.7  Jul electricity_215_R Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Jul
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Jul


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Jul
FROM Sh.A_El_L_640_MAX_Jul

INSERT INTO Sh.A_El_Mx_Jul
SELECT * FROM Sh.A_electricity_215_R_MAX_Jul

SELECT * FROM Sh.A_El_Mx_Jul ORDER BY BIDn



-- C.4.1.8  Aug electricity_215_R Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Aug
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Aug


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Aug
FROM Sh.A_El_L_640_MAX_Aug

INSERT INTO Sh.A_El_Mx_Aug
SELECT * FROM Sh.A_electricity_215_R_MAX_Aug

SELECT * FROM Sh.A_El_Mx_Aug ORDER BY BIDn



-- C.4.1.9  Sep electricity_215_R Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Sep
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Sep

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Sep
FROM Sh.A_El_L_640_MAX_Sep

INSERT INTO Sh.A_El_Mx_Sep
SELECT * FROM Sh.A_electricity_215_R_MAX_Sep

SELECT * FROM Sh.A_El_Mx_Sep ORDER BY BIDn




-- C.4.1.10  Oct electricity_215_R Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Oct
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Oct

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Oct
FROM Sh.A_El_L_640_MAX_Oct

INSERT INTO Sh.A_El_Mx_Oct
SELECT * FROM Sh.A_electricity_215_R_MAX_Oct

SELECT * FROM Sh.A_El_Mx_Oct ORDER BY BIDn


-- C.4.1.11  Nov electricity_215_R Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Nov
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Nov


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Nov
FROM Sh.A_El_L_640_MAX_Nov

INSERT INTO Sh.A_El_Mx_Nov
SELECT * FROM Sh.A_electricity_215_R_MAX_Nov

SELECT * FROM Sh.A_El_Mx_Nov ORDER BY BIDn



-- C.4.1.12  Dec electricity_215_R Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_electricity_215_R_MAX_Dec
FROM Sh.A_electricity_215_R_MAX_PIV
UPDATE Sh.A_electricity_215_R_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_MAX_Dec

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Mx_Dec
FROM Sh.A_El_L_640_MAX_Dec

INSERT INTO Sh.A_El_Mx_Dec
SELECT * FROM Sh.A_electricity_215_R_MAX_Dec

SELECT * FROM Sh.A_El_Mx_Dec ORDER BY BIDn





/*
			######################################################
	
				C.4.2 Breaking electricity_215_R Min PIV table	

			#######################################################
*/


-- C.4.2.1  Jan electricity_215_R Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_electricity_215_R_Min_Jan
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Jan

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Jan
FROM Sh.A_El_L_640_Min_Jan

INSERT INTO Sh.A_El_Min_Jan
SELECT * FROM Sh.A_electricity_215_R_Min_Jan

SELECT * FROM Sh.A_El_Min_Jan ORDER BY BIDn





-- C.4.2.2  Feb electricity_215_R Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_electricity_215_R_Min_Feb
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Feb


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Feb
FROM Sh.A_El_L_640_Min_Feb

INSERT INTO Sh.A_El_Min_Feb
SELECT * FROM Sh.A_electricity_215_R_Min_Feb

SELECT * FROM Sh.A_El_Min_Feb ORDER BY BIDn



-- C.4.2.3  Mar electricity_215_R Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_electricity_215_R_Min_Mar
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Mar

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Mar
FROM Sh.A_El_L_640_Min_Mar

INSERT INTO Sh.A_El_Min_Mar
SELECT * FROM Sh.A_electricity_215_R_Min_Mar

SELECT * FROM Sh.A_El_Min_Mar ORDER BY BIDn





-- C.4.2.4  Apr electricity_215_R Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_electricity_215_R_Min_Apr
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Apr


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Apr
FROM Sh.A_El_L_640_Min_Apr

INSERT INTO Sh.A_El_Min_Apr
SELECT * FROM Sh.A_electricity_215_R_Min_Apr

SELECT * FROM Sh.A_El_Min_Apr ORDER BY BIDn



-- C.4.2.5  May electricity_215_R Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_electricity_215_R_Min_May
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_May


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_May
FROM Sh.A_El_L_640_Min_May

INSERT INTO Sh.A_El_Min_May
SELECT * FROM Sh.A_electricity_215_R_Min_May

SELECT * FROM Sh.A_El_Min_May ORDER BY BIDn



-- C.4.2.6  Jun electricity_215_R Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_electricity_215_R_Min_Jun
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Jun


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Jun
FROM Sh.A_El_L_640_Min_Jun

INSERT INTO Sh.A_El_Min_Jun
SELECT * FROM Sh.A_electricity_215_R_Min_Jun

SELECT * FROM Sh.A_El_Min_Jun ORDER BY BIDn



-- C.4.2.7  Jul electricity_215_R Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_electricity_215_R_Min_Jul
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Jul

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Jul
FROM Sh.A_El_L_640_Min_Jul

INSERT INTO Sh.A_El_Min_Jul
SELECT * FROM Sh.A_electricity_215_R_Min_Jul

SELECT * FROM Sh.A_El_Min_Jul ORDER BY BIDn



-- C.4.2.8  Aug electricity_215_R Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_electricity_215_R_Min_Aug
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Aug

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Aug
FROM Sh.A_El_L_640_Min_Aug

INSERT INTO Sh.A_El_Min_Aug
SELECT * FROM Sh.A_electricity_215_R_Min_Aug

SELECT * FROM Sh.A_El_Min_Aug ORDER BY BIDn



-- C.4.2.9  Sep electricity_215_R Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_electricity_215_R_Min_Sep
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Sep


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Sep
FROM Sh.A_El_L_640_Min_Sep

INSERT INTO Sh.A_El_Min_Sep
SELECT * FROM Sh.A_electricity_215_R_Min_Sep

SELECT * FROM Sh.A_El_Min_Sep ORDER BY BIDn




-- C.4.2.10  Oct electricity_215_R Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_electricity_215_R_Min_Oct
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Oct


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Oct
FROM Sh.A_El_L_640_Min_Oct

INSERT INTO Sh.A_El_Min_Oct
SELECT * FROM Sh.A_electricity_215_R_Min_Oct

SELECT * FROM Sh.A_El_Min_Oct ORDER BY BIDn



-- C.4.2.11  Nov electricity_215_R Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_electricity_215_R_Min_Nov
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Nov


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Nov
FROM Sh.A_El_L_640_Min_Nov

INSERT INTO Sh.A_El_Min_Nov
SELECT * FROM Sh.A_electricity_215_R_Min_Nov

SELECT * FROM Sh.A_El_Min_Nov ORDER BY BIDn



-- C.4.2.12  Dec electricity_215_R Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_electricity_215_R_Min_Dec
FROM Sh.A_electricity_215_R_Min_PIV
UPDATE Sh.A_electricity_215_R_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_Min_Dec


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_Min_Dec
FROM Sh.A_El_L_640_Min_Dec

INSERT INTO Sh.A_El_Min_Dec
SELECT * FROM Sh.A_electricity_215_R_Min_Dec

SELECT * FROM Sh.A_El_Min_Dec ORDER BY BIDn





/*
			######################################################
	
				C.4.3 Breaking electricity_215_R AVG PIV table	

			#######################################################
*/


-- C.4.3.1  Jan electricity_215_R AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Jan
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Jan

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Jan
FROM Sh.A_El_L_640_AVG_Jan

INSERT INTO Sh.A_El_AVG_Jan
SELECT * FROM Sh.A_electricity_215_R_AVG_Jan

SELECT * FROM Sh.A_El_AVG_Jan ORDER BY BIDn







-- C.4.3.2  Feb electricity_215_R AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Feb
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Feb


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Feb
FROM Sh.A_El_L_640_AVG_Feb

INSERT INTO Sh.A_El_AVG_Feb
SELECT * FROM Sh.A_electricity_215_R_AVG_Feb

SELECT * FROM Sh.A_El_AVG_Feb ORDER BY BIDn




-- C.4.3.3  Mar electricity_215_R AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Mar
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Mar


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Mar
FROM Sh.A_El_L_640_AVG_Mar

INSERT INTO Sh.A_El_AVG_Mar
SELECT * FROM Sh.A_electricity_215_R_AVG_Mar

SELECT * FROM Sh.A_El_AVG_Mar ORDER BY BIDn



-- C.4.3.4  Apr electricity_215_R AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Apr
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Apr



--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Apr
FROM Sh.A_El_L_640_AVG_Apr

INSERT INTO Sh.A_El_AVG_Apr
SELECT * FROM Sh.A_electricity_215_R_AVG_Apr

SELECT * FROM Sh.A_El_AVG_Apr ORDER BY BIDn




-- C.4.3.5  May electricity_215_R AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_electricity_215_R_AVG_May
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_May


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_May
FROM Sh.A_El_L_640_AVG_May

INSERT INTO Sh.A_El_AVG_May
SELECT * FROM Sh.A_electricity_215_R_AVG_May

SELECT * FROM Sh.A_El_AVG_May ORDER BY BIDn




-- C.4.3.6  Jun electricity_215_R AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Jun
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Jun


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Jun
FROM Sh.A_El_L_640_AVG_Jun

INSERT INTO Sh.A_El_AVG_Jun
SELECT * FROM Sh.A_electricity_215_R_AVG_Jun

SELECT * FROM Sh.A_El_AVG_Jun ORDER BY BIDn



-- C.4.3.7  Jul electricity_215_R AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Jul
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Jul



--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Jul
FROM Sh.A_El_L_640_AVG_Jul

INSERT INTO Sh.A_El_AVG_Jul
SELECT * FROM Sh.A_electricity_215_R_AVG_Jul

SELECT * FROM Sh.A_El_AVG_Jul ORDER BY BIDn




-- C.4.3.8  Aug electricity_215_R AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Aug
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Aug

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Aug
FROM Sh.A_El_L_640_AVG_Aug

INSERT INTO Sh.A_El_AVG_Aug
SELECT * FROM Sh.A_electricity_215_R_AVG_Aug

SELECT * FROM Sh.A_El_AVG_Aug ORDER BY BIDn




-- C.4.3.9  Sep electricity_215_R AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Sep
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Sep


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Sep
FROM Sh.A_El_L_640_AVG_Sep

INSERT INTO Sh.A_El_AVG_Sep
SELECT * FROM Sh.A_electricity_215_R_AVG_Sep

SELECT * FROM Sh.A_El_AVG_Sep ORDER BY BIDn



-- C.4.3.10  Oct electricity_215_R AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Oct
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Oct


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Oct
FROM Sh.A_El_L_640_AVG_Oct

INSERT INTO Sh.A_El_AVG_Oct
SELECT * FROM Sh.A_electricity_215_R_AVG_Oct

SELECT * FROM Sh.A_El_AVG_Oct ORDER BY BIDn


-- C.4.3.11  Nov electricity_215_R AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Nov
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Nov


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Nov
FROM Sh.A_El_L_640_AVG_Nov

INSERT INTO Sh.A_El_AVG_Nov
SELECT * FROM Sh.A_electricity_215_R_AVG_Nov

SELECT * FROM Sh.A_El_AVG_Nov ORDER BY BIDn


-- C.4.3.12  Dec electricity_215_R AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_electricity_215_R_AVG_Dec
FROM Sh.A_electricity_215_R_AVG_PIV
UPDATE Sh.A_electricity_215_R_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_AVG_Dec

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_AVG_Dec
FROM Sh.A_El_L_640_AVG_Dec

INSERT INTO Sh.A_El_AVG_Dec
SELECT * FROM Sh.A_electricity_215_R_AVG_Dec

SELECT * FROM Sh.A_El_AVG_Dec ORDER BY BIDn



/*
			######################################################
	
				C.4.4 Breaking electricity_215_R STD PIV table	

			#######################################################
*/


-- C.4.4.1  Jan electricity_215_R STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_electricity_215_R_STD_Jan
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Jan




--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Jan
FROM Sh.A_El_L_640_STD_Jan

INSERT INTO Sh.A_El_STD_Jan
SELECT * FROM Sh.A_electricity_215_R_STD_Jan

SELECT * FROM Sh.A_El_STD_Jan ORDER BY BIDn

-- C.4.4.2  Feb electricity_215_R STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_electricity_215_R_STD_Feb
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Feb


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Feb
FROM Sh.A_El_L_640_STD_Feb

INSERT INTO Sh.A_El_STD_Feb
SELECT * FROM Sh.A_electricity_215_R_STD_Feb

SELECT * FROM Sh.A_El_STD_Feb ORDER BY BIDn


-- C.4.4.3  Mar electricity_215_R STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_electricity_215_R_STD_Mar
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Mar




--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Mar
FROM Sh.A_El_L_640_STD_Mar

INSERT INTO Sh.A_El_STD_Mar
SELECT * FROM Sh.A_electricity_215_R_STD_Mar

SELECT * FROM Sh.A_El_STD_Mar ORDER BY BIDn

-- C.4.4.4  Apr electricity_215_R STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_electricity_215_R_STD_Apr
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Apr



--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Apr
FROM Sh.A_El_L_640_STD_Apr

INSERT INTO Sh.A_El_STD_Apr
SELECT * FROM Sh.A_electricity_215_R_STD_Apr

SELECT * FROM Sh.A_El_STD_Apr ORDER BY BIDn



-- C.4.4.5  May electricity_215_R STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_electricity_215_R_STD_May
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_May



--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_May
FROM Sh.A_El_L_640_STD_May

INSERT INTO Sh.A_El_STD_May
SELECT * FROM Sh.A_electricity_215_R_STD_May

SELECT * FROM Sh.A_El_STD_May ORDER BY BIDn



-- C.4.4.6  Jun electricity_215_R STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_electricity_215_R_STD_Jun
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Jun


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Jun
FROM Sh.A_El_L_640_STD_Jun

INSERT INTO Sh.A_El_STD_Jun
SELECT * FROM Sh.A_electricity_215_R_STD_Jun

SELECT * FROM Sh.A_El_STD_Jun ORDER BY BIDn




-- C.4.4.7  Jul electricity_215_R STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_electricity_215_R_STD_Jul
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Jul


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Jul
FROM Sh.A_El_L_640_STD_Jul

INSERT INTO Sh.A_El_STD_Jul
SELECT * FROM Sh.A_electricity_215_R_STD_Jul

SELECT * FROM Sh.A_El_STD_Jul ORDER BY BIDn



-- C.4.4.8  Aug electricity_215_R STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_electricity_215_R_STD_Aug
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Aug


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Aug
FROM Sh.A_El_L_640_STD_Aug

INSERT INTO Sh.A_El_STD_Aug
SELECT * FROM Sh.A_electricity_215_R_STD_Aug

SELECT * FROM Sh.A_El_STD_Aug ORDER BY BIDn


-- C.4.4.9  Sep electricity_215_R STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_electricity_215_R_STD_Sep
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Sep



--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Sep
FROM Sh.A_El_L_640_STD_Sep

INSERT INTO Sh.A_El_STD_Sep
SELECT * FROM Sh.A_electricity_215_R_STD_Sep

SELECT * FROM Sh.A_El_STD_Sep ORDER BY BIDn




-- C.4.4.10  Oct electricity_215_R STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_electricity_215_R_STD_Oct
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Oct


--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Oct
FROM Sh.A_El_L_640_STD_Oct

INSERT INTO Sh.A_El_STD_Oct
SELECT * FROM Sh.A_electricity_215_R_STD_Oct

SELECT * FROM Sh.A_El_STD_Oct ORDER BY BIDn



-- C.4.4.11  Nov electricity_215_R STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_electricity_215_R_STD_Nov
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Nov

--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Nov
FROM Sh.A_El_L_640_STD_Nov

INSERT INTO Sh.A_El_STD_Nov
SELECT * FROM Sh.A_electricity_215_R_STD_Nov

SELECT * FROM Sh.A_El_STD_Nov ORDER BY BIDn


-- C.4.4.12  Dec electricity_215_R STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_electricity_215_R_STD_Dec
FROM Sh.A_electricity_215_R_STD_PIV
UPDATE Sh.A_electricity_215_R_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_electricity_215_R_STD_Dec




--- Connecting El_L_640 Whith  Sh.A_electricity_215_R in to one El Table Sh.A_El
--- (This is due to limitation in the MySql studio for 644 columns wher 858 needed)
SELECT *
INTO Sh.A_El_STD_Dec
FROM Sh.A_El_L_640_STD_Dec

INSERT INTO Sh.A_El_STD_Dec
SELECT * FROM Sh.A_electricity_215_R_STD_Dec

SELECT * FROM Sh.A_El_STD_Dec ORDER BY BIDn


/*
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C.4a	Changing Wk Week column names to relevant and unique
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
--Jan
EXEC sp_rename 'Sh.A_El_Mx_Jan.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jan.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jan.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jan.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jan.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Jan

EXEC sp_rename 'Sh.A_El_Min_Jan.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jan.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jan.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jan.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jan.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Jan

EXEC sp_rename 'Sh.A_El_AVG_Jan.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jan.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jan.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jan.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jan.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Jan


EXEC sp_rename 'Sh.A_El_STD_Jan.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jan.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jan.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jan.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jan.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Jan

--Feb
EXEC sp_rename 'Sh.A_El_Mx_Feb.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Feb.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Feb.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Feb.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Feb.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Feb

EXEC sp_rename 'Sh.A_El_Min_Feb.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Feb.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Feb.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Feb.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Feb.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Feb

EXEC sp_rename 'Sh.A_El_AVG_Feb.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Feb.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Feb.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Feb.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Feb.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Feb


EXEC sp_rename 'Sh.A_El_STD_Feb.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Feb.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Feb.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Feb.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Feb.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Feb



--Mar

EXEC sp_rename 'Sh.A_El_Mx_Mar.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Mar.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Mar.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Mar.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Mar.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Mar

EXEC sp_rename 'Sh.A_El_Min_Mar.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Mar.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Mar.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Mar.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Mar.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Mar

EXEC sp_rename 'Sh.A_El_AVG_Mar.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Mar.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Mar.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Mar.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Mar.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Mar


EXEC sp_rename 'Sh.A_El_STD_Mar.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Mar.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Mar.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Mar.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Mar.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Mar


--Apr
EXEC sp_rename 'Sh.A_El_Mx_Apr.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Apr.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Apr.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Apr.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Apr.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Apr

EXEC sp_rename 'Sh.A_El_Min_Apr.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Apr.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Apr.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Apr.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Apr.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Apr

EXEC sp_rename 'Sh.A_El_AVG_Apr.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Apr.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Apr.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Apr.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Apr.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Apr


EXEC sp_rename 'Sh.A_El_STD_Apr.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Apr.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Apr.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Apr.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Apr.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Apr



--May

EXEC sp_rename 'Sh.A_El_Mx_May.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_May.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_May.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_May.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_May.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_May

EXEC sp_rename 'Sh.A_El_Min_May.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_May.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_May.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_May.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_May.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_May

EXEC sp_rename 'Sh.A_El_AVG_May.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_May.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_May.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_May.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_May.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_May


EXEC sp_rename 'Sh.A_El_STD_May.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_May.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_May.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_May.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_May.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_May


-- Jun

EXEC sp_rename 'Sh.A_El_Mx_Jun.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jun.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jun.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jun.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jun.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Jun

EXEC sp_rename 'Sh.A_El_Min_Jun.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jun.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jun.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jun.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jun.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Jun

EXEC sp_rename 'Sh.A_El_AVG_Jun.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jun.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jun.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jun.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jun.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Jun


EXEC sp_rename 'Sh.A_El_STD_Jun.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jun.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jun.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jun.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jun.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Jun



-- Jul
EXEC sp_rename 'Sh.A_El_Mx_Jul.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jul.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jul.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jul.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Jul.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Jul

EXEC sp_rename 'Sh.A_El_Min_Jul.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jul.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jul.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jul.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Jul.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Jul

EXEC sp_rename 'Sh.A_El_AVG_Jul.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jul.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jul.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jul.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Jul.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Jul


EXEC sp_rename 'Sh.A_El_STD_Jul.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jul.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jul.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jul.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Jul.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Jul


--Aug

EXEC sp_rename 'Sh.A_El_Mx_Aug.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Aug.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Aug.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Aug.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Aug.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Aug

EXEC sp_rename 'Sh.A_El_Min_Aug.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Aug.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Aug.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Aug.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Aug.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Aug

EXEC sp_rename 'Sh.A_El_AVG_Aug.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Aug.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Aug.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Aug.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Aug.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Aug


EXEC sp_rename 'Sh.A_El_STD_Aug.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Aug.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Aug.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Aug.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Aug.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Aug


-- Sep
EXEC sp_rename 'Sh.A_El_Mx_Sep.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Sep.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Sep.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Sep.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Sep.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Sep

EXEC sp_rename 'Sh.A_El_Min_Sep.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Sep.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Sep.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Sep.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Sep.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Sep

EXEC sp_rename 'Sh.A_El_AVG_Sep.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Sep.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Sep.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Sep.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Sep.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Sep


EXEC sp_rename 'Sh.A_El_STD_Sep.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Sep.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Sep.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Sep.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Sep.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Sep


--Oct
EXEC sp_rename 'Sh.A_El_Mx_Oct.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Oct.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Oct.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Oct.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Oct.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Oct

EXEC sp_rename 'Sh.A_El_Min_Oct.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Oct.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Oct.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Oct.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Oct.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Oct

EXEC sp_rename 'Sh.A_El_AVG_Oct.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Oct.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Oct.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Oct.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Oct.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Oct


EXEC sp_rename 'Sh.A_El_STD_Oct.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Oct.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Oct.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Oct.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Oct.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Oct

--Nov

EXEC sp_rename 'Sh.A_El_Mx_Nov.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Nov.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Nov.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Nov.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Nov.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Nov

EXEC sp_rename 'Sh.A_El_Min_Nov.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Nov.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Nov.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Nov.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Nov.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Nov

EXEC sp_rename 'Sh.A_El_AVG_Nov.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Nov.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Nov.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Nov.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Nov.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Nov


EXEC sp_rename 'Sh.A_El_STD_Nov.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Nov.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Nov.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Nov.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Nov.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Nov



-- Dec

EXEC sp_rename 'Sh.A_El_Mx_Dec.Wk1', 'El_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Dec.Wk2', 'El_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Dec.Wk3', 'El_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Dec.Wk4', 'El_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Mx_Dec.Wk5', 'El_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Mx_Dec

EXEC sp_rename 'Sh.A_El_Min_Dec.Wk1', 'El_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Dec.Wk2', 'El_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Dec.Wk3', 'El_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Dec.Wk4', 'El_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_Min_Dec.Wk5', 'El_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_El_Min_Dec

EXEC sp_rename 'Sh.A_El_AVG_Dec.Wk1', 'El_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Dec.Wk2', 'El_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Dec.Wk3', 'El_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Dec.Wk4', 'El_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_AVG_Dec.Wk5', 'El_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_El_AVG_Dec


EXEC sp_rename 'Sh.A_El_STD_Dec.Wk1', 'El_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Dec.Wk2', 'El_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Dec.Wk3', 'El_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Dec.Wk4', 'El_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_El_STD_Dec.Wk5', 'El_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_El_STD_Dec


/*
			######################################################
	
				C.5.1 Breaking gas Max PIV table	

			#######################################################
*/


-- C.5.1.1  Jan gas Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_gas_MAX_Jan
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Jan

-- C.5.1.2  Feb gas Max PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_gas_MAX_Feb
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Feb

-- C.5.1.3  Mar gas Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_gas_MAX_Mar
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Mar

-- C.5.1.4  Apr gas Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_gas_MAX_Apr
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Apr


-- C.5.1.5  May gas Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_gas_MAX_May
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_gas_MAX_May

-- C.5.1.6  Jun gas Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_gas_MAX_Jun
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Jun

-- C.5.1.7  Jul gas Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_gas_MAX_Jul
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Jul


-- C.5.1.8  Aug gas Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_gas_MAX_Aug
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Aug


-- C.5.1.9  Sep gas Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_gas_MAX_Sep
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Sep

-- C.5.1.10  Oct gas Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_gas_MAX_Oct
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Oct

-- C.5.1.11  Nov gas Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_gas_MAX_Nov
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Nov

-- C.5.1.12  Dec gas Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_gas_MAX_Dec
FROM Sh.A_gas_MAX_PIV
UPDATE Sh.A_gas_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_gas_MAX_Dec





/*
			######################################################
	
				C.5.2 Breaking gas Min PIV table	

			#######################################################
*/


-- C.5.2.1  Jan gas Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_gas_Min_Jan
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_gas_Min_Jan

-- C.5.2.2  Feb gas Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_gas_Min_Feb
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_gas_Min_Feb

-- C.5.2.3  Mar gas Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_gas_Min_Mar
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_gas_Min_Mar

-- C.5.2.4  Apr gas Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_gas_Min_Apr
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_gas_Min_Apr


-- C.5.2.5  May gas Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_gas_Min_May
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_gas_Min_May

-- C.5.2.6  Jun gas Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_gas_Min_Jun
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_gas_Min_Jun

-- C.5.2.7  Jul gas Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_gas_Min_Jul
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_gas_Min_Jul


-- C.5.2.8  Aug gas Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_gas_Min_Aug
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_gas_Min_Aug


-- C.5.2.9  Sep gas Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_gas_Min_Sep
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_gas_Min_Sep

-- C.5.2.10  Oct gas Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_gas_Min_Oct
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_gas_Min_Oct

-- C.5.2.11  Nov gas Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_gas_Min_Nov
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_gas_Min_Nov

-- C.5.2.12  Dec gas Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_gas_Min_Dec
FROM Sh.A_gas_Min_PIV
UPDATE Sh.A_gas_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_gas_Min_Dec





/*
			######################################################
	
				C.5.3 Breaking gas AVG PIV table	

			#######################################################
*/


-- C.5.3.1  Jan gas AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_gas_AVG_Jan
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Jan

-- C.5.3.2  Feb gas AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_gas_AVG_Feb
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Feb

-- C.5.3.3  Mar gas AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_gas_AVG_Mar
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Mar

-- C.5.3.4  Apr gas AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_gas_AVG_Apr
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Apr


-- C.5.3.5  May gas AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_gas_AVG_May
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_gas_AVG_May

-- C.5.3.6  Jun gas AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_gas_AVG_Jun
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Jun

-- C.5.3.7  Jul gas AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_gas_AVG_Jul
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Jul


-- C.5.3.8  Aug gas AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_gas_AVG_Aug
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Aug


-- C.5.3.9  Sep gas AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_gas_AVG_Sep
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Sep

-- C.5.3.10  Oct gas AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_gas_AVG_Oct
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Oct

-- C.5.3.11  Nov gas AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_gas_AVG_Nov
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Nov

-- C.5.3.12  Dec gas AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_gas_AVG_Dec
FROM Sh.A_gas_AVG_PIV
UPDATE Sh.A_gas_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_gas_AVG_Dec





/*
			######################################################
	
				C.5.4 Breaking gas STD PIV table	

			#######################################################
*/


-- C.5.4.1  Jan gas STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_gas_STD_Jan
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_gas_STD_Jan

-- C.5.4.2  Feb gas STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_gas_STD_Feb
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_gas_STD_Feb

-- C.5.4.3  Mar gas STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_gas_STD_Mar
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_gas_STD_Mar

-- C.5.4.4  Apr gas STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_gas_STD_Apr
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_gas_STD_Apr


-- C.5.4.5  May gas STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_gas_STD_May
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_gas_STD_May

-- C.5.4.6  Jun gas STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_gas_STD_Jun
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_gas_STD_Jun

-- C.5.4.7  Jul gas STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_gas_STD_Jul
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_gas_STD_Jul


-- C.5.4.8  Aug gas STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_gas_STD_Aug
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_gas_STD_Aug


-- C.5.4.9  Sep gas STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_gas_STD_Sep
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_gas_STD_Sep

-- C.5.4.10  Oct gas STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_gas_STD_Oct
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_gas_STD_Oct

-- C.5.4.11  Nov gas STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_gas_STD_Nov
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_gas_STD_Nov

-- C.5.4.12  Dec gas STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_gas_STD_Dec
FROM Sh.A_gas_STD_PIV
UPDATE Sh.A_gas_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_gas_STD_Dec




/*
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C.5a	Changing Wk Week column names to relevant and unique
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
--Jan
EXEC sp_rename 'Sh.A_gas_MAX_Jan.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jan.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jan.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jan.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jan.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Jan

EXEC sp_rename 'Sh.A_gas_Min_Jan.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jan.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jan.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jan.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jan.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Jan

EXEC sp_rename 'Sh.A_gas_AVG_Jan.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jan.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jan.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jan.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jan.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Jan


EXEC sp_rename 'Sh.A_gas_STD_Jan.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jan.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jan.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jan.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jan.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Jan

--Feb
EXEC sp_rename 'Sh.A_gas_MAX_Feb.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Feb.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Feb.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Feb.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Feb.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Feb

EXEC sp_rename 'Sh.A_gas_Min_Feb.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Feb.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Feb.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Feb.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Feb.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Feb

EXEC sp_rename 'Sh.A_gas_AVG_Feb.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Feb.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Feb.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Feb.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Feb.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Feb


EXEC sp_rename 'Sh.A_gas_STD_Feb.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Feb.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Feb.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Feb.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Feb.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Feb



--Mar

EXEC sp_rename 'Sh.A_gas_MAX_Mar.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Mar.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Mar.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Mar.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Mar.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Mar

EXEC sp_rename 'Sh.A_gas_Min_Mar.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Mar.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Mar.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Mar.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Mar.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Mar

EXEC sp_rename 'Sh.A_gas_AVG_Mar.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Mar.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Mar.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Mar.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Mar.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Mar


EXEC sp_rename 'Sh.A_gas_STD_Mar.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Mar.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Mar.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Mar.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Mar.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Mar


--Apr
EXEC sp_rename 'Sh.A_gas_MAX_Apr.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Apr.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Apr.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Apr.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Apr.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Apr

EXEC sp_rename 'Sh.A_gas_Min_Apr.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Apr.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Apr.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Apr.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Apr.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Apr

EXEC sp_rename 'Sh.A_gas_AVG_Apr.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Apr.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Apr.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Apr.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Apr.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Apr


EXEC sp_rename 'Sh.A_gas_STD_Apr.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Apr.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Apr.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Apr.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Apr.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Apr



--May

EXEC sp_rename 'Sh.A_gas_MAX_May.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_May.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_May.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_May.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_May.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_May

EXEC sp_rename 'Sh.A_gas_Min_May.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_May.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_May.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_May.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_May.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_May

EXEC sp_rename 'Sh.A_gas_AVG_May.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_May.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_May.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_May.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_May.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_May


EXEC sp_rename 'Sh.A_gas_STD_May.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_May.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_May.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_May.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_May.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_May


-- Jun

EXEC sp_rename 'Sh.A_gas_MAX_Jun.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jun.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jun.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jun.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jun.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Jun

EXEC sp_rename 'Sh.A_gas_Min_Jun.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jun.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jun.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jun.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jun.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Jun

EXEC sp_rename 'Sh.A_gas_AVG_Jun.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jun.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jun.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jun.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jun.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Jun


EXEC sp_rename 'Sh.A_gas_STD_Jun.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jun.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jun.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jun.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jun.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Jun



-- Jul
EXEC sp_rename 'Sh.A_gas_MAX_Jul.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jul.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jul.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jul.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Jul.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Jul

EXEC sp_rename 'Sh.A_gas_Min_Jul.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jul.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jul.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jul.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Jul.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Jul

EXEC sp_rename 'Sh.A_gas_AVG_Jul.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jul.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jul.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jul.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Jul.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Jul


EXEC sp_rename 'Sh.A_gas_STD_Jul.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jul.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jul.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jul.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Jul.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Jul


--Aug

EXEC sp_rename 'Sh.A_gas_MAX_Aug.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Aug.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Aug.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Aug.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Aug.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Aug

EXEC sp_rename 'Sh.A_gas_Min_Aug.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Aug.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Aug.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Aug.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Aug.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Aug

EXEC sp_rename 'Sh.A_gas_AVG_Aug.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Aug.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Aug.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Aug.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Aug.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Aug


EXEC sp_rename 'Sh.A_gas_STD_Aug.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Aug.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Aug.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Aug.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Aug.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Aug


-- Sep
EXEC sp_rename 'Sh.A_gas_MAX_Sep.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Sep.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Sep.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Sep.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Sep.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Sep

EXEC sp_rename 'Sh.A_gas_Min_Sep.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Sep.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Sep.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Sep.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Sep.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Sep

EXEC sp_rename 'Sh.A_gas_AVG_Sep.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Sep.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Sep.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Sep.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Sep.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Sep


EXEC sp_rename 'Sh.A_gas_STD_Sep.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Sep.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Sep.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Sep.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Sep.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Sep


--Oct
EXEC sp_rename 'Sh.A_gas_MAX_Oct.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Oct.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Oct.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Oct.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Oct.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Oct

EXEC sp_rename 'Sh.A_gas_Min_Oct.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Oct.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Oct.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Oct.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Oct.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Oct

EXEC sp_rename 'Sh.A_gas_AVG_Oct.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Oct.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Oct.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Oct.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Oct.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Oct


EXEC sp_rename 'Sh.A_gas_STD_Oct.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Oct.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Oct.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Oct.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Oct.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Oct

--Nov

EXEC sp_rename 'Sh.A_gas_MAX_Nov.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Nov.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Nov.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Nov.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Nov.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Nov

EXEC sp_rename 'Sh.A_gas_Min_Nov.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Nov.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Nov.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Nov.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Nov.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Nov

EXEC sp_rename 'Sh.A_gas_AVG_Nov.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Nov.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Nov.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Nov.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Nov.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Nov


EXEC sp_rename 'Sh.A_gas_STD_Nov.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Nov.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Nov.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Nov.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Nov.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Nov



-- Dec

EXEC sp_rename 'Sh.A_gas_MAX_Dec.Wk1', 'gas_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Dec.Wk2', 'gas_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Dec.Wk3', 'gas_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Dec.Wk4', 'gas_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_MAX_Dec.Wk5', 'gas_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_MAX_Dec

EXEC sp_rename 'Sh.A_gas_Min_Dec.Wk1', 'gas_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Dec.Wk2', 'gas_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Dec.Wk3', 'gas_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Dec.Wk4', 'gas_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_Min_Dec.Wk5', 'gas_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_Min_Dec

EXEC sp_rename 'Sh.A_gas_AVG_Dec.Wk1', 'gas_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Dec.Wk2', 'gas_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Dec.Wk3', 'gas_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Dec.Wk4', 'gas_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_AVG_Dec.Wk5', 'gas_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_AVG_Dec


EXEC sp_rename 'Sh.A_gas_STD_Dec.Wk1', 'gas_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Dec.Wk2', 'gas_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Dec.Wk3', 'gas_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Dec.Wk4', 'gas_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_gas_STD_Dec.Wk5', 'gas_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_gas_STD_Dec









/*
			######################################################
	
				C.6.1 Breaking hotwater Max PIV table	

			#######################################################
*/


-- C.6.1.1  Jan hotwater Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_hotwater_MAX_Jan
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Jan

-- C.6.1.2  Feb hotwater Max PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_hotwater_MAX_Feb
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Feb

-- C.6.1.3  Mar hotwater Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_hotwater_MAX_Mar
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Mar

-- C.6.1.4  Apr hotwater Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_hotwater_MAX_Apr
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Apr


-- C.6.1.5  May hotwater Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_hotwater_MAX_May
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_May

-- C.6.1.6  Jun hotwater Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_hotwater_MAX_Jun
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Jun

-- C.6.1.7  Jul hotwater Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_hotwater_MAX_Jul
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Jul


-- C.6.1.8  Aug hotwater Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_hotwater_MAX_Aug
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Aug


-- C.6.1.9  Sep hotwater Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_hotwater_MAX_Sep
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Sep

-- C.6.1.10  Oct hotwater Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_hotwater_MAX_Oct
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Oct

-- C.6.1.11  Nov hotwater Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_hotwater_MAX_Nov
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Nov

-- C.6.1.12  Dec hotwater Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_hotwater_MAX_Dec
FROM Sh.A_hotwater_MAX_PIV
UPDATE Sh.A_hotwater_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_hotwater_MAX_Dec





/*
			######################################################
	
				C.6.2 Breaking hotwater Min PIV table	

			#######################################################
*/


-- C.6.2.1  Jan hotwater Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_hotwater_Min_Jan
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Jan

-- C.6.2.2  Feb hotwater Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_hotwater_Min_Feb
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Feb

-- C.6.2.3  Mar hotwater Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_hotwater_Min_Mar
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Mar

-- C.6.2.4  Apr hotwater Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_hotwater_Min_Apr
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Apr


-- C.6.2.5  May hotwater Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_hotwater_Min_May
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_May

-- C.6.2.6  Jun hotwater Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_hotwater_Min_Jun
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Jun

-- C.6.2.7  Jul hotwater Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_hotwater_Min_Jul
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Jul


-- C.6.2.8  Aug hotwater Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_hotwater_Min_Aug
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Aug


-- C.6.2.9  Sep hotwater Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_hotwater_Min_Sep
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Sep

-- C.6.2.10  Oct hotwater Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_hotwater_Min_Oct
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Oct

-- C.6.2.11  Nov hotwater Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_hotwater_Min_Nov
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Nov

-- C.6.2.12  Dec hotwater Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_hotwater_Min_Dec
FROM Sh.A_hotwater_Min_PIV
UPDATE Sh.A_hotwater_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_hotwater_Min_Dec





/*
			######################################################
	
				C.6.3 Breaking hotwater AVG PIV table	

			#######################################################
*/


-- C.6.3.1  Jan hotwater AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_hotwater_AVG_Jan
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Jan

-- C.6.3.2  Feb hotwater AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_hotwater_AVG_Feb
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Feb

-- C.6.3.3  Mar hotwater AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_hotwater_AVG_Mar
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Mar

-- C.6.3.4  Apr hotwater AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_hotwater_AVG_Apr
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Apr


-- C.6.3.5  May hotwater AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_hotwater_AVG_May
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_May

-- C.6.3.6  Jun hotwater AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_hotwater_AVG_Jun
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Jun

-- C.6.3.7  Jul hotwater AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_hotwater_AVG_Jul
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Jul


-- C.6.3.8  Aug hotwater AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_hotwater_AVG_Aug
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Aug


-- C.6.3.9  Sep hotwater AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_hotwater_AVG_Sep
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Sep

-- C.6.3.10  Oct hotwater AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_hotwater_AVG_Oct
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Oct

-- C.6.3.11  Nov hotwater AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_hotwater_AVG_Nov
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Nov

-- C.6.3.12  Dec hotwater AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_hotwater_AVG_Dec
FROM Sh.A_hotwater_AVG_PIV
UPDATE Sh.A_hotwater_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_hotwater_AVG_Dec





/*
			######################################################
	
				C.6.4 Breaking hotwater STD PIV table	

			#######################################################
*/


-- C.6.4.1  Jan hotwater STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_hotwater_STD_Jan
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Jan

-- C.6.4.2  Feb hotwater STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_hotwater_STD_Feb
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Feb

-- C.6.4.3  Mar hotwater STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_hotwater_STD_Mar
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Mar

-- C.6.4.4  Apr hotwater STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_hotwater_STD_Apr
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Apr


-- C.6.4.5  May hotwater STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_hotwater_STD_May
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_May

-- C.6.4.6  Jun hotwater STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_hotwater_STD_Jun
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Jun

-- C.6.4.7  Jul hotwater STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_hotwater_STD_Jul
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Jul


-- C.6.4.8  Aug hotwater STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_hotwater_STD_Aug
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Aug


-- C.6.4.9  Sep hotwater STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_hotwater_STD_Sep
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Sep

-- C.6.4.10  Oct hotwater STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_hotwater_STD_Oct
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Oct

-- C.6.4.11  Nov hotwater STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_hotwater_STD_Nov
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Nov

-- C.6.4.12  Dec hotwater STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_hotwater_STD_Dec
FROM Sh.A_hotwater_STD_PIV
UPDATE Sh.A_hotwater_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_hotwater_STD_Dec






/*
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C.6a	Changing Wk Week column names to relevant and unique
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
--Jan
EXEC sp_rename 'Sh.A_hotwater_MAX_Jan.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jan.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jan.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jan.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jan.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Jan

EXEC sp_rename 'Sh.A_hotwater_Min_Jan.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jan.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jan.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jan.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jan.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Jan

EXEC sp_rename 'Sh.A_hotwater_AVG_Jan.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jan.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jan.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jan.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jan.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Jan


EXEC sp_rename 'Sh.A_hotwater_STD_Jan.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jan.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jan.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jan.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jan.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Jan

--Feb
EXEC sp_rename 'Sh.A_hotwater_MAX_Feb.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Feb.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Feb.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Feb.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Feb.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Feb

EXEC sp_rename 'Sh.A_hotwater_Min_Feb.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Feb.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Feb.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Feb.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Feb.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Feb

EXEC sp_rename 'Sh.A_hotwater_AVG_Feb.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Feb.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Feb.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Feb.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Feb.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Feb


EXEC sp_rename 'Sh.A_hotwater_STD_Feb.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Feb.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Feb.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Feb.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Feb.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Feb



--Mar

EXEC sp_rename 'Sh.A_hotwater_MAX_Mar.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Mar.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Mar.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Mar.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Mar.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Mar

EXEC sp_rename 'Sh.A_hotwater_Min_Mar.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Mar.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Mar.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Mar.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Mar.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Mar

EXEC sp_rename 'Sh.A_hotwater_AVG_Mar.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Mar.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Mar.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Mar.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Mar.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Mar


EXEC sp_rename 'Sh.A_hotwater_STD_Mar.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Mar.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Mar.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Mar.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Mar.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Mar


--Apr
EXEC sp_rename 'Sh.A_hotwater_MAX_Apr.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Apr.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Apr.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Apr.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Apr.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Apr

EXEC sp_rename 'Sh.A_hotwater_Min_Apr.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Apr.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Apr.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Apr.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Apr.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Apr

EXEC sp_rename 'Sh.A_hotwater_AVG_Apr.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Apr.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Apr.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Apr.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Apr.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Apr


EXEC sp_rename 'Sh.A_hotwater_STD_Apr.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Apr.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Apr.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Apr.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Apr.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Apr



--May

EXEC sp_rename 'Sh.A_hotwater_MAX_May.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_May.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_May.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_May.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_May.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_May

EXEC sp_rename 'Sh.A_hotwater_Min_May.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_May.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_May.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_May.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_May.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_May

EXEC sp_rename 'Sh.A_hotwater_AVG_May.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_May.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_May.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_May.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_May.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_May


EXEC sp_rename 'Sh.A_hotwater_STD_May.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_May.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_May.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_May.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_May.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_May


-- Jun

EXEC sp_rename 'Sh.A_hotwater_MAX_Jun.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jun.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jun.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jun.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jun.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Jun

EXEC sp_rename 'Sh.A_hotwater_Min_Jun.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jun.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jun.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jun.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jun.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Jun

EXEC sp_rename 'Sh.A_hotwater_AVG_Jun.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jun.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jun.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jun.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jun.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Jun


EXEC sp_rename 'Sh.A_hotwater_STD_Jun.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jun.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jun.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jun.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jun.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Jun



-- Jul
EXEC sp_rename 'Sh.A_hotwater_MAX_Jul.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jul.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jul.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jul.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Jul.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Jul

EXEC sp_rename 'Sh.A_hotwater_Min_Jul.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jul.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jul.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jul.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Jul.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Jul

EXEC sp_rename 'Sh.A_hotwater_AVG_Jul.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jul.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jul.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jul.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Jul.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Jul


EXEC sp_rename 'Sh.A_hotwater_STD_Jul.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jul.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jul.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jul.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Jul.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Jul


--Aug

EXEC sp_rename 'Sh.A_hotwater_MAX_Aug.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Aug.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Aug.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Aug.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Aug.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Aug

EXEC sp_rename 'Sh.A_hotwater_Min_Aug.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Aug.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Aug.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Aug.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Aug.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Aug

EXEC sp_rename 'Sh.A_hotwater_AVG_Aug.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Aug.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Aug.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Aug.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Aug.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Aug


EXEC sp_rename 'Sh.A_hotwater_STD_Aug.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Aug.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Aug.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Aug.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Aug.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Aug


-- Sep
EXEC sp_rename 'Sh.A_hotwater_MAX_Sep.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Sep.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Sep.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Sep.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Sep.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Sep

EXEC sp_rename 'Sh.A_hotwater_Min_Sep.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Sep.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Sep.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Sep.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Sep.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Sep

EXEC sp_rename 'Sh.A_hotwater_AVG_Sep.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Sep.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Sep.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Sep.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Sep.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Sep


EXEC sp_rename 'Sh.A_hotwater_STD_Sep.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Sep.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Sep.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Sep.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Sep.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Sep


--Oct
EXEC sp_rename 'Sh.A_hotwater_MAX_Oct.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Oct.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Oct.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Oct.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Oct.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Oct

EXEC sp_rename 'Sh.A_hotwater_Min_Oct.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Oct.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Oct.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Oct.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Oct.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Oct

EXEC sp_rename 'Sh.A_hotwater_AVG_Oct.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Oct.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Oct.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Oct.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Oct.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Oct


EXEC sp_rename 'Sh.A_hotwater_STD_Oct.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Oct.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Oct.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Oct.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Oct.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Oct

--Nov

EXEC sp_rename 'Sh.A_hotwater_MAX_Nov.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Nov.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Nov.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Nov.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Nov.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Nov

EXEC sp_rename 'Sh.A_hotwater_Min_Nov.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Nov.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Nov.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Nov.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Nov.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Nov

EXEC sp_rename 'Sh.A_hotwater_AVG_Nov.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Nov.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Nov.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Nov.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Nov.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Nov


EXEC sp_rename 'Sh.A_hotwater_STD_Nov.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Nov.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Nov.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Nov.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Nov.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Nov



-- Dec

EXEC sp_rename 'Sh.A_hotwater_MAX_Dec.Wk1', 'hotwater_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Dec.Wk2', 'hotwater_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Dec.Wk3', 'hotwater_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Dec.Wk4', 'hotwater_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_MAX_Dec.Wk5', 'hotwater_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_MAX_Dec

EXEC sp_rename 'Sh.A_hotwater_Min_Dec.Wk1', 'hotwater_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Dec.Wk2', 'hotwater_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Dec.Wk3', 'hotwater_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Dec.Wk4', 'hotwater_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_Min_Dec.Wk5', 'hotwater_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_Min_Dec

EXEC sp_rename 'Sh.A_hotwater_AVG_Dec.Wk1', 'hotwater_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Dec.Wk2', 'hotwater_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Dec.Wk3', 'hotwater_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Dec.Wk4', 'hotwater_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_AVG_Dec.Wk5', 'hotwater_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_AVG_Dec


EXEC sp_rename 'Sh.A_hotwater_STD_Dec.Wk1', 'hotwater_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Dec.Wk2', 'hotwater_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Dec.Wk3', 'hotwater_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Dec.Wk4', 'hotwater_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_hotwater_STD_Dec.Wk5', 'hotwater_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_hotwater_STD_Dec







/*
			######################################################
	
				C.7.1 Breaking Stm Max PIV table	

			#######################################################
*/


-- C.7.1.1  Jan Stm Max PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_Stm_MAX_Jan
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Jan

-- C.7.1.2  Feb Stm Max PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_Stm_MAX_Feb
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Feb

-- C.7.1.3  Mar Stm Max PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_Stm_MAX_Mar
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Mar

-- C.7.1.4  Apr Stm Max PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_Stm_MAX_Apr
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Apr


-- C.7.1.5  May Stm Max PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_Stm_MAX_May
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_May

-- C.7.1.6  Jun Stm Max PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_Stm_MAX_Jun
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Jun

-- C.7.1.7  Jul Stm Max PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_Stm_MAX_Jul
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Jul


-- C.7.1.8  Aug Stm Max PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_Stm_MAX_Aug
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Aug


-- C.7.1.9  Sep Stm Max PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_Stm_MAX_Sep
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Sep

-- C.7.1.10  Oct Stm Max PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_Stm_MAX_Oct
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Oct

-- C.7.1.11  Nov Stm Max PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_Stm_MAX_Nov
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Nov

-- C.7.1.12  Dec Stm Max PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_Stm_MAX_Dec
FROM Sh.A_Stm_MAX_PIV
UPDATE Sh.A_Stm_MAX_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_Stm_MAX_Dec





/*
			######################################################
	
				C.7.2 Breaking Stm Min PIV table	

			#######################################################
*/


-- C.7.2.1  Jan Stm Min PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_Stm_Min_Jan
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Jan

-- C.7.2.2  Feb Stm Min PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_Stm_Min_Feb
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Feb

-- C.7.2.3  Mar Stm Min PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_Stm_Min_Mar
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Mar

-- C.7.2.4  Apr Stm Min PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_Stm_Min_Apr
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Apr


-- C.7.2.5  May Stm Min PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_Stm_Min_May
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_Stm_Min_May

-- C.7.2.6  Jun Stm Min PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_Stm_Min_Jun
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Jun

-- C.7.2.7  Jul Stm Min PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_Stm_Min_Jul
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Jul


-- C.7.2.8  Aug Stm Min PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_Stm_Min_Aug
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Aug


-- C.7.2.9  Sep Stm Min PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_Stm_Min_Sep
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Sep

-- C.7.2.10  Oct Stm Min PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_Stm_Min_Oct
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Oct

-- C.7.2.11  Nov Stm Min PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_Stm_Min_Nov
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Nov

-- C.7.2.12  Dec Stm Min PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_Stm_Min_Dec
FROM Sh.A_Stm_Min_PIV
UPDATE Sh.A_Stm_Min_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_Stm_Min_Dec





/*
			######################################################
	
				C.7.3 Breaking Stm AVG PIV table	

			#######################################################
*/


-- C.7.3.1  Jan Stm AVG PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_Stm_AVG_Jan
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Jan

-- C.7.3.2  Feb Stm AVG PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_Stm_AVG_Feb
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Feb

-- C.7.3.3  Mar Stm AVG PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_Stm_AVG_Mar
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Mar

-- C.7.3.4  Apr Stm AVG PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_Stm_AVG_Apr
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Apr


-- C.7.3.5  May Stm AVG PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_Stm_AVG_May
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_May

-- C.7.3.6  Jun Stm AVG PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_Stm_AVG_Jun
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Jun

-- C.7.3.7  Jul Stm AVG PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_Stm_AVG_Jul
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Jul


-- C.7.3.8  Aug Stm AVG PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_Stm_AVG_Aug
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Aug


-- C.7.3.9  Sep Stm AVG PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_Stm_AVG_Sep
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Sep

-- C.7.3.10  Oct Stm AVG PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_Stm_AVG_Oct
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Oct

-- C.7.3.11  Nov Stm AVG PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_Stm_AVG_Nov
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Nov

-- C.7.3.12  Dec Stm AVG PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_Stm_AVG_Dec
FROM Sh.A_Stm_AVG_PIV
UPDATE Sh.A_Stm_AVG_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_Stm_AVG_Dec





/*
			######################################################
	
				C.7.4 Breaking Stm STD PIV table	

			#######################################################
*/


-- C.7.4.1  Jan Stm STD PIV table

SELECT BIDn,[1] AS Wk1,[2] AS Wk2,[3] AS Wk3,[4] AS Wk4,[5] AS Wk5
INTO Sh.A_Stm_STD_Jan
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Jan SET BIDn = 'Jan_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Jan

-- C.7.4.2  Feb Stm STD PIV table

SELECT BIDn,[6] AS Wk1,[7] AS Wk2,[8] AS Wk3,[9] AS Wk4,[10] AS Wk5
INTO Sh.A_Stm_STD_Feb
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Feb SET BIDn = 'Feb_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Feb

-- C.7.4.3  Mar Stm STD PIV table

SELECT BIDn,[10] AS Wk1,[11] AS Wk2,[12] AS Wk3,[13] AS Wk4,[14] AS Wk5
INTO Sh.A_Stm_STD_Mar
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Mar SET BIDn = 'Mar_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Mar

-- C.7.4.4  Apr Stm STD PIV table

SELECT BIDn,[14] AS Wk1,[15] AS Wk2,[16] AS Wk3,[17] AS Wk4,[18] AS Wk5
INTO Sh.A_Stm_STD_Apr
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Apr SET BIDn = 'Apr_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Apr


-- C.7.4.5  May Stm STD PIV table

SELECT BIDn,[19] AS Wk1,[20] AS Wk2,[21] AS Wk3,[22] AS Wk4,[23] AS Wk5
INTO Sh.A_Stm_STD_May
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_May SET BIDn = 'May_'+BIDn

SELECT * FROM Sh.A_Stm_STD_May

-- C.7.4.6  Jun Stm STD PIV table

SELECT BIDn,[23] AS Wk1,[24] AS Wk2,[25] AS Wk3,[26] AS Wk4,[27] AS Wk5
INTO Sh.A_Stm_STD_Jun
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Jun SET BIDn = 'Jun_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Jun

-- C.7.4.7  Jul Stm STD PIV table

SELECT BIDn,[27] AS Wk1,[28] AS Wk2,[29] AS Wk3,[30] AS Wk4,[31] AS Wk5
INTO Sh.A_Stm_STD_Jul
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Jul SET BIDn = 'Jul_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Jul


-- C.7.4.8  Aug Stm STD PIV table

SELECT BIDn,[32] AS Wk1,[33] AS Wk2,[34] AS Wk3,[35] AS Wk4,[36] AS Wk5
INTO Sh.A_Stm_STD_Aug
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Aug SET BIDn = 'Aug_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Aug


-- C.7.4.9  Sep Stm STD PIV table

SELECT BIDn,[36] AS Wk1,[37] AS Wk2,[38] AS Wk3,[39] AS Wk4,[40] AS Wk5
INTO Sh.A_Stm_STD_Sep
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Sep SET BIDn = 'Sep_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Sep

-- C.7.4.10  Oct Stm STD PIV table

SELECT BIDn,[40] AS Wk1,[41] AS Wk2,[42] AS Wk3,[43] AS Wk4,[44] AS Wk5
INTO Sh.A_Stm_STD_Oct
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Oct SET BIDn = 'Oct_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Oct

-- C.7.4.11  Nov Stm STD PIV table

SELECT BIDn,[45] AS Wk1,[46] AS Wk2,[47] AS Wk3,[48] AS Wk4,[49] AS Wk5
INTO Sh.A_Stm_STD_Nov
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Nov SET BIDn = 'Nov_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Nov

-- C.7.4.12  Dec Stm STD PIV table

SELECT BIDn,[49] AS Wk1,[50] AS Wk2,[51] AS Wk3,[52] AS Wk4,[53] AS Wk5
INTO Sh.A_Stm_STD_Dec
FROM Sh.A_Stm_STD_PIV
UPDATE Sh.A_Stm_STD_Dec SET BIDn = 'Dec_'+BIDn

SELECT * FROM Sh.A_Stm_STD_Dec




/*
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C.7a	Changing Wk Week column names to relevant and unique
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/
--Jan
EXEC sp_rename 'Sh.A_Stm_MAX_Jan.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jan.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jan.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jan.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jan.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Jan

EXEC sp_rename 'Sh.A_Stm_Min_Jan.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jan.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jan.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jan.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jan.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Jan

EXEC sp_rename 'Sh.A_Stm_AVG_Jan.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jan.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jan.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jan.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jan.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Jan


EXEC sp_rename 'Sh.A_Stm_STD_Jan.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jan.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jan.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jan.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jan.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Jan

--Feb
EXEC sp_rename 'Sh.A_Stm_MAX_Feb.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Feb.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Feb.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Feb.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Feb.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Feb

EXEC sp_rename 'Sh.A_Stm_Min_Feb.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Feb.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Feb.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Feb.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Feb.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Feb

EXEC sp_rename 'Sh.A_Stm_AVG_Feb.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Feb.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Feb.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Feb.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Feb.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Feb


EXEC sp_rename 'Sh.A_Stm_STD_Feb.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Feb.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Feb.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Feb.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Feb.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Feb



--Mar

EXEC sp_rename 'Sh.A_Stm_MAX_Mar.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Mar.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Mar.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Mar.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Mar.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Mar

EXEC sp_rename 'Sh.A_Stm_Min_Mar.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Mar.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Mar.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Mar.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Mar.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Mar

EXEC sp_rename 'Sh.A_Stm_AVG_Mar.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Mar.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Mar.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Mar.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Mar.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Mar


EXEC sp_rename 'Sh.A_Stm_STD_Mar.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Mar.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Mar.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Mar.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Mar.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Mar


--Apr
EXEC sp_rename 'Sh.A_Stm_MAX_Apr.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Apr.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Apr.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Apr.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Apr.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Apr

EXEC sp_rename 'Sh.A_Stm_Min_Apr.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Apr.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Apr.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Apr.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Apr.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Apr

EXEC sp_rename 'Sh.A_Stm_AVG_Apr.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Apr.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Apr.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Apr.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Apr.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Apr


EXEC sp_rename 'Sh.A_Stm_STD_Apr.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Apr.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Apr.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Apr.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Apr.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Apr



--May

EXEC sp_rename 'Sh.A_Stm_MAX_May.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_May.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_May.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_May.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_May.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_May

EXEC sp_rename 'Sh.A_Stm_Min_May.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_May.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_May.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_May.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_May.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_May

EXEC sp_rename 'Sh.A_Stm_AVG_May.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_May.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_May.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_May.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_May.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_May


EXEC sp_rename 'Sh.A_Stm_STD_May.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_May.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_May.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_May.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_May.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_May


-- Jun

EXEC sp_rename 'Sh.A_Stm_MAX_Jun.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jun.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jun.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jun.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jun.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Jun

EXEC sp_rename 'Sh.A_Stm_Min_Jun.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jun.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jun.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jun.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jun.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Jun

EXEC sp_rename 'Sh.A_Stm_AVG_Jun.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jun.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jun.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jun.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jun.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Jun


EXEC sp_rename 'Sh.A_Stm_STD_Jun.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jun.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jun.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jun.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jun.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Jun



-- Jul
EXEC sp_rename 'Sh.A_Stm_MAX_Jul.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jul.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jul.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jul.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Jul.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Jul

EXEC sp_rename 'Sh.A_Stm_Min_Jul.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jul.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jul.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jul.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Jul.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Jul

EXEC sp_rename 'Sh.A_Stm_AVG_Jul.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jul.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jul.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jul.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Jul.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Jul


EXEC sp_rename 'Sh.A_Stm_STD_Jul.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jul.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jul.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jul.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Jul.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Jul


--Aug

EXEC sp_rename 'Sh.A_Stm_MAX_Aug.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Aug.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Aug.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Aug.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Aug.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Aug

EXEC sp_rename 'Sh.A_Stm_Min_Aug.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Aug.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Aug.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Aug.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Aug.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Aug

EXEC sp_rename 'Sh.A_Stm_AVG_Aug.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Aug.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Aug.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Aug.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Aug.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Aug


EXEC sp_rename 'Sh.A_Stm_STD_Aug.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Aug.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Aug.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Aug.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Aug.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Aug


-- Sep
EXEC sp_rename 'Sh.A_Stm_MAX_Sep.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Sep.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Sep.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Sep.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Sep.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Sep

EXEC sp_rename 'Sh.A_Stm_Min_Sep.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Sep.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Sep.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Sep.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Sep.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Sep

EXEC sp_rename 'Sh.A_Stm_AVG_Sep.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Sep.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Sep.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Sep.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Sep.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Sep


EXEC sp_rename 'Sh.A_Stm_STD_Sep.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Sep.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Sep.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Sep.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Sep.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Sep


--Oct
EXEC sp_rename 'Sh.A_Stm_MAX_Oct.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Oct.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Oct.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Oct.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Oct.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Oct

EXEC sp_rename 'Sh.A_Stm_Min_Oct.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Oct.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Oct.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Oct.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Oct.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Oct

EXEC sp_rename 'Sh.A_Stm_AVG_Oct.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Oct.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Oct.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Oct.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Oct.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Oct


EXEC sp_rename 'Sh.A_Stm_STD_Oct.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Oct.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Oct.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Oct.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Oct.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Oct

--Nov

EXEC sp_rename 'Sh.A_Stm_MAX_Nov.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Nov.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Nov.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Nov.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Nov.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Nov

EXEC sp_rename 'Sh.A_Stm_Min_Nov.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Nov.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Nov.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Nov.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Nov.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Nov

EXEC sp_rename 'Sh.A_Stm_AVG_Nov.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Nov.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Nov.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Nov.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Nov.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Nov


EXEC sp_rename 'Sh.A_Stm_STD_Nov.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Nov.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Nov.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Nov.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Nov.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Nov



-- Dec

EXEC sp_rename 'Sh.A_Stm_MAX_Dec.Wk1', 'Stm_Max_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Dec.Wk2', 'Stm_Max_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Dec.Wk3', 'Stm_Max_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Dec.Wk4', 'Stm_Max_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_MAX_Dec.Wk5', 'Stm_Max_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_MAX_Dec

EXEC sp_rename 'Sh.A_Stm_Min_Dec.Wk1', 'Stm_Min_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Dec.Wk2', 'Stm_Min_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Dec.Wk3', 'Stm_Min_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Dec.Wk4', 'Stm_Min_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_Min_Dec.Wk5', 'Stm_Min_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_Min_Dec

EXEC sp_rename 'Sh.A_Stm_AVG_Dec.Wk1', 'Stm_AVG_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Dec.Wk2', 'Stm_AVG_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Dec.Wk3', 'Stm_AVG_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Dec.Wk4', 'Stm_AVG_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_AVG_Dec.Wk5', 'Stm_AVG_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_AVG_Dec


EXEC sp_rename 'Sh.A_Stm_STD_Dec.Wk1', 'Stm_STD_W1', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Dec.Wk2', 'Stm_STD_W2', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Dec.Wk3', 'Stm_STD_W3', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Dec.Wk4', 'Stm_STD_W4', 'COLUMN'
EXEC sp_rename 'Sh.A_Stm_STD_Dec.Wk5', 'Stm_STD_W5', 'COLUMN'

SELECT * FROM Sh.A_Stm_STD_Dec


