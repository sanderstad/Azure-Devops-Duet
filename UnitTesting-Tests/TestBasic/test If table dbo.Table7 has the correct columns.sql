/*
Description:
Test if the table has the correct columns

Changes:
Date		Who						Notes
----------	---						--------------------------------------------------------------
7/14/2020	sstad				Initial procedure
*/
CREATE PROCEDURE [TestBasic].[test If table dbo.Table7 has the correct columns]
AS
BEGIN
    SET NOCOUNT ON;

    ----- ASSEMBLE -----------------------------------------------
    -- Create the tables
    CREATE TABLE #actual
    (
        [ColumnName] sysname NOT NULL,
        [DataType] sysname NOT NULL,
        [MaxLength] SMALLINT NOT NULL,
        [Precision] TINYINT NOT NULL,
        [Scale] TINYINT NOT NULL
    );

    CREATE TABLE #expected
    (
        [ColumnName] sysname NOT NULL,
        [DataType] sysname NOT NULL,
        [MaxLength] SMALLINT NOT NULL,
        [Precision] TINYINT NOT NULL,
        [Scale] TINYINT NOT NULL
    );

    INSERT INTO #expected
    (
        ColumnName,
        DataType,
        MaxLength,
        Precision,
        Scale
    )
    VALUES
	('Column1', 'varchar', 100, 0, 0),
	('Column10', 'varchar', 100, 0, 0),
	('Column2', 'varchar', 100, 0, 0),
	('Column3', 'varchar', 100, 0, 0),
	('Column4', 'varchar', 100, 0, 0),
	('Column5', 'varchar', 100, 0, 0),
	('Column6', 'varchar', 100, 0, 0),
	('Column7', 'varchar', 100, 0, 0),
	('Column8', 'varchar', 100, 0, 0),
	('Column9', 'varchar', 100, 0, 0);

    ----- ACT ----------------------------------------------------

    INSERT INTO #actual
    (
        ColumnName,
        DataType,
        MaxLength,
        Precision,
        Scale
    )
    SELECT c.name AS ColumnName,
           st.name AS DataType,
           c.max_length AS MaxLength,
           c.precision AS [Precision],
           c.scale AS Scale
    FROM sys.columns AS c
        INNER JOIN sys.tables AS t
            ON t.object_id = c.object_id
        INNER JOIN sys.schemas AS s
            ON s.schema_id = t.schema_id
        LEFT JOIN sys.types AS st
            ON st.user_type_id = c.user_type_id
    WHERE t.type = 'U'
          AND s.name = 'dbo'
          AND t.name = 'Table7'
    ORDER BY t.name,
             c.name;

    ----- ASSERT -------------------------------------------------

    -- Assert to have the same values
    EXEC tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = '#actual';

END;
GO
