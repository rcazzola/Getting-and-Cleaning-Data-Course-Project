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


`trainingData` and `testData` merge the previous datasets to further analysis
`features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.

A similar approach is taken with activity names through the activities variable.
`all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.

Finally, `finalData` contains the relevant averages which will be later stored in a `.txt` file
