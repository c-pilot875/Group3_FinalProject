# Group3_FinalProject


## Selected Topic – NFL Combine Performance (2009-2019)

### Links
# [Google Slides Presentation](https://docs.google.com/presentation/d/1bHN3MyXMYsiwbRi6HGW2KUMyx565eJ8_NZdsxkAlCpQ/edit?usp=sharing)
# [Tableau Dashboard Link](https://public.tableau.com/app/profile/c.pilot875/viz/Group3FinalProjectDraft/Dashboard1?publish=yes)

The purpose of this project is to analyze data from the NFL Combine dataset using tools to identify correlations between performance datapoints and to predict if a football player who attends the NFL Combine will be drafted or undrafted with 75% accuracy.

We chose this topic because we all have an interest in sports and thought it would be a fun real life example to use to apply what we’ve learned about machine learning and data analytics.

Questions:
* Primary:
    * Using a machine learning model, can we predict if a player who attends the NFL Combine will be drafted or undrafted with 75% accuracy?

* Secondary:
    * Using the Random Forest model, can we see how position groups differ?
    * Can we find any meaningful cluster groups using unsupervised machine learning?
    * What position types and player types are most represented at the NFL combine?
    * What are the average statistics by player type (offense, defense, and special teams)?

### Technology Used

* Languages: Python 3.7, Pandas 1.4.4, PySpark 3.2.3
* Technologies: AWS, PostgreSQL 11.19, pgAdmin 4 6.19, Excel
* Tools: Jupyter Notebook, Google Colab, Tableau Public 2022.4, Machine Learning models from SciKit-learn 1.0.2 and Imbalanced-learn 0.10.1

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
1. Creating a dataframe that show all the combine attendees and the school they attended to show the number of schools who had players attend the combine and also show which schools had the most attendants.
<img width="337" alt="image" src="https://user-images.githubusercontent.com/109708202/228628551-befb1c23-ebf3-472d-ba0d-8606014df109.png">

2. There are seven different position groupings in the dataframe. Creating a dataframe for each position to show event stats for those drafted and another data frame for those undrafted will allow the ability to show how those who were drafted preformed to those undrafted in each event.
![image](https://user-images.githubusercontent.com/109708202/228626321-393196fe-bc6a-4ece-bf6c-6d941911fa57.png)

3. Being able to see each player, their event statistics, and where they were drafted, may shed insight to see if better event stats relates to being drafted higher instead of just team need. 

4. Creating a dataframe to show each teams picks and how many picks they had
![image](https://user-images.githubusercontent.com/109708202/230502132-eb253b88-2f35-498e-88c2-3dcf64ed24d8.png)


5. View players physical characteristics such as height, weight, BMI, and age in relation to what overall pick they were taken.
![image](https://user-images.githubusercontent.com/109708202/228624918-4283d121-0b3b-4f00-8d32-377015ad411e.png)

6. The Schools_by_Conference dataset was compiled by finding a list of unique schools from our primary NFL data source, then using multiple sources to find the conference each school belongs to.

7. NFL.csv has duplicated schools that should be cleaned up for consistency. Western Michigan/West. Michigan and LSU/Louisiana St both exist in the primary dataset. The Pandas Replace function should be used to replace LSU with Louisiana St and West. Michigan with Western Michigan, so when we look at drafted vs. undrafted by school, these are not grouped separately.
![image](https://user-images.githubusercontent.com/109708202/230502192-e8ef58c0-aa17-46ce-b486-9cf7b2e4ec49.png)


8. When processing our NFL data for our machine learning model, we will exclude Year, Player, Age, School, Drafted..tm.rnd.yr., Player_Type, Position_Type, Positions, and Drafted from our features. Drafted is the target.
![image](https://user-images.githubusercontent.com/109708202/230502250-638163b5-3b37-4ea6-ba08-389145a1ac2c.png)


![image](https://user-images.githubusercontent.com/109708202/227393219-d50f512e-7e31-4d9f-9cdc-7db59204d141.png) 
- DF to show players who were drafted, what school they attened, combine stats, team and draft position

## Database
Description of Database build
1. Using AWS S3 and RDS, Google Colab, PySpark, and PostgreSQL/pgAdmin, we created a database containing two tables.
2. Tables:
    1. NFL
    2. School_by_Conference
3. The NFL table does not have a primary key, as there is not a unique identifier in the dataset (e.g. there are two players named Chris Jones). The School field in the School_by_Conference table is the primary key and can be used to join to the NFL table (where School is the foreign key).
4. Using the NFL and School_by_Conference tables in pgAdmin, preliminary analysis can be performed to find the number of each player type and position type represented at the NFL Combine, the average stats of each player type and position type, and the number of drafted and undrafted players by conference.

![ERD](https://user-images.githubusercontent.com/115508658/227053221-45f483d2-1b8d-439c-9fc3-8427fdcd5c69.png)

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

## Machine Learning
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

#### Position Type Differences
With these groups being clustered, we were able to create random forest models for each cluster. With these we used the feature_importance functionality of the random forest model to determine which features were most important for each cluster of players. This is particularly helpful, because, as shown above, the clusters are mainly built off of position types. This, then allows us, to determine which skills or drills are most important for a player depending on their position type. The results are shown below:
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Cluster_0_Importances.png" width="656" height="246">
</p>
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Cluster_1_Importances.png" width="656" height="246">
</p>
<p align="center">
<img src="https://github.com/c-pilot875/Group3_FinalProject/blob/Ben_Branch/Machine_Learning/Images/Cluster_2_Importances.png" width="656" height="246">
</p>

From these graphs we can see that the 40 yard dash is the most important feature for classes 0 and 2, but not quite as much for class 1 (running backs and linebackers). We can also see that, in general, skills that highlight attributes that are often associated with positions in a class often are not high up on the importance list (e.g. bench press reps are fairly low on the list for offensive and defensive linemen). This may be because all players at the combine are good at skills that are associated with their position, but being strong at other skills is what seperates the elite prospects from the very good. Finally, we can see that height is the lowest on the list for all three classes by a decent margin. This might signify that height has little to no impact on the future draft status of players and could potentially be left off of future models.

## Analytic Dashboard Using Tableau Stories
Using the data visualizatin tool Tableau Public Stories, the NFL Draft dataframes will be collected from the exploritory analysis and implamented into User Interactive charts within Stories. Dataframe images, cover pages containing the questions, and colors will be chosen by the team. Presentaiton flow is listed in order below:

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
Using the data visualizatin tool `Tablau Public`, the `NFL_Clean_Up.csv` file was uploaded for dashbaord creation. A single dashboard was generated with three distinct charts containing visual camparions of `Position Type` and `Player Type` performance statistics, Offence vs. Defence position representation, and the Power 5 Conference representation count.

### Initial Secondary Questions
* What position type or player type is most represented at the NFL Combine?
* What are the average performance statistics of the different position types?

## Visualization Dashboard

## [Tableau Dashboard Link](https://public.tableau.com/views/Group3FinalProjectDraft/RunningBackvsDefensiveLinemenStats?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

### Findings
* Using datapoints for `Position Type` and average points of measure `(Bench Press, Agility cone, Sprint 40yd, Shuttle)` an interactive filter to select `Position type` was added to display comparisons on performance statics. Drafted and Undrafted positions were separated by column. The most notable differences appeared in the average `Bench Press` suggesting strength plays an important factor on chances of being drafted.
* A pie chart was generated from the `Drafted Player Type (Offense vs Defense)` to determine percentage of each represented at the Combine. Offensive players were most represented with 50.40% while Defensive players made up 48%. Special players made up only 1.6%
* The vertical bar chart shows a comparison of the `Power Five Conferences Drafted vs Undrafted` player pick count and percentage. Hovering over each bar will indicate the specific data points for each Power Conference. The results showed that the SEC had more drafted players at 490 while the Big 12 had the least at 207.

![Tableau Dashboard]<img width="1218" alt="Dashboard_final" src="https://user-images.githubusercontent.com/115188500/230478707-c5e1cd6a-3474-49f9-83b7-46c504d1f0be.png">



