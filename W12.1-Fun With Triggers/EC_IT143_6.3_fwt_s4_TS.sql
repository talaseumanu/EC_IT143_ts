CREATE TRIGGER trg_hello_world_last_mod_by ON t_hello_world
AFTER UPDATE
AS

/********************************************************************************************************
-NAME: dbo.trg_hello_world_last_mod_by
-PURPOSE: Hello World - Last Modified By Trigger

MODIFICATION LOG:
Ver     Date            Author       Description
---     ---------       --------     -----------
1.0     23/10/2023       TSEUMANU     1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
Keep track of who last modified the table
************************************************************************************************************/


	UPDATE dbo.t_hello_world
	       SET
		     last_modified_by = SUSER_NAME()
	WHERE my_message IN
	(
	   SELECT DISTINCT
	          my_message
		FROM Inserted

	);