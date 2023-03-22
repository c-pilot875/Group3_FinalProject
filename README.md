# Group3_FinalProject

## Selected Topic – NFL Combine Performance (2009-2019)

The purpose of this project is to analyze data from the NFL Combine dataset using tools to identify correlations between performance datapoints and to predict if a football player who attends the NFL Combine will be drafted or undrafted with 75% accuracy.

Questions:
* Primary:
    * Using a machine learning model, can we predict if a player who attends the NFL Combine will be drafted or undrafted with 75% accuracy?

* Secondary:
    * Using the Random Forest model, can we see how position groups differ?
    * Can we find any meaningful cluster groups using unsupervised machine learning?
    * What position types and player types are most represented at the NFL combine?
    * What are the average statistics by player type (offense, defense, and special teams)?

### Technology Used
* Languages: Python
* Technologies: AWS, PostgreSQL/pgAdmin, Excel, Tableau
* Tools: Pandas, machine learning tools

### Data Sources

#### Data Source #1
Description: NFL.csv. This dataset includes player performance data at the NFL Combine, from years 2009 through 2019. The dataset includes Year, Player, Age, School, Height, Weight, Sprint_40yd, Vertical_Jump, Bench_Press_Reps, Broad_Jump, Agility_3cone, Shuttle, Drafted..tm.rnd.yr., BMI, Player_Type, Position_Type, Positions, and Drafted.

Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019

#### Data Source #2 
Description: Schools_by_Conference.csv. This dataset includes the conference that each school in the NFL Combine dataset belongs to.

Sources:
1. https://collegefootballdata.com/exporter/teams
2. https://www.ncaa.com/standings/football/fbs
3. http://www.espn.com/college-football/conferences
4. https://www.ncsasports.org/football/division-2-colleges
5. https://www.ncsasports.org/football/division-3-colleges

## Data Exploration and Processing
Description
1. The Schools_by_Conference dataset was compiled by finding a list of unique schools from our primary NFL data source, then using multiple sources to find the conference each school belongs to.
2. NFL.csv has duplicated schools that should be cleaned up for consistency. Western Michigan/West. Michigan and LSU/Louisiana St both exist in the primary dataset. The Pandas Replace function should be used to replace LSU with Louisiana St and West. Michigan with Western Michigan, so when we look at drafted vs. undrafted by school, these are not grouped separately.
3. When processing our NFL data for our machine learning model, we will exclude Year, Player, Age, School, Drafted..tm.rnd.yr., Player_Type, Position_Type, Positions, and Drafted from our features. Drafted is the target.

## Database
Description
1. Using AWS, Google Colab, and PostgreSQL/pgAdmin, we will create a database containing two tables.
2. Tables:
    1. NFL
    2. School_by_Conference
3. The NFL table does not have a primary key, as there is not a unique identifier in the dataset (e.g. there are two players named Chris Jones). The School field in the School_by_Conference table is the primary key and can be used to join to the NFL table (where School is the foreign key).
4. Using the NFL and School_by_Conference tables in pgAdmin, preliminary analysis can be performed to find the number of each player type and position type represented at the NFL Combine, the average stats of each player type and position type, and the number of drafted and undrafted players by conference.

![ERD](https://user-images.githubusercontent.com/115508658/227053221-45f483d2-1b8d-439c-9fc3-8427fdcd5c69.png)


