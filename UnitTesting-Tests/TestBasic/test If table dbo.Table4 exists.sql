/*
Description:
Test if the table dbo.Table4 exists

Changes:
Date		Who					Notes
----------	---					--------------------------------------------------------------
7/14/2020	sstad				Initial test
*/
CREATE PROCEDURE [TestBasic].[test If table dbo.Table4 exists]
AS
BEGIN
    SET NOCOUNT ON;

    ----- ASSERT -------------------------------------------------
    EXEC tSQLt.AssertObjectExists @ObjectName = N'dbo.Table4';
END;
