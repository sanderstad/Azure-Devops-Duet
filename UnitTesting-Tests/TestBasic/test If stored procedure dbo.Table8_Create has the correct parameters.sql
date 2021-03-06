/*
Description:

Test if the procedure has the correct parameters

Changes:
Date		Who						Notes
----------	---						--------------------------------------------------------------
7/14/2020	sstad				Initial procedure
*/
CREATE PROCEDURE [TestBasic].[test If stored procedure dbo.Table8_Create has the correct parameters]
AS
BEGIN
    SET NOCOUNT ON;

    ----- ASSEMBLE -----------------------------------------------
    -- Create the tables
    CREATE TABLE #actual
    (
        [ParameterName] NVARCHAR(128) NOT NULL,
        [DataType] sysname NOT NULL,
        [MaxLength] SMALLINT NOT NULL,
        [Precision] TINYINT NOT NULL,
        [Scale] TINYINT NOT NULL
    );

    CREATE TABLE #expected
    (
        [ParameterName] NVARCHAR(128) NOT NULL,
        [DataType] sysname NOT NULL,
        [MaxLength] SMALLINT NOT NULL,
        [Precision] TINYINT NOT NULL,
        [Scale] TINYINT NOT NULL
    );

    INSERT INTO #expected
    (
        ParameterName,
        DataType,
        MaxLength,
        Precision,
        Scale
    )
    VALUES
	('@param1', 'varchar', 100, 0, 0),
	('@param2', 'varchar', 100, 0, 0),
	('@param3', 'varchar', 100, 0, 0),
	('@param4', 'varchar', 100, 0, 0),
	('@param5', 'varchar', 100, 0, 0),
	('@param6', 'varchar', 100, 0, 0),
	('@param7', 'varchar', 100, 0, 0),
	('@param8', 'varchar', 100, 0, 0),
	('@param9', 'varchar', 100, 0, 0),
	('@param10', 'varchar', 100, 0, 0),
	('@param11', 'varchar', 100, 0, 0),
	('@param12', 'varchar', 100, 0, 0),
	('@param13', 'varchar', 100, 0, 0),
	('@param14', 'varchar', 100, 0, 0),
	('@param15', 'varchar', 100, 0, 0),
	('@param16', 'varchar', 100, 0, 0),
	('@param17', 'varchar', 100, 0, 0),
	('@param18', 'varchar', 100, 0, 0),
	('@param19', 'varchar', 100, 0, 0);

    ----- ACT ----------------------------------------------------

    INSERT INTO #actual
    (
        ParameterName,
        DataType,
        MaxLength,
        Precision,
        Scale
    )
    SELECT pm.name AS ParameterName,
           t.name AS DataType,
           pm.max_length AS MaxLength,
           pm.precision AS [Precision],
		   pm.scale AS Scale
    FROM sys.parameters AS pm
        INNER JOIN sys.procedures AS ps
            ON pm.object_id = ps.object_id
        INNER JOIN sys.schemas AS s
            ON s.schema_id = ps.schema_id
        INNER JOIN sys.types AS t
            ON pm.system_type_id = t.system_type_id
               AND pm.user_type_id = t.user_type_id
    WHERE s.name = 'dbo'
          AND ps.name = 'Table8_Create';

    ----- ASSERT -------------------------------------------------

    -- Assert to have the same values
    EXEC tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = '#actual';


END;
