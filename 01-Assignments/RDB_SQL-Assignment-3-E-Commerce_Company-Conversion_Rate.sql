USE master;

CREATE DATABASE Commerce_Comp;
GO

USE Commerce_Comp;
--DROP TABLE IF EXISTS Actions;

--A: Create above table (Actions) and insert values,
CREATE TABLE Actions(
	Visitor_ID INT IDENTITY(1,1),
	Adv_Type CHAR,
	Action VARCHAR(10)

	CONSTRAINT pk_id PRIMARY KEY (Visitor_ID)
);
GO

SET IDENTITY_INSERT Actions ON;
INSERT Actions (Visitor_ID, Adv_Type, Action)
VALUES
(1, 'A', 'Left'),
(2, 'A', 'Order'),
(3, 'B', 'Left'),
(4, 'A', 'Order'),
(5, 'A', 'Review'),
(6, 'A', 'Left'),
(7, 'B', 'Left'),
(8, 'B', 'Order'),
(9, 'B', 'Review'),
(10, 'A', 'Review')
SET IDENTITY_INSERT Actions OFF;
GO

SELECT * FROM Actions;
GO

--B: Retrieve count of total Actions and Orders for each Advertisement Type
CREATE OR ALTER VIEW actions_and_orders as
SELECT Adv_Type
    ,COUNT(Action) as total_Action
	,SUM (CASE Action WHEN 'Order' THEN 1 ELSE 0 END) as total_order
    --,COUNT(CASE WHEN Action = 'Order' then 1 ELSE NULL END) as count_order
--INTO #count_table
FROM Actions
GROUP BY Adv_Type
GO

--C: Calculate Orders (Conversion) rates for each Advertisement Type by dividing by total count of actions casting as float by multiplying by 1.0.
SELECT	Adv_Type
		,CAST((total_order*1.0/total_Action) AS NUMERIC(10,2)) as Conversion_Rate
FROM	actions_and_orders