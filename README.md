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
