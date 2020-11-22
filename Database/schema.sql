DROP TABLE IF EXISTS Pop_100_Web, Top_250_Web, Pop_100_API, Top_250_API, Genre_Top, Genre_Pop;

CREATE TABLE Pop_100_Web (
    Popularity_Rank INT   NOT NULL UNIQUE,
    Title VARCHAR   NOT NULL UNIQUE,
    Rating FLOAT   NOT NULL,
	PRIMARY KEY (Title)
);
	
CREATE TABLE Top_250_Web (
    Rating_Rank INT   NOT NULL UNIQUE,
	Title VARCHAR   NOT NULL UNIQUE,
    Rating FLOAT   NOT NULL,
	PRIMARY KEY (Title)
);

CREATE TABLE Pop_100_API (
    Title VARCHAR   NOT NULL,
    "Year" INT   NOT NULL,
    Rated VARCHAR   NOT NULL,
    Released DATE   NOT NULL,
    Runtime INT   NOT NULL,
    Director VARCHAR   NOT NULL,
    Plot VARCHAR   NOT NULL,
    Poster VARCHAR   NOT NULL,
    Metascore INT   NOT NULL,
    imdbID VARCHAR   NOT NULL UNIQUE,
    imdbRating FLOAT   NOT NULL,
    imdbVotes INT   NOT NULL,
    "Type" VARCHAR   NOT NULL,
	Popularity_Rank INT NOT NULL,
    PRIMARY KEY (imdbID),
	FOREIGN KEY (Popularity_Rank) REFERENCES Pop_100_Web (Popularity_Rank)
);

CREATE TABLE Top_250_API (
    Title VARCHAR   NOT NULL,
    "Year" INT   NOT NULL,
    Rated VARCHAR   NOT NULL,
    Released DATE   NOT NULL,
    Runtime INT   NOT NULL,
    Director VARCHAR   NOT NULL,
    Plot VARCHAR   NOT NULL,
    Poster VARCHAR   NOT NULL,
    Metascore INT   NOT NULL,
    imdbID VARCHAR   NOT NULL UNIQUE,
    imdbRating FLOAT   NOT NULL,
    imdbVotes INT   NOT NULL,
    "Type" VARCHAR   NOT NULL,
	Rating_Rank INT NOT NULL,
    PRIMARY KEY (imdbID),
	FOREIGN KEY (Rating_Rank) REFERENCES Top_250_Web (Rating_Rank)
);

CREATE TABLE Genre_Top (
    FOREIGN KEY (imdbID) REFERENCES Top_250_API (imdbID),
    FOREIGN KEY (Title) REFERENCES Top_250_Web (Title),
    Genre VARCHAR   NOT NULL UNIQUE,
	imdbID VARCHAR   NOT NULL,
	Title  VARCHAR   NOT NULL,
    PRIMARY KEY (imdbID)
);

CREATE TABLE Genre_Pop (
    FOREIGN KEY (imdbID) REFERENCES Pop_100_API (imdbID),
    FOREIGN KEY (Title) REFERENCES Pop_100_Web (Title),
    FOREIGN KEY (Genre) REFERENCES Genre_Top (Genre),
	Genre VARCHAR   NOT NULL,
	imdbID VARCHAR   NOT NULL,
	Title  VARCHAR   NOT NULL,
    PRIMARY KEY (imdbID)
);