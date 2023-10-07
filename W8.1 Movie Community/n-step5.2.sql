DROP TABLE IF EXISTS dbo.netflix_set_comedies
GO

CREATE TABLE dbo.netflix_set_comedies
            (movies VARCHAR(MAX) NOT NULL,
			genra   VARCHAR(25) NOT NULL
			);
GO