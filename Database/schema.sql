DROP TABLE IF EXISTS Pop_100_Web, Top_250_Web, Pop_100_API, Top_250_API, Genre_Top, Genre_Pop;

CREATE TABLE Pop_100_Web (
    Popularity_Rank INT   NOT NULL UNIQUE,
    Title VARCHAR   NOT NULL,
    Rating FLOAT   ,
	PRIMARY KEY (Popularity_Rank)
);
	
CREATE TABLE Top_250_Web (
    Rating_Rank INT   NOT NULL UNIQUE,
	Title VARCHAR   NOT NULL,
    Rating FLOAT   NOT NULL,
	PRIMARY KEY (Rating_Rank)
);

CREATE TABLE Pop_100_API (
    Popularity_Rank INT NOT NULL,
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
    imdbVotes INT   ,
    "Type" VARCHAR   NOT NULL,
    PRIMARY KEY (imdbID),
	FOREIGN KEY (Popularity_Rank) REFERENCES Pop_100_Web (Popularity_Rank)
);

CREATE TABLE Top_250_API (
    Rating_Rank INT NOT NULL,
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
    imdbVotes INT   ,
    "Type" VARCHAR   NOT NULL,
    PRIMARY KEY (imdbID),
	FOREIGN KEY (Rating_Rank) REFERENCES Top_250_Web (Rating_Rank)
);

CREATE TABLE Genre_Top (
    id INT PRIMARY KEY,
    FOREIGN KEY (imdbID) REFERENCES Top_250_API (imdbID),
    imdbID VARCHAR   NOT NULL,
	Title  VARCHAR   NOT NULL,
    Genre VARCHAR   NOT NULL
);

CREATE TABLE Genre_Pop (
    id INT PRIMARY KEY,
    FOREIGN KEY (imdbID) REFERENCES Pop_100_API (imdbID),
    imdbID VARCHAR   NOT NULL,
	Title  VARCHAR   NOT NULL,
    Genre VARCHAR   NOT NULL
);