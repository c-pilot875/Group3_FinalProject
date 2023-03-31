# Group3_FinalProject

### Links
# [Google Slides Draft Presentation](https://docs.google.com/presentation/d/1bHN3MyXMYsiwbRi6HGW2KUMyx565eJ8_NZdsxkAlCpQ/edit?usp=sharing)

[Draft Tableau Dashboard]

### Presentation Set Up:
1. Cover Page
2. Purpose of the project and Source
3. Secondary Questions
4. Tools for exploring the dataset [sample dataframes]
5. Database build [ERD]
6. Machine Learning Models
7. Dashboard buid
8. Results [UI charts, Cluster, Machine Learning Accuracy]
9. Summary [Conclusion, Team Credits]

## Analytic Dashboard Using Tableau Public
Using the data visualizatin tool Tablau Public, the NFL_Clean_Up.csv file will be uploaded for dashbaord creation. [update] User Interactive charts within Tableau. A single dashboard will combine all charts with an interactivty component. Any additional images relevent to exploritory findinds, database tables, and machine models will be added to the presentation slides unless there is a way to add those images to the dashboard.

### Charts
* What position type or player type is most represented at the NFL Combine? [Pie chart visualization of DF]
* What are the average stats of offence vs defence? [Stacked bar chart of DF]
* What relationships do the Clusters containe from the Machine Learning model? [Cluster of DF]

### Tableau Dashboard
Trial Dashboard findings
* Player and Position type seem to display the most complete charts, however the differences in values are minimal. Will try to activate the filter function for Undrafted and Drafted dimensions as the main UI.
* Still researching how to display a cluster chart from the machine model

<img width="851" alt="Screen Shot 2023-03-28 at 3 44 50 PM" src="https://user-images.githubusercontent.com/115188500/228394551-02dc77b7-093b-47a4-91e0-69854eeb666b.png">

## Selected Topic – NFL Combine Performance (2009-2019)

We chose this topic because we all have an interest in sports and thought it would be a fun real life example to use to apply what we’ve learned about machine learning and data analytics.

### Technology Used

* Languages: Python 3.7, Pandas
* Technologies: Anaconda, Jupyter Notebook
* Tools: Jupyter Notebook, Excel

* Languages: Python 3.7
* Technologies: 
* Tools: Machine Learning models from SciKitLearn and Imbalanced learn

### Data Source
Description
Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019

## Data Exploration and Processing
Description
1. Creating a dataframe that show all the combine attendees and the school they attended to show the number of schools who had players attend the combine and also show which schools had the most attendants.
<img width="337" alt="image" src="https://user-images.githubusercontent.com/109708202/228628551-befb1c23-ebf3-472d-ba0d-8606014df109.png">
* Languages: Python 3.7, Pandas 1.4.4, PySpark 3.2.3
* Technologies: AWS, PostgreSQL 11.19, pgAdmin 4 6.19, Excel
* Tools: Jupyter Notebook, Google Colab, Tableau Public 2022.4, Machine Learning models from SciKit-learn 1.0.2 and Imbalanced-learn 0.10.1

### Data Sources

#### Data Source #1
Description: NFL.csv. This dataset includes player performance data at the NFL Combine, from years 2009 through 2019. The dataset includes Year, Player, Age, School, Height, Weight, Sprint_40yd, Vertical_Jump, Bench_Press_Reps, Broad_Jump, Agility_3cone, Shuttle, Drafted..tm.rnd.yr., BMI, Player_Type, Position_Type, Positions, and Drafted.

Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019

