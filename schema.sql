DROP TABLE IF EXISTS "Pop_100_Web";
DROP TABLE IF EXISTS "Pop_100_API";
DROP TABLE IF EXISTS "Top_250_Web";
DROP TABLE IF EXISTS "Top_250_API"; 
DROP TABLE IF EXISTS "Genre_Top";
DROP TABLE IF EXISTS "Genre_Pop";

CREATE TABLE "Pop_100_Web" (
    "Popularity_Rank" INT   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "Rating" FLOAT   NOT NULL,
    CONSTRAINT "pk_Pop_100_Web" PRIMARY KEY (
        "Popularity_Rank"
     )
);
CREATE TABLE "Top_250_Web" (
    "Rating_Rank" INT   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "Rating" FLOAT   NOT NULL,
    CONSTRAINT "pk_Top_250_Web" PRIMARY KEY (
        "Rating_Rank"
     )
);
CREATE TABLE "Pop_100_API" (
    "Title" VARCHAR   NOT NULL,
    FOREIGN KEY ("Popularity_Rank") REFERENCES "Pop_100_Web" ("Popularity_Rank"),
    "Year" INT   NOT NULL,
    "Rated" VARCHAR   NOT NULL,
    "Released" DATE   NOT NULL,
    "Runtime" INT   NOT NULL,
    "Director" VARCHAR   NOT NULL,
    "Plot" VARCHAR   NOT NULL,
    "Poster" VARCHAR   NOT NULL,
    "Metascore" INT   NOT NULL,
    "imdbID" VARCHAR   NOT NULL,
    "imdbRating" FLOAT   NOT NULL,
    "imdbVotes" INT   NOT NULL,
    "Type" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Pop_100_API" PRIMARY KEY (
        "imdbID"
     )
);
CREATE TABLE "Top_250_API" (
    "Title" VARCHAR   NOT NULL,
    FOREIGN KEY ("Rating_Rank") REFERENCES "Top_250_Web" ("Rating_Rank"),
    "Year" INT   NOT NULL,
    "Rated" VARCHAR   NOT NULL,
    "Released" DATE   NOT NULL,
    "Runtime" INT   NOT NULL,
    "Director" VARCHAR   NOT NULL,
    "Plot" VARCHAR   NOT NULL,
    "Poster" VARCHAR   NOT NULL,
    "Metascore" INT   NOT NULL,
    "imdbID" VARCHAR   NOT NULL,
    "imdbRating" FLOAT   NOT NULL,
    "imdbVotes" INT   NOT NULL,
    "Type" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Top_250_API" PRIMARY KEY (
        "imdbID"
     )
);
CREATE TABLE "Genre_Top" (
    FOREIGN KEY ("imdbID") REFERENCES "Top_250_API" ("imdbID"),
    FOREIGN KEY ("Title") REFERENCES "Top_250_Web" ("Title"),
    "Genre" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Genre_Top" PRIMARY KEY (
        "imdbID"
     )
);
CREATE TABLE "Genre_Pop" (
    FOREIGN KEY ("imdbID") REFERENCES "Pop_100_API" ("imdbID"),
    FOREIGN KEY ("Title") REFERENCES "Pop_100_Web" ("Title"),
    FOREIGN KEY ("Genre") REFERENCES "Genre_Top" ("Genre"),
    CONSTRAINT "pk_Genre_Pop" PRIMARY KEY (
        "imdbID"
     )
);