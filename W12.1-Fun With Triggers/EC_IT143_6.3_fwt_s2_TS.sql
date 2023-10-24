-- Q1: How to keep track of who a record was last modified by?
-- A1: This works for the initial INSERT...

--ALTER TABLE dbo.t_hello_world
--ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();

--Q2: How to keep track of who a record was last modified by
--A2: Use after update trigger?