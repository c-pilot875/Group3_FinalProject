# Group3_FinalProject

## Segement 1 Selected Topic - [insert]

* Purpose - 
* Question(s) - 

### Technology Used
* Languages: Python 3.7
* Technologies: 
* Tools: Machine Learning models from SciKitLearn and Imbalanced learn

### Data Source
Description
Source: https://www.kaggle.com/datasets/redlineracer/nfl-combine-performance-data-2009-2019

## Data Exploration and Processing
Description
1.
2.
3.
4.
[pic of final df]

## Database
Description
1.
2.
3.
4.
[pic of database mock]

## Machine Learning Mockup
### Overview
Machine Learning will be used to answer the main question of this analysis: Can we predict if a player who attends the NFL Combine will be drafted 
or undrafted with X% accuracy (75%)? To do this we will use a Random Forest Model with the following features:
- Height (m)
- Weight (kg)
- Sprint_40yd (40 yard sprint in s)
- Vertical_Jump (cm)
- Bench_Press_Reps (Maximum bench press repititions achieved while lifting 102.1 kg weight)
- Agility_3cone (Three-cone agility test time (s))
- Shuttle (Lateral shuttle time (s))
- BMI (Body mass index (kg/m^2)

These features will all be used to predict the classification target variable of whether a player is drafted or not.

### Model Choice
The random forest model (specifically the BalancedRandomForestClassifier from imblearn) is chosen because the importance of each feature can be extracted from this model. This will allow us to determine which attributes most contribute to whether a player is drafted or not, and which drills may be most important for a player to focus on improving. In addition, since the data is unbalanced (68% drafted, 32% undrafted), we will also check resampling techniques to see if they perform better than the random forest classifier.

### Other Machine Learning Questions
In addition to this main question, we also hope to answer some other questions using machine learning. First, we want to look at how different position groups differ. To answer this question, we will use the Position_Type column of our dataset to filter players into the following position groups:
1. Backs and Recievers
2. Offensive Linemen
3. Defensive Backs
4. Defensive Linemen
5. Linebackers

Since our dataset is already pretty low on datapoints, we don't expect to see very good accuracy in these models, but what information we can glean will hopefully allow us to see how these position groups differ.

Second, we will use k-means clustering on the same set of features to see if we can find any meaningful clusters in our data. Some possible meaning we hope to see in these clusters include position group, draft pick (higher draft picks clustered together), or college conference (players from better conferences clustered together).
