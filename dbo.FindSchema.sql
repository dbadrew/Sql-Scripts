SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.FindSchema') IS NULL
  EXEC ('CREATE PROCEDURE dbo.FindSchema AS RETURN 0;');
GO

ALTER PROCEDURE [dbo].[FindSchema]
	@SchemaName sysname
/*************************************************************************************************************
	Description:		Looks for @SchemaName. Returns 1 if found.
**************************************************************************************************************/
AS
BEGIN
	IF QUOTENAME(@SchemaName) IS NOT NULL AND (SELECT [SCHEMA_NAME] FROM INFORMATION_SCHEMA.SCHEMATA WHERE QUOTENAME([SCHEMA_NAME]) = QUOTENAME(@SchemaName)) IS NOT NULL
		RETURN(1);
	RETURN(0);
END

