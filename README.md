# GettingDataAssignment
 Week 4 assignment for GettingData course

The R code run_analysis.R should be run (I wrote in Rstudio 1.2.5019).

R version 3.6.1 (2019-07-05)
Platform: x86_64-apple-darwin15.6.0 (64-bit)
Running under: macOS Mojave 10.14.6

With dplyr_0.8.3 attached.

The UCI Har dataset must be downloaded as a zip file and then extracted from zip.  Setwd() to the top folder of the extracted folder structure (above test and train folders)

Run the whole code from top to bottom (it is not a function so just select all and run).

The code works by adding the activity and then subject columns to the training data, doing the same for the test data and then rbinding the train and test together.

The inertial data was not used (following a hint among others from the 
legendary post https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

Only variables with std and mean were used (although there are some with Mean in the title - these are an angle between a vector and a Mean vector so don't count).

The activity numbers were then translated into the descriptive text using the "dictionary" of activity names.

The variable names were then made more descriptive (this is very subjective so I just tried to get rid of the things which confused me and make them clearer (eg the t or f at the front of each variable and the way 4 descriptors were chanined together).

I then grouped the data by activity and subject and summarised each to the mean.
