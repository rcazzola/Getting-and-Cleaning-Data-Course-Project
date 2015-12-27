#Code Book

This document provides information about the generated sets by the script `run_analysis.R`, provided in this repository.

###Variables
+ features
+ activityType
+ xTrain
+ yTrain
+ xTest
+ yTest
+ subjectTrain
+ subjectTest

###Description
+ `xTrain`, `yTrain`, `xTest`, `yTest`, `subjectTrain` and `subjectTest` contain the data from the downloaded files
+ `trainingData` and `testData` merge the previous datasets to further analysis
+ `finalData` contains the relevant averages which will be later stored in a `.txt` file


###Activity Labels

+ WALKING (value 1): subject was walking during the test
+ WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
+ WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
+ SITTING (value 4): subject was sitting during the test
+ STANDING (value 5): subject was standing during the test
+ LAYING (value 6): subject was laying down during the test
