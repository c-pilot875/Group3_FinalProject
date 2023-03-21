# Group3_FinalProject

## Segment 1 Selected Topic – NFL Combine Performance (2009-2019)

* Purpose - 
* Question(s) – Using a machine learning model, can we predict if a player who attends the NFL Combine will be drafted or undrafted with 75% accuracy?

### Technology Used
* Languages: 
* Technologies: AWS, Google Colab, PostgreSQL/pgAdmin, Excel
* Tools:

### Data Sources
#### Data Source #1
Description: NFL.csv. This dataset includes player performance data at the NFL Combine, from years 2009 through 2019. The dataset includes Year, Player, Age, School, Height, Weight, Sprint_40yd, Vertical_Jump, Bench_Press_Reps, Broad_Jump, Agility_3cone, Shuttle, Drafted..tm.rnd.yr., BMI, Player_Type, Position_Type, Positions, and Drafted.

Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019

#### Data Source #2 
Description: School_by_Conference.csv. This dataset includes the conference that each school in the NFL Combine dataset belongs to.

Sources:
1.	https://collegefootballdata.com/exporter/teams
2.	https://www.ncaa.com/standings/football/fbs
3.	http://www.espn.com/college-football/conferences
4.	Individual conference websites 

## Data Exploration and Processing
Description
1.	I had trouble finding a data source that contained all of the colleges that are included our NFL Combine dataset. I used a few different sources to compile a complete list in Excel that we should be able to use to create our second table.
2.	When searching for a supplementary dataset containing conference information for each school listed in the NFL.csv, I found that the NFL.csv could have possible duplicated schools that would need to be cleaned up for consistency. I found “Western Michigan” and “West. Michigan” as well as “LSU” and “Louisiana St.”. We should replace one of these descriptions with the other so when we look at drafted vs. undrafted by school, these are not grouped separately.
3.	When processing our NFL data for our machine learning model, we will want to exclude Year, Player, Age, School, Drafted..tm.rnd.yr., Player_Type, Position_Type, Positions, and Drafted from our features. Drafted is the target.
4.	Player is not a unique identifier. There are two “Chris Jones” listed (one from Alabama, one from Nebraska).

[pic of final df]
## Database
Description
1.	Using AWS, Google Colab, and PostgreSQL/pgAdmin, we will create a database containing two tables
2.	Tables:
    1.	NFL
    2.	School_by_Conference

[pic of database mock]

![ERD](https://user-images.githubusercontent.com/115508658/226765889-1abcb910-3bde-4231-a4d8-5aeed7af49c7.png)



