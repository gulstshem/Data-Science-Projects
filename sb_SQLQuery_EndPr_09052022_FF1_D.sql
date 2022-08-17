/*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	Puting up the Flat File  - 1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
*/


--######### Go to Relevant Data Base

USE A_BDG
GO

--###################################


/*
	###############################################

	D.1 - Connecting all the building months tables to one year table
		as base for Flat file table for each sensor (meter)

	###############################################

*/

-- 		D.1.A   ^^^^^^^    MAX   ^^^^^^

-- D.1.A.1 El   (Done on the El table the that includes max buildings)
SELECT * 
INTO Sh.A_El_Mx
FROM Sh.A_El_Mx_Jan

SELECT * FROM Sh.A_El_Max


INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Feb

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Mar


INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Apr

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_May


INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Jun

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Jul

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Aug


INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Sep

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Oct

INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Nov


INSERT INTO Sh.A_El_Mx
SELECT * FROM Sh.A_El_Mx_Dec


SELECT * FROM Sh.A_El_Mx

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- D.1.A.2 ChWt
SELECT * 
INTO Sh.A_ChWt_Mx
FROM Sh.A_ChWt_MAX_Jan

SELECT * FROM Sh.A_ChWt_Mx


INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Feb

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Mar


INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Apr

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_May


INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Jun

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Jul

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Aug


INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Sep

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Oct

INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Nov


INSERT INTO Sh.A_ChWt_Mx
SELECT * FROM Sh.A_ChWt_MAX_Dec


SELECT * FROM Sh.A_ChWt_Mx



-- D.1.A.3 gas
SELECT * 
INTO Sh.A_gas_Mx
FROM Sh.A_gas_MAX_Jan

SELECT * FROM Sh.A_gas_Mx


INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Feb

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Mar


INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Apr

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_May


INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Jun

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Jul

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Aug


INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Sep

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Oct

INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Nov


INSERT INTO Sh.A_gas_Mx
SELECT * FROM Sh.A_gas_MAX_Dec


SELECT * FROM Sh.A_gas_Mx

-- D.1.A.4 hotwater
SELECT * 
INTO Sh.A_hotwater_Mx
FROM Sh.A_hotwater_MAX_Jan


INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Feb

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Mar


INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Apr

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_May


INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Jun

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Jul

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Aug


INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Sep

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Oct

INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Nov


INSERT INTO Sh.A_hotwater_Mx
SELECT * FROM Sh.A_hotwater_MAX_Dec


SELECT * FROM Sh.A_hotwater_Mx


-- D.1.A.5 Stm
SELECT * 
INTO Sh.A_Stm_Mx
FROM Sh.A_Stm_MAX_Jan


INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Feb

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Mar


INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Apr

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_May


INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Jun

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Jul

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Aug


INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Sep

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Oct

INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Nov


INSERT INTO Sh.A_Stm_Mx
SELECT * FROM Sh.A_Stm_MAX_Dec


SELECT * FROM Sh.A_Stm_Mx






-- 		D.1.B   ^^^^^^^    Min   ^^^^^^

-- D.1.B.1 El   
SELECT * 
INTO Sh.A_El_Mn
FROM Sh.A_El_Min_Jan

SELECT * FROM Sh.A_El_Mn


INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Feb

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Mar


INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Apr

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_May


INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Jun

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Jul

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Aug


INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Sep

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Oct

INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Nov


INSERT INTO Sh.A_El_Mn
SELECT * FROM Sh.A_El_Min_Dec


SELECT * FROM Sh.A_El_Mn

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- D.1.B.2 ChWt
SELECT * 
INTO Sh.A_ChWt_Mn
FROM Sh.A_ChWt_Min_Jan

SELECT * FROM Sh.A_ChWt_Min


INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Feb

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Mar


INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Apr

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_May


INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Jun

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Jul

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Aug


INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Sep

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Oct

INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Nov


INSERT INTO Sh.A_ChWt_Mn
SELECT * FROM Sh.A_ChWt_Min_Dec


SELECT * FROM Sh.A_ChWt_Mn



-- D.1.B.3 gas
SELECT * 
INTO Sh.A_gas_Mn
FROM Sh.A_gas_Min_Jan

SELECT * FROM Sh.A_gas_Mn


INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Feb

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Mar


INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Apr

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_May


INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Jun

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Jul

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Aug


INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Sep

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Oct

INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Nov


INSERT INTO Sh.A_gas_Mn
SELECT * FROM Sh.A_gas_Min_Dec


SELECT * FROM Sh.A_gas_Mn

-- D.1.B.4 hotwater
SELECT * 
INTO Sh.A_hotwater_Mn
FROM Sh.A_hotwater_Min_Jan


INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Feb

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Mar


INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Apr

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_May


INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Jun

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Jul

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Aug


INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Sep

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Oct

INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Nov


INSERT INTO Sh.A_hotwater_Mn
SELECT * FROM Sh.A_hotwater_Min_Dec


SELECT * FROM Sh.A_hotwater_Mn


-- D.1.B.5 Stm
SELECT * 
INTO Sh.A_Stm_Mn
FROM Sh.A_Stm_Min_Jan


INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Feb

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Mar


INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Apr

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_May


INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Jun

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Jul

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Aug


INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Sep

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Oct

INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Nov


INSERT INTO Sh.A_Stm_Mn
SELECT * FROM Sh.A_Stm_Min_Dec


SELECT * FROM Sh.A_Stm_Mn




-- 		D.1.C   ^^^^^^^    AVG   ^^^^^^

-- D.1.C.1 El   
SELECT * 
INTO Sh.A_El_Av
FROM Sh.A_El_AVG_Jan

SELECT * FROM Sh.A_El_Av


INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Feb

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Mar


INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Apr

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_May


INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Jun

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Jul

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Aug


INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Sep

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Oct

INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Nov


INSERT INTO Sh.A_El_Av
SELECT * FROM Sh.A_El_AVG_Dec


SELECT * FROM Sh.A_El_Av

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- D.1.C.2 ChWt
SELECT * 
INTO Sh.A_ChWt_Av
FROM Sh.A_ChWt_AVG_Jan

SELECT * FROM Sh.A_ChWt_AVG


INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Feb

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Mar


INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Apr

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_May


INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Jun

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Jul

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Aug


INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Sep

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Oct

INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Nov


INSERT INTO Sh.A_ChWt_Av
SELECT * FROM Sh.A_ChWt_AVG_Dec


SELECT * FROM Sh.A_ChWt_Av



-- D.1.C.3 gas
SELECT * 
INTO Sh.A_gas_Av
FROM Sh.A_gas_AVG_Jan

SELECT * FROM Sh.A_gas_Av


INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Feb

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Mar


INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Apr

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_May


INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Jun

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Jul

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Aug


INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Sep

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Oct

INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Nov


INSERT INTO Sh.A_gas_Av
SELECT * FROM Sh.A_gas_AVG_Dec


SELECT * FROM Sh.A_gas_Av

-- D.1.C.4 hotwater
SELECT * 
INTO Sh.A_hotwater_Av
FROM Sh.A_hotwater_AVG_Jan


INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Feb

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Mar


INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Apr

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_May


INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Jun

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Jul

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Aug


INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Sep

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Oct

INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Nov


INSERT INTO Sh.A_hotwater_Av
SELECT * FROM Sh.A_hotwater_AVG_Dec


SELECT * FROM Sh.A_hotwater_Av


-- D.1.C.5 Stm
SELECT * 
INTO Sh.A_Stm_Av
FROM Sh.A_Stm_AVG_Jan


INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Feb

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Mar


INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Apr

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_May


INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Jun

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Jul

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Aug


INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Sep

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Oct

INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Nov


INSERT INTO Sh.A_Stm_Av
SELECT * FROM Sh.A_Stm_AVG_Dec


SELECT * FROM Sh.A_Stm_Av



-- 		D.1.D   ^^^^^^^    STD   ^^^^^^

-- D.1.D.1 El   
SELECT * 
INTO Sh.A_El_Sd
FROM Sh.A_El_STD_Jan

SELECT * FROM Sh.A_El_Sd


INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Feb

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Mar


INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Apr

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_May


INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Jun

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Jul

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Aug


INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Sep

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Oct

INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Nov


INSERT INTO Sh.A_El_Sd
SELECT * FROM Sh.A_El_STD_Dec


SELECT * FROM Sh.A_El_Sd

