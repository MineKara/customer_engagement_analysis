# Customer Engagement Analysis & Visualization Dashboard

This project involves creating a multi-page data analysis and visualization dashboard using SQL and Tableau. The dashboard provides insights into student engagement, course popularity, registration trends, and more for an e-learning platform. The project utilizes SQL for data retrieval and manipulation, and Tableau for data visualization and dashboard creation.

[Tableau Link](https://public.tableau.com/views/CustomerEngagement_17253909338880/Page1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) : 
The dashboard link has been added to the Tableau Public website.

<p align="center" width="100%">
    <img width="60%" src="https://i.imghippo.com/files/NBwEb1725393111.jpg">
</p>


## Table of Contents
- [Project Overview](#project-overview)
- [Setup and Installation](#setup-and-installation)
- [Data Sources](#data-sources)
- [SQL Queries](#sql-queries)
- [Tableau Visualizations](#tableau-visualizations)
- [Dashboard Features](#dashboard-features)
- [Analysis Results](#analysis-results)
- [Future Improvements](#future-improvements)

## Project Overview<a name="project-overview"></a>

The goal of this project is to analyze data from an e-learning platform to gain insights into user behavior, course popularity, and student engagement. The project is divided into multiple parts:
1. **SQL Queries**: Used for extracting and transforming data.
2. **Tableau Visualizations**: Used for creating interactive dashboards to display the insights derived from the data.
3. **Dashboard Creation**: Combining visual elements into a cohesive, user-friendly dashboard.

## Setup and Installation<a name="setup-and-installation"></a>

### Prerequisites
- **SQL**: Ensure that you have access to a SQL environment where you can run queries.
- **Tableau**: Tableau Desktop installed on your machine for creating and viewing dashboards.
- **Data Files**: Obtain the data files and ensure they are placed in the `data/` directory.

### Installation Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/customer_engagement_analysis.git
   cd customer_engagement_analysis

## Data Sources<a name="data-sources"></a>
365_database.sql includes 5 different table view:
* **365_course_info:** Contains information about different courses offered on the platform.
* **365_student_learning:** Tracks students' learning activities, including minutes watched.
* **365_course_ratings:** Provides ratings for different courses.
* **365_student_purchases:** Contains information about students' purchases and subscription details.
* **365_student_info:** Details about student demographics and registration dates.


##  SQL Queries<a name="sql-queries"></a>
**1. Course Information Query** 
* A common table expression (CTE) named title_total_minutes is used to join 365_course_info and 365_student_learning tables,
  providing insights into the number of students and total minutes watched per course.
* The result is then extended to calculate average minutes watched per course and to incorporate course ratings.
  
**2. Purchases Information Query**
* A view named purchases_info is created to extract and transform data related to student purchases. The end date of the subscription is calculated based on the purchase type (Monthly, Quarterly, Annual).

**3. Students Information Query**
* This query uses a LEFT JOIN to ensure all students are considered, whether they have watched lectures or not. Additional columns are created to track the minutes watched and the onboarding status of students.

## Tableau Visualizations<a name="tableau-visualizations"></a>
* **Table:** Displays courses sorted by total minutes watched, along with average minutes, number of ratings, and average ratings.
* **Funnel Charts:** Visualize the number of registered students and minutes watched, filtered by country, user type, and registration date.
* **Combo Chart:** Shows both total minutes watched and average minutes watched per month.
* **Stacked Bar Chart:** Illustrates the fraction of onboarded students over time.


## Dashboard Features<a name="dashboard-features"></a>
The dashboard is designed with the following features:

* **Navigation Buttons:** To switch between different dashboard pages.
* **KPIs:** Key Performance Indicators to quickly understand the number of registered students, total minutes watched, average minutes watched, and the percentage of onboarded students.
* **Interactive Charts:** Allow filtering by parameters such as registration month and user type (free or paying).
* **Country-Based Analysis:** Insights into student distribution and engagement across different countries.

## Analysis Results<a name="analysis-results"></a>
* The most popular course is "Introduction to Data and Data Science," with high engagement and ratings.
* Monthly registration trends show consistent growth, with over 50% of registered students onboarding and engaging with the content.
* SQL and Python are among the most engaging courses in terms of average minutes watched per student.
* Seasonal variations in student engagement indicate higher activity during specific months.

## Future Improvements<a name="future-improvements"></a>
* User Experience Testing: Conduct UX testing to identify potential barriers to onboarding.
* Content Optimization: Regularly update courses to keep content relevant and engaging.
* Enhanced Filtering: Introduce more granular filtering options in the dashboard.
* Predictive Analytics: Incorporate machine learning models to predict student behavior and recommend courses.

Let me know if you need further assistance or modifications!
