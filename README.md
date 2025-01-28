# Crime Analysis and Resource Allocation for Montgomery County, MD

## Overview of the Problem
Montgomery County, MD, faces challenges in efficiently allocating law enforcement resources due to increasing crime rates, especially in violent crime ([source](https://wtop.com/montgomery-county/2024/02/crime-increased-in-montgomery-county-for-third-straight-year-data-shows/)). With over 400,000 reported criminal incidents since mid-2016, understanding patterns and trends is critical for effective decision-making. The county government requires a data-driven approach to prioritize personnel deployment and funding allocation based on real-time crime trends, aiming to enhance public safety and optimize resource utilization.

---

## Data and Modeling Approach

### Dataset
The dataset comprises detailed information on over 400,000 criminal incidents, including variables such as:
- Offense type
- Location
- Time
- Contextual factors

### Tool Selection
Power BI was chosen for its robust data visualization and real-time update capabilities.
SQL was chosen for its ability to quickly clean and arrange data.

### Steps
1. **Data Cleaning and Preparation**:
   - Removed duplicate and incomplete records.
   - Standardized categorical data for consistent analysis.
2. **Data Transformation**:
   - Created calculated fields for metrics such as crime density and crime dates.
   - Categorized offenses into major crime types (e.g., violent crime, property crime).
3. **Visualization and Dashboard Development**:
   - Designed an interactive Power BI dashboard to display:
     - Key performance indicators (KPIs)
     - Heatmaps of crime hotspots
     - Trend analyses
     - Demographic overlays
   - Integrated filters for users to explore data by time period, crime type, and location.

---

## Results of Data Analysis

### Crime Trends
- Slight seasonal variation in crime rates, with peaks during summer and autumn.
- Property crimes, such as theft and burglary, accounted for most incidents.
- Violent crimes, while less frequent, were concentrated in specific areas.

### Geospatial Patterns
- Heatmaps identified crime hotspots near urban centers and areas with high population density.
- Certain types of crime correlated with socioeconomic factors like income levels and access to public transportation.

### Resource Allocation Insights
- Areas with consistently high crime rates require increased law enforcement presence.
- Data-supported prioritization for funding in community-based programs targeting crime prevention.

---

## Substantive Conclusions
The analysis highlights the importance of targeted interventions and dynamic resource allocation. With the Power BI dashboard, Montgomery County’s law enforcement agencies can:
- Strategically deploy personnel to crime hotspots during peak hours and days.
- Invest in community initiatives and infrastructure improvements in high-property-crime areas.
- Monitor real-time crime trends and adjust strategies, ensuring efficient resource utilization.

---

## Challenges Encountered

### Technical Difficulties
- **Geospatial Data Issues**: 
  - Initial mapping using ZIP Codes was inaccurate, requiring manual correction in SQL.
- **Data Import/Export**: 
  - Struggled with MySQL’s import wizard, leading to delays. Eventually resolved through online research and trial-and-error.
- **Query Optimization**: 
  - Current SQL scripts take minutes to run. Optimizing queries remains a work in progress to improve productivity.

---

## Recommendations for Montgomery County
1. **Collaborative Review Sessions**:
   - Involve law enforcement, community leaders, and government officials to assess findings and allocate resources effectively.
2. **Public Dashboard**:
   - Create a user-friendly dashboard accessible to the public for transparency between citizens and law enforcement.
3. **Expand Scope**:
   - Seek additional funding to integrate predictive analytics for proactive crime prevention.

--- 

## Reflection
Through this project, I’ve gained valuable experience with Power BI and SQL, overcoming challenges that have enhanced my technical skills. As I continue to refine my SQL queries and data analysis techniques, I am confident these skills will translate into professional success.