--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- D.1.D.2 ChWt
SELECT * 
INTO Sh.A_ChWt_Sd
FROM Sh.A_ChWt_STD_Jan

SELECT * FROM Sh.A_ChWt_STD


INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Feb

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Mar


INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Apr

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_May


INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Jun

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Jul

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Aug


INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Sep

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Oct

INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Nov


INSERT INTO Sh.A_ChWt_Sd
SELECT * FROM Sh.A_ChWt_STD_Dec


SELECT * FROM Sh.A_ChWt_Sd



-- D.1.D.3 gas
SELECT * 
INTO Sh.A_gas_Sd
FROM Sh.A_gas_STD_Jan

SELECT * FROM Sh.A_gas_Sd


INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Feb

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Mar


INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Apr

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_May


INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Jun

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Jul

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Aug


INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Sep

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Oct

INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Nov


INSERT INTO Sh.A_gas_Sd
SELECT * FROM Sh.A_gas_STD_Dec


SELECT * FROM Sh.A_gas_Sd

-- D.1.D.4 hotwater
SELECT * 
INTO Sh.A_hotwater_Sd
FROM Sh.A_hotwater_STD_Jan


INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Feb

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Mar


INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Apr

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_May


INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Jun

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Jul

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Aug


INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Sep

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Oct

INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Nov


INSERT INTO Sh.A_hotwater_Sd
SELECT * FROM Sh.A_hotwater_STD_Dec


SELECT * FROM Sh.A_hotwater_Sd


-- D.1.D.5 Stm
SELECT * 
INTO Sh.A_Stm_Sd
FROM Sh.A_Stm_STD_Jan


INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Feb

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Mar


INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Apr

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_May


INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Jun

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Jul

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Aug


INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Sep

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Oct

INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Nov


INSERT INTO Sh.A_Stm_Sd
SELECT * FROM Sh.A_Stm_STD_Dec


SELECT * FROM Sh.A_Stm_Sd



/*
	###############################################

	D.2 - Joinning up all parameters of each meter
		  to one table per meter.

	###############################################

*/

-- 		D.2.1   ^^^^^^^    El - Electricity   ^^^^^^


CREATE VIEW Sh.El_V AS
SELECT a.BIDn,
	a.El_Max_W1,
	a.El_Max_W2, 
	a.El_Max_W3, 
	a.El_Max_W4, 
	a.El_Max_W5, 
	b.El_Min_W1, 

	b.El_Min_W2, 
	b.El_Min_W3, 
	b.El_Min_W4, 
	b.El_Min_W5,

	c.El_AVG_W1,
	c.El_AVG_W2, 
	c.El_AVG_W3, 
	c.El_AVG_W4, 
	c.El_AVG_W5, 

	d.El_STD_W1,
	d.El_STD_W2, 
	d.El_STD_W3, 
	d.El_STD_W4, 
	d.El_STD_W5

FROM Sh.A_El_Mx as a
INNER JOIN Sh.A_El_Mn as b
ON a.BIDn=b.BIDn
INNER JOIN Sh.A_El_Av as c
ON a.BIDn=c.BIDn
INNER JOIN Sh.A_El_Sd as d
ON a.BIDn=d.BIDn


SELECT * FROM Sh.El_V



-- 		D.2.2   ^^^^^^^    ChWt - Chilled Water   ^^^^^^


CREATE VIEW Sh.ChWt_V AS
SELECT	a.BIDn,

		a.ChWt_Max_W1,
		a.ChWt_Max_W2, 
		a.ChWt_Max_W3, 
		a.ChWt_Max_W4, 
		a.ChWt_Max_W5, 

		b.ChWt_Min_W1, 
		b.ChWt_Min_W2, 
		b.ChWt_Min_W3, 
		b.ChWt_Min_W4, 
		b.ChWt_Min_W5,

		c.ChWt_AVG_W1,
		c.ChWt_AVG_W2, 
		c.ChWt_AVG_W3, 
		c.ChWt_AVG_W4, 
		c.ChWt_AVG_W5, 

		d.ChWt_STD_W1,
		d.ChWt_STD_W2, 
		d.ChWt_STD_W3, 
		d.ChWt_STD_W4, 
		d.ChWt_STD_W5