2. There are seven different position groupings in the dataframe. Creating a dataframe for each position to show event stats for those drafted and another data frame for those undrafted will allow the ability to show how those who were drafted preformed to those undrafted in each event.
![image](https://user-images.githubusercontent.com/109708202/228626321-393196fe-bc6a-4ece-bf6c-6d941911fa57.png)

3. Being able to see each player, their event statistics, and where they were drafted, may shed insight to see if better event stats relates to being drafted higher instead of just team need. 

Sources:
1. https://collegefootballdata.com/exporter/teams
2. https://www.ncaa.com/standings/football/fbs
3. http://www.espn.com/college-football/conferences
4. https://www.ncsasports.org/football/division-2-colleges
5. https://www.ncsasports.org/football/division-3-colleges

## Data Exploration and Processing
Description
1. Creating a dataframe that show all the combine attendees and the school they attended to show the number of schools who had players attend the combine and also show which schools had the most attendants.
2. There are seven different position groupings in the dataframe. Creating a dataframe for each position to show event stats for those drafted and another data frame for those undrafted will allow the ability to show how those who were drafted preformed to those undrafted in each event.
3. Being able to see each player, their event statistics, and where they were drafted, may shed insight to see if better event stats relates to being drafted higher instead of just team need. 
4. Creating a dataframe to show each teams picks and how many picks they had

=======
5. The Schools_by_Conference dataset was compiled by finding a list of unique schools from our primary NFL data source, then using multiple sources to find the conference each school belongs to.
6. NFL.csv has duplicated schools that should be cleaned up for consistency. Western Michigan/West. Michigan and LSU/Louisiana St both exist in the primary dataset. The Pandas Replace function should be used to replace LSU with Louisiana St and West. Michigan with Western Michigan, so when we look at drafted vs. undrafted by school, these are not grouped separately.
7. When processing our NFL data for our machine learning model, we will exclude Year, Player, Age, School, Drafted..tm.rnd.yr., Player_Type, Position_Type, Positions, and Drafted from our features. Drafted is the target.

![image](https://user-images.githubusercontent.com/109708202/227393219-d50f512e-7e31-4d9f-9cdc-7db59204d141.png) - DF to show players who were drafted, what school they attened, combine stats, team and draft position

## Database
Description of Database build
1. Using AWS S3 and RDS, Google Colab, PySpark, and PostgreSQL/pgAdmin, we created a database containing two tables.
2. Tables:
    1. NFL
    2. School_by_Conference
3. The NFL table does not have a primary key, as there is not a unique identifier in the dataset (e.g. there are two players named Chris Jones). The School field in the School_by_Conference table is the primary key and can be used to join to the NFL table (where School is the foreign key).
4. Using the NFL and School_by_Conference tables in pgAdmin, preliminary analysis can be performed to find the number of each player type and position type represented at the NFL Combine, the average stats of each player type and position type, and the number of drafted and undrafted players by conference.
4. Create dataframes of a few teams to see how many draft picks they had from 2009 - 2019

5. View players physical characteristics such as height, weight, BMI, and age in relation to what overall pick they were taken.
![image](https://user-images.githubusercontent.com/109708202/228624918-4283d121-0b3b-4f00-8d32-377015ad411e.png)

Tables in Database:

![Tables_pdAdmin](https://user-images.githubusercontent.com/115508658/228365098-5e22877e-890e-42dd-bdeb-6283101ea1fd.png)

Player types represented at Combine:

![player_type_represented](https://user-images.githubusercontent.com/115508658/228369565-d9d9a56e-dd49-4201-b114-cc68295aee0e.png)

Position types represented at Combine:

![position_type_represented](https://user-images.githubusercontent.com/115508658/228986061-029a240e-cf68-4739-a4a1-6a47158ce049.png)

Power five conferences, drafted vs. undrafted:

![power_five_drafted_v_undrafted](https://user-images.githubusercontent.com/115508658/228369592-1a862d8f-3b43-4a43-b8e5-b0c5016f7fd5.png)

Average statistics by postition type:

![position_type_avg_stats](https://user-images.githubusercontent.com/115508658/228917527-cee0147c-3580-4ae8-9110-ade7eab05801.png)

## Machine Learning Mockup
### Overview
Machine Learning is used to answer the main question of this analysis: Can we predict if a player who attends the NFL Combine will be drafted 
or undrafted with X% accuracy (75%)? To do this we use the following features:
- Height (m)
- Weight (kg)
- Sprint_40yd (40 yard sprint in s)
- Vertical_Jump (cm)
- Bench_Press_Reps (Maximum bench press repititions achieved while lifting 102.1 kg weight)
- Broad Jump (cm)
- Agility_3cone (Three-cone agility test time (s))
- Shuttle (Lateral shuttle time (s))
- BMI (Body mass index (kg/m^2)
- Position_Type (Encoded categorical variable)

These features will all be used to predict the classification target variable of whether a player is drafted or not.

### Model Choice
A neural network model with 2 hidden layers (the first with 10 neurons and the second with 31 neurons, and both with the 'tanh' activation function) was chosen as it performed the best of many models tried by the keras-tuner optimizer. This optimizer looked at models with anywhere from 0 to 5 hidden layers, and with each hidden layer having anywhere from 1 to 31 nodes.

Other models were unable to provide an accuracy above the baseline of 68%, which is chosen as a baseline, because 68% of players are drafted, so we want a model that does better than saying "Yes" on each player. These models include:
- Simple logistic regression
- Ensemble models (Random forest and boosted)
- Resampling models (SMOTEEN)
 
### Other Machine Learning Questions
In addition to this main question, we also hope to answer some other questions using machine learning. First, we want to look at how different position groups differ. To answer this question, we will use the Position_Type column of our dataset to filter players into the following position groups:
1. Backs and Recievers
2. Offensive Linemen
3. Defensive Backs
4. Defensive Linemen
5. Linebackers

Since our dataset is already pretty low on datapoints, we don't expect to see very good accuracy in these models, but what information we can glean will hopefully allow us to see which stats are better at predicting the draft status for each position.

Second, we will use k-means clustering on the same set of features to see if we can find any meaningful clusters in our data. Some possible meaning we hope to see in these clusters include position group, draft pick (higher draft picks clustered together), or college conference (players from better conferences clustered together). The meaning will be determined by creating different variations of visualizations with various potential meanings on the axes.

### Results
#### Neural Network
From our neural network, we achieved the following results:
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Neural_Network_Results.png" width="733" height="152">
</p>

We can also break this down by position type, as seen below:
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Neural_Network_by_Position.png" width="505" height="139">
</p>

From this we can see that our model does not do a good job of predicting backs and receivers. This makes some sense as running backs, wide receivers, tight ends, and quarterbacks all fit into this category, but all typically have different body types and athletic fortes (e.g. a wide receiver may be very quick and fast, but not very strong, whereas a tight end, who also has to block, may need to have a focus on strength).

#### Position Type Differences

#### Clustering
Our unsupervised learning resulted in three clusters. We can view the results of our clustering through a few different lenses. First, we can look at how different position types are clustered, as shown below:
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Positions_Clustered.png" width="642" height="295">
</p>

From this chart we can see that the clusters fairly nicely split the position types as follows: Cluster 0 contains offensive linemen and defensive linemen, Cluster 1 contains mostly backs, receivers, and defensive backs, and Cluster 2 contains the remaining backs and receivers, defensive linemen, and linebackers.


We can also view our clustering through the draft pick number that each player was taken. These results are shown below:
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Draft_Picks_Clustered.png" width="602" height="300">
</p>

This gives a less clear view of the clustering, as there does not seem to be any clear pattern between clusters or in a single cluester. We can thus conclude that our data is clustered more through position type than it is through draft pick.
