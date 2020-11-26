Members: Matt T & Alison C

Topic: Movie data

Description: Create a complete movie data base on the top 250 rated and top 100 popular IMBD movies 

ETL Project - Movie Database

Extract:

For our project we decided to get our data from two main sources, IMDB and the OMDB API,

• https://www.imdb.com/chart/top/?ref_=nv_mv_250

• http://www.omdbapi.com/

The data on the IMDB website was accessed using web scraping (HTML), and the data on the OMDB website was accessed using an API (JSON response).


Transform:

The data that we scraped from IMDB did not need any transformation. The way the data was stored on the page was the way that we wanted to use it in our database, as a result simply using a combination of BeautifulSoup, Splinter & Pandas was sufficient to;
Read the underlying HTML on the web page
Scrape through the data for the elements we wanted to retrieve 
Store the data in a dataframe 
Export into a CSV file

For the data that was retrieved via the API, we used the API documentation to understand what data was received in response from an API call, and we decided which responses we wanted to keep for our database. 

Once the API call was completed and stored in a dataframe, the data needed to be cleaned, we took the following steps;
Removing null values from the dataframe
Creating a rank column by resetting the index
Re-formatting the runtime
Re-formatting the date (to be read by Postgres)
Re-formatted the number of votes to an integer

Finally we created a new table using the same API call which stored the title of each movie and it’s genre in a first-normal form dataframe. The API response would have multiple genres per row for example (Crime, Action, etc). To convert to first-normal form we had to split these genres into separate rows in a new dataframe. To create this we had to;
Looped through the existing dataframe and split the genres on each row
Push each individual genre to a new list
Created a list for the title & id which matched the length of the new genre list
Merged the results into a dataframe


Load:

To load the data, you need to create a new Postgres database in your local environment called “movie_db”

Once the database is created, open the “schema” file which is in “Database>schema.sql” in this repo, copy this query and run it in the query tool within pgAdmin.

Now that the tables have been created, import the CSV files that were created by running the iPython notebooks from the transform stage, ensuring that the tables are loaded in the same order the tables were created in the schema.

Using Movie_DB.ipynb connect to the database, and run queries on the tables. The notebook is located in “Database>Movie_DB.ipynb” in this repo. This iPython notebook has a few example queries that show how the database can be used.