FROM Sh.A_ChWt_Mx as a
INNER JOIN Sh.A_ChWt_Mn as b
ON a.BIDn=b.BIDn
INNER JOIN Sh.A_ChWt_Av as c
ON a.BIDn=c.BIDn
INNER JOIN Sh.A_ChWt_Sd as d
ON a.BIDn=d.BIDn


SELECT * FROM Sh.ChWt_V




-- 		D.2.3   ^^^^^^^    gas - Gas   ^^^^^^


CREATE VIEW Sh.gas_V AS
SELECT	a.BIDn,

		a.gas_Max_W1,
		a.gas_Max_W2, 
		a.gas_Max_W3, 
		a.gas_Max_W4, 
		a.gas_Max_W5, 

		b.gas_Min_W1, 
		b.gas_Min_W2, 
		b.gas_Min_W3, 
		b.gas_Min_W4, 
		b.gas_Min_W5,

		c.gas_AVG_W1,
		c.gas_AVG_W2, 
		c.gas_AVG_W3, 
		c.gas_AVG_W4, 
		c.gas_AVG_W5, 

		d.gas_STD_W1,
		d.gas_STD_W2, 
		d.gas_STD_W3, 
		d.gas_STD_W4, 
		d.gas_STD_W5

FROM Sh.A_gas_Mx as a
INNER JOIN Sh.A_gas_Mn as b
ON a.BIDn=b.BIDn
INNER JOIN Sh.A_gas_Av as c
ON a.BIDn=c.BIDn
INNER JOIN Sh.A_gas_Sd as d
ON a.BIDn=d.BIDn


SELECT * FROM Sh.gas_V




-- 		D.2.4   ^^^^^^^    hotwater - Hot Water   ^^^^^^


CREATE VIEW Sh.hotwater_V AS
SELECT	a.BIDn,

		a.hotwater_Max_W1,
		a.hotwater_Max_W2, 
		a.hotwater_Max_W3, 
		a.hotwater_Max_W4, 
		a.hotwater_Max_W5, 

		b.hotwater_Min_W1, 
		b.hotwater_Min_W2, 
		b.hotwater_Min_W3, 
		b.hotwater_Min_W4, 
		b.hotwater_Min_W5,

		c.hotwater_AVG_W1,
		c.hotwater_AVG_W2, 
		c.hotwater_AVG_W3, 
		c.hotwater_AVG_W4, 
		c.hotwater_AVG_W5, 

		d.hotwater_STD_W1,
		d.hotwater_STD_W2, 
		d.hotwater_STD_W3, 
		d.hotwater_STD_W4, 
		d.hotwater_STD_W5

FROM Sh.A_hotwater_Mx as a
INNER JOIN Sh.A_hotwater_Mn as b
ON a.BIDn=b.BIDn
INNER JOIN Sh.A_hotwater_Av as c
ON a.BIDn=c.BIDn
INNER JOIN Sh.A_hotwater_Sd as d
ON a.BIDn=d.BIDn


SELECT * FROM Sh.hotwater_V



-- 		D.2.5   ^^^^^^^    Stm - Steam   ^^^^^^


CREATE VIEW Sh.Stm_V AS
SELECT	a.BIDn,

		a.Stm_Max_W1,
		a.Stm_Max_W2, 
		a.Stm_Max_W3, 
		a.Stm_Max_W4, 
		a.Stm_Max_W5, 

		b.Stm_Min_W1, 
		b.Stm_Min_W2, 
		b.Stm_Min_W3, 
		b.Stm_Min_W4, 
		b.Stm_Min_W5,

		c.Stm_AVG_W1,
		c.Stm_AVG_W2, 
		c.Stm_AVG_W3, 
		c.Stm_AVG_W4, 
		c.Stm_AVG_W5, 

		d.Stm_STD_W1,
		d.Stm_STD_W2, 
		d.Stm_STD_W3, 
		d.Stm_STD_W4, 
		d.Stm_STD_W5

FROM Sh.A_Stm_Mx as a
INNER JOIN Sh.A_Stm_Mn as b
ON a.BIDn=b.BIDn
INNER JOIN Sh.A_Stm_Av as c
ON a.BIDn=c.BIDn
INNER JOIN Sh.A_Stm_Sd as d
ON a.BIDn=d.BIDn


SELECT * FROM Sh.Stm_V





/*
	####################################################

	D.3 - Joinning up all parameter tables to one table

	####################################################

*/

