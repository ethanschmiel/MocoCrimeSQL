# Overview of the Problem Montgomery County, MD, faces challenges in efficiently allocating law enforcement resources due to increasing crime rates, especially in violent crime (https://wtop.com/montgomery-county/2024/02/crime-increased-in-montgomery-county-for-third-straight-year-data-shows/) across different areas. With over 400,000 reported criminal incidents since mid-2016, understanding patterns and trends is critical for effective decision-making. The county government requires a data-driven approach to prioritize personnel deployment and funding allocation based on real-time crime trends, aiming to enhance public safety and optimize resource utilization.
Data and Modeling Approach The dataset comprises detailed information on over 400,000 criminal incidents, including variables such as offense type, location, time, and other contextual factors. Power BI was chosen for its robust data visualization and real-time update capabilities. The modeling approach involved the following steps:
Data Cleaning and Preparation:
Removed duplicate and incomplete records.
Standardized categorical data for consistent analysis.
Data Transformation:
Created calculated fields for metrics such as crime density and dates the crimes were committed
Categorized offenses into major crime types (e.g., violent crime, property crime).
Visualization and Dashboard Development:
Designed an interactive dashboard in Power BI to display key performance indicators (KPIs), heatmaps of crime hotspots, trend analyses, and demographic overlays.
Integrated filters for users to explore data by time period, crime type, and location.
Results of Data Analysis The Power BI dashboard revealed several critical insights:
Crime Trends:
A slight seasonal variation in crime rates, with peaks during the summer and autumn months.
Property crimes, such as theft and burglary, accounted for the majority of incidents, while violent crimes were less frequent but concentrated in specific areas.
Geospatial Patterns:
Heatmaps identified crime hotspots near urban centers and areas with high population density.
Certain types of crime were correlated with socioeconomic factors, such as income levels and access to public transportation.
Resource Allocation Insights:
Areas with consistently high crime rates require increased law enforcement presence.
Data-supported prioritization for funding in community-based programs targeting crime prevention.
Substantive Conclusions The analysis underscores the importance of targeted interventions and dynamic resource allocation in addressing crime. By leveraging the Power BI dashboard, Montgomery County’s law enforcement agencies can:
Deploy personnel strategically to crime hotspots during peak hours and days.
Invest in community initiatives and infrastructure improvements in areas with high property crime rates.
Monitor real-time crime trends and adjust strategies as needed, ensuring resources are used efficiently.
Overall, this data-driven approach empowers the county government to make informed decisions, ultimately enhancing public safety and optimizing law enforcement efforts.
Other Notes
During my analysis, I ran into some significant technical difficulties. Seeing as this was my first time utilizing tools such as Power BI and SQL, I had to do a lot of self-teaching to be able to derive actionable insights that could be of use to the Montgomery County government without being too bare-bones. For example, it took me a few days to be able to accurately format the maps I chose to include on my dashboard; I first tried to just put in ZIP Codes, but I realized that the ZIP Codes from the data were not entirely accurate, so I had to go into my SQL file and edit the list of valid ZIP Codes so my maps would make sense. Originally, I was getting places highlighted on my map that aren’t even in the United States, so this would skew the data and make it inaccurate. Another major issue I ran into was importing and exporting data sets from MySQL. I originally tried to use the import wizard embedded in the MySQL software, but this was extremely slow and hindered my productivity. I researched online solutions and tried countless different techniques to be able to successfully import my data, but none of them were successful and this went on for days. Once I found the solution, I felt elated because that meant I could finally get back to being productive. I ran into this same issue when trying to export my cleaned data, and the same process ensued; it took me a few days to learn how to export, but once I finally got it, it was smooth sailing from there. 
Something that I am still working on is trying to optimize my SQL queries so they don’t take as long to run. When I run the script I have, it takes multiple minutes to run, and I have large chunks of code that I believe could be shortened down to reduce my time spent waiting and being unproductive; however, as is with all things in life, practice makes perfect. I anticipate that when I work more with SQL, I will develop better and more efficient tactics to improve productivity which will eventually help me in the workplace. 
Finally, I have some recommendations to pose to the Montgomery County government:
Host a collaborative review sessions with law enforcement, community leaders, and government officials to assess the results of the project and how to allocate funds to reduce crime to lead to a safer environment for citizens
Create a government-owned, user-friendly dashboard available to the public so they can visualize crime data for themselves, which leads to transparency between the general public and law enforcement
Seek additional funding to expand the projects scope, such as integrating predictive analytics



