---
title: "Readme for Course Project"
output: html_document
---
Peter Randazzo  
peter@ranbek.net  
prepared for Course Project, Getting and cleaning Data, January 2015     

Upon execution with the following steps, run_analysis.R will take data sourced from the Human Activity Recognition Using Smartphones Dataset , Version 1.0., import it, transform it as described in CodeBook.md, create a subdirectory ("/tidy") if it doesnt already exist for output, and export the file tidy_data.txt as specified in CodeBook.md in the aforementioned subdirectory.

###Steps
1. Ensure the source data is present in the default locations contained by the unpacked zip file. When unpacked the following folders should be present.    
 + /UCI HAR Dataset : root folder    
 + /UCI HAR Dataset/test : test data    
 + /UCI HAR Dataset/train : training data    

2. Ensure the following libraries are available to your environment as they are loaded by the script.    
 + pylr    
 + data.table    
 + reshape2    

3. Ensure the root folder for the source data ("/UCI HAR Dataset") is in your current working directory.     

4. Execute run_analysis.R    
