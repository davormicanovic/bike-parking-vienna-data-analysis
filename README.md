# Vienna Bike Parking – Data Analysis

## 📄 Project Overview
This project analyzes public data about bicycle parking stations in Vienna.  
The dataset contains information about each parking location, including its district (Bezirk), address, capacity (number of spots), and category.

The main goal of this project is to:
- Identify districts with the highest number of parking stations.
- Calculate the total parking capacity per district.
- Rank streets by total available parking spots.
- Provide insights that can be extended with visualizations (future work).

## 📂 Dataset
- **Source:** [data.gv.at – Fahrradabstellanlage OGD](https://www.data.gv.at/)  
- **Columns used:** Bezirk, Address, Capacity, Category  
- **Rows:** ~X,XXX  
- **Download date:** August 2025

## 🛠️ Tools & Technologies
- PostgreSQL
- SQL (CTE, Window Functions, Regex)
- pgAdmin 4

## 📊 SQL Highlights
The analysis includes:
- Grouping and aggregations (`GROUP BY`, `SUM`, `COUNT`)
- Common Table Expressions (CTE)
- Window functions (`RANK`, percentage calculations)
- String functions and regex for street name extraction

## 📑 Main Queries
1. **Top 10 Districts ordered by number of Parking spots**  
2. **Number of stations per district (Bezirk)**  
3. **Capacity per district with percentage of total**  
4. **Parking spots per Bezirk with ranking**  
5. **Top 10 addresses with most parking spots**

## 📈 Key Findings
- The top 3 districts account for 25,55% of total parking capacity.
- District 2 has the highest capacity 7096 and highest number of stations (630)
- Street Felberstraße (15. District) is the single most well-equipped street with 562 spots.
- Vienna has 68005 Bicycle parking spots

## 🚀 Future Work (V2)
- Extract longitude & latitude from the SHAPE column
- Create Tableau visualizations (map & bar charts)
- Add data quality checks (duplicates, null values)
- Calculate capacity percentiles and distribution


## 📬 Author
- Davor Micanovic – [LinkedIn](https://www.linkedin.com/in/davor-micanovic-63237b353/) | [GitHub](https://github.com/davormicanovic)
