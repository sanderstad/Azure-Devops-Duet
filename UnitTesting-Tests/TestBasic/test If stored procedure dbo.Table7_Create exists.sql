/*
Description:
Test if the stored procedure dbo.Table7_Create exists

Changes:
Date		Who					Notes
----------	---					--------------------------------------------------------------
7/14/2020	sstad				Initial test
*/
CREATE PROCEDURE [TestBasic].[test If stored procedure dbo.Table7_Create exists]
AS
BEGIN
    SET NOCOUNT ON;

    ----- ASSERT -------------------------------------------------
    EXEC tSQLt.AssertObjectExists @ObjectName = N'dbo.Table7_Create';
END;