-- 		D.3.1   ^^^^^^^    El - Electricity   whith  ChWt - Chilled Water ^^^^^^


CREATE VIEW Sh.FF1_V AS
SELECT a.BIDn,
	a.El_Max_W1,
	a.El_Max_W2, 
	a.El_Max_W3, 
	a.El_Max_W4, 
	a.El_Max_W5,
	
	a.El_Min_W1, 
	a.El_Min_W2, 
	a.El_Min_W3, 
	a.El_Min_W4, 
	a.El_Min_W5,

	a.El_AVG_W1,
	a.El_AVG_W2, 
	a.El_AVG_W3, 
	a.El_AVG_W4, 
	a.El_AVG_W5, 

	a.El_STD_W1,
	a.El_STD_W2, 
	a.El_STD_W3, 
	a.El_STD_W4, 
	a.El_STD_W5,

	b.ChWt_Max_W1,
	b.ChWt_Max_W2, 
	b.ChWt_Max_W3, 
	b.ChWt_Max_W4, 
	b.ChWt_Max_W5, 

	b.ChWt_Min_W1, 
	b.ChWt_Min_W2, 
	b.ChWt_Min_W3, 
	b.ChWt_Min_W4, 
	b.ChWt_Min_W5,

	b.ChWt_AVG_W1,
	b.ChWt_AVG_W2, 
	b.ChWt_AVG_W3, 
	b.ChWt_AVG_W4, 
	b.ChWt_AVG_W5, 

	b.ChWt_STD_W1,
	b.ChWt_STD_W2, 
	b.ChWt_STD_W3, 
	b.ChWt_STD_W4, 
	b.ChWt_STD_W5,

	c.gas_Max_W1,
	c.gas_Max_W2, 
	c.gas_Max_W3, 
	c.gas_Max_W4, 
	c.gas_Max_W5, 

	c.gas_Min_W1, 
	c.gas_Min_W2, 
	c.gas_Min_W3, 
	c.gas_Min_W4, 
	c.gas_Min_W5,

	c.gas_AVG_W1,
	c.gas_AVG_W2, 
	c.gas_AVG_W3, 
	c.gas_AVG_W4, 
	c.gas_AVG_W5, 

	c.gas_STD_W1,
	c.gas_STD_W2, 
	c.gas_STD_W3, 
	c.gas_STD_W4, 
	c.gas_STD_W5,

	d.hotwater_Max_W1,
	d.hotwater_Max_W2, 
	d.hotwater_Max_W3, 
	d.hotwater_Max_W4, 
	d.hotwater_Max_W5, 

	d.hotwater_Min_W1, 
	d.hotwater_Min_W2, 
	d.hotwater_Min_W3, 
	d.hotwater_Min_W4, 
	d.hotwater_Min_W5,

	d.hotwater_AVG_W1,
	d.hotwater_AVG_W2, 
	d.hotwater_AVG_W3, 
	d.hotwater_AVG_W4, 
	d.hotwater_AVG_W5, 
	
	d.hotwater_STD_W1,
	d.hotwater_STD_W2, 
	d.hotwater_STD_W3, 
	d.hotwater_STD_W4, 
	d.hotwater_STD_W5,

	e.Stm_Max_W1,
	e.Stm_Max_W2, 
	e.Stm_Max_W3, 
	e.Stm_Max_W4, 
	e.Stm_Max_W5, 

	e.Stm_Min_W1, 
	e.Stm_Min_W2, 
	e.Stm_Min_W3, 
	e.Stm_Min_W4, 
	e.Stm_Min_W5,

	e.Stm_AVG_W1,
	e.Stm_AVG_W2, 
	e.Stm_AVG_W3, 
	e.Stm_AVG_W4, 
	e.Stm_AVG_W5, 

	e.Stm_STD_W1,
	e.Stm_STD_W2, 
	e.Stm_STD_W3, 
	e.Stm_STD_W4, 
	e.Stm_STD_W5


FROM Sh.El_V as a
LEFT JOIN Sh.ChWt_V as b
ON a.BIDn=b.BIDn
LEFT JOIN Sh.gas_V as c
ON a.BIDn=c.BIDn
LEFT JOIN Sh.hotwater_V as d
ON a.BIDn=d.BIDn
LEFT JOIN Sh.Stm_V as e
ON a.BIDn=e.BIDn




SELECT * FROM Sh.FF1_V



