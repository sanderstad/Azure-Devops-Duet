/*
Description:
Test if the stored procedure dbo.Table6_Delete exists

Changes:
Date		Who					Notes
----------	---					--------------------------------------------------------------
7/14/2020	sstad				Initial test
*/
CREATE PROCEDURE [TestBasic].[test If stored procedure dbo.Table6_Delete exists]
AS
BEGIN
    SET NOCOUNT ON;

    ----- ASSERT -------------------------------------------------
    EXEC tSQLt.AssertObjectExists @ObjectName = N'dbo.Table6_Delete';
END;
