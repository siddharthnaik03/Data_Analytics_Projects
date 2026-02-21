# Accenture_Forage_Data-Analytics-and-Visualization_Virtual-Internship

Social Buzz is a fast growing tech unicorn that needs to adapt quickly to their global scaling process efficiently. Accenture will run 3 months POC and the Data Team will focusing in an analysis of their content categories that highlights the top 5 categories with the largest aggregate popularity.
Social Buzz has over 100.000 posts per day that can be assumed to have 36.500.000 posts per year. We will analyze the sample of this dataset from them.

### Data Cleaning & Modelling
•	In this step, we will use Ms. Excel to cleaning and modelling .First we will look into the 3 tables that provided into us, “Content”, “Reactions” and “Reaction Types” tables. Now we will filter all of it and check the value within it whether it already good or not.

•	Now we have cleaned datasets, with total rows of 24.574 rows (with header) of “Reactions” table. This table is our fact table to JOIN “Content” and “Reaction Types” tables into it as our data modelling.

•	We will join it With VLOOKUP, we joining the three tables we need to look into column with the same values, for “Content Type” and “Category”, we use “Content ID”, and for “Sentiment” and “Score”, we use “Reaction Type”. 

### Data Visualization 	
##### Insights:
•	Bar Chart represnts The top 5 categories based on positive sentiments here animal category on top with 1044 counts. 

•	Line chart represents Post per months May 2021 has the most posts of 2138 counts.

•	Pie Charts represents the Content Types Popularity Photo type secured top with 26% with value of 6.54k  popularity among other 3 types of video, GIF and Audio.

•	 The top 5 categories scored on Social Buzz are Animals, Science, Healthy Eating, Technology, and Food.  With 74k Animals category on the first spot and Science Category  in 2nd spot with score rate of 71k

•	KPI Indicates Over All 16 unique Category, 39.62 Average Score,13.72k Positive Sentiments and 7.65k Negative sentiments.

![social buzz](https://github.com/user-attachments/assets/f3a055d1-aef6-4ed2-9b43-d1d808e6c0bd)
