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
* Languages: Python 3.7
* Technologies: 
* Tools: Machine Learning models from SciKitLearn and Imbalanced learn

### Data Source
Description
Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019
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

## Segement 1 Selected Topic - NFL Combine Draft 2009 - 2019

* Purpose - The purpose of this project is to analyze data from the NFL Combine Draft dataset using tools to identify corrilations between datapoints and predict if a football player who attends the NFL Combine will be drafted on undrafted with 75% accruacy.
  
* Question(s) - How do different combine stats effect wheather a player is drafted or undrafted?

### Technology Used
* Languages: `Python`
* Technologies: `Postgres`, `AWS`, `PostgresLite`
* Tools: Machine Learning models from `SciKitLearn` and `Imbalanced` learn, Dashabord templates possibly from `Tablau Stories`, etc.

### Data Source
The dataset contains stats and information form the NFL Combine (2009 to 2019), inclduing the results from sports performance tests and draft outcomes.
Source: [NFL Combine Draft 2009 - 2019](https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019)

## Analytic Dashboard Using Tablau Stories
Using the data visualizatin tool Tablau Public Stories, the NFL Draft dataframes will be collected from the exploritory analysis and implamented into User Interactive charts within Stories. Dataframe images, cover pages containing the questions, and colors will be chosen by the team. Presentaiton flow is listed in order below:

### Presentation Set Up:
1. Cover Page
2. Purpose of the project and Source
3. Secondary Questions
4. Tools for exploring the dataset [sample dataframes]
5. Database build [ERD]
6. Machine Learning Models
7. Results [UI charts, Cluster, Machine Learning Accuracy]
8. Summary [Conclusion, Team Credits]

### Charts
* What position type or player type is most represented at the NFL Combine? [Pie chart visualization of DF]
* What are the average stats of offence vs defence? [Stacked bar chart of DF]
* What relationships do the Clusters containe from the Machine Learning model? [Cluster or DF]
Tablau example

![Screen Shot 2023-03-21 at 2 41 58 PM](https://user-images.githubusercontent.com/115188500/226714697-5e3f860c-03ff-442f-946b-77ef4e57bb98.png)


The `Tablau Story` dashboard will be linked to the final ReadMe for the presentation.

## Machine Learning Mockup
### Overview
Machine Learning will be used to answer the main question of this analysis: Can we predict if a player who attends the NFL Combine will be drafted 
or undrafted with X% accuracy (75%)? To do this we will use a Random Forest Model with the following features:
- Height (m)
- Weight (kg)
- Sprint_40yd (40 yard sprint in s)
- Vertical_Jump (cm)
- Bench_Press_Reps (Maximum bench press repititions achieved while lifting 102.1 kg weight)
- Broad Jump (cm)
- Agility_3cone (Three-cone agility test time (s))
- Shuttle (Lateral shuttle time (s))
- BMI (Body mass index (kg/m^2)

These features will all be used to predict the classification target variable of whether a player is drafted or not.

### Model Choice
The random forest model (specifically the BalancedRandomForestClassifier from imblearn) is chosen because the importance of each feature can be extracted from this model. This will allow us to determine which attributes most contribute to whether a player is drafted or not, and which drills may be most important for a player to focus on improving. In addition, since the data is unbalanced (68% drafted, 32% undrafted), we will also check resampling techniques and boosting techniques to see if they perform better than the random forest classifier.

### Other Machine Learning Questions
In addition to this main question, we also hope to answer some other questions using machine learning. First, we want to look at how different position groups differ. To answer this question, we will use the Position_Type column of our dataset to filter players into the following position groups:
1. Backs and Recievers
2. Offensive Linemen
3. Defensive Backs
4. Defensive Linemen
5. Linebackers

Since our dataset is already pretty low on datapoints, we don't expect to see very good accuracy in these models, but what information we can glean will hopefully allow us to see which stats are better at predicting the draft status for each position.

Second, we will use k-means clustering on the same set of features to see if we can find any meaningful clusters in our data. Some possible meaning we hope to see in these clusters include position group, draft pick (higher draft picks clustered together), or college conference (players from better conferences clustered together). The meaning will be determined by creating different variations of visualizations with various potential meanings on the axes.
