#Code Book

This document provides information about the generated sets by the script run_analysis.R, provided in this repository.

###Variables
+ xTrain
+ yTrain
+ xTest
+ yTest
+ subjectTrain
+ subjectTest
 
contain the data from the downloaded files.

+ `xTrain`, `yTrain`, `xTest`, `yTest`, `subjectTrain` and `subjectTest` contain the data from the downloaded files.
+ `trainingData` and `testData` merge the previous datasets to further analysis
+ `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `meansdVector`, a numeric vector used to extract the desired data.

+ A similar approach is taken with activity names through the activities variable.
`finalDaa` merges `trainingData` and `testData` in a big dataset.

+ Finally, `finalData` contains the relevant averages which will be later stored in a `.txt` file


###Activity Labels

+ WALKING (value 1): subject was walking during the test
+ WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
+ WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
+ SITTING (value 4): subject was sitting during the test
+ STANDING (value 5): subject was standing during the test
+ LAYING (value 6): subject was laying down during the test
