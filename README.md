# 🚚 Delivery Time Prediction using Big Data Analytics

> **HCL GUVI × JAIN UNIVERSITY — Big Data Analytics Capstone Project**

A Big Data Analytics and Machine Learning pipeline for analyzing food-delivery operations and predicting delivery time using **HDFS, Hive, Apache Spark, and PySpark**.

---

## 📌 Project Overview

Delivery time is influenced by multiple operational and environmental factors such as:

- Delivery distance
- Weather conditions
- Traffic level
- Time of day
- Vehicle type
- Food preparation time
- Courier experience

This project develops an end-to-end Big Data Analytics workflow to store, process, analyze, and model delivery-time data using the Hadoop and Spark ecosystem.

The project follows the architecture:

```text
                    ┌──────────────────────┐
                    │   Food Delivery CSV  │
                    │      Dataset         │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │        HDFS          │
                    │   Distributed Store  │
                    └──────────┬───────────┘
                               │
                    ┌──────────┴───────────┐
                    │                      │
                    ▼                      ▼
             ┌─────────────┐       ┌──────────────┐
             │    Hive     │       │    Spark     │
             │ SQL Layer   │       │   PySpark    │
             └──────┬──────┘       └──────┬───────┘
                    │                     │
                    │              Data Cleaning
                    │              Transformation
                    │              EDA / ML
                    │                     │
                    └──────────┬──────────┘
                               ▼
                    ┌──────────────────────┐
                    │ Analytical Results   │
                    │ & Predictions         │
                    └──────────────────────┘
```

The capstone guide defines the expected flow as **Data Source → HDFS → Hive/Spark → Data Cleaning & Transformation → Distributed Analytics → Results**. :chatgpt-content-reference{index="1"}

---

# 🎯 Business Problem

Food-delivery platforms need to estimate how long an order will take to reach the customer.

Unexpectedly long delivery times can result in:

- Poor customer experience
- Order cancellations
- Reduced customer satisfaction
- Inefficient courier allocation
- Increased operational costs

The objective of this project is to analyze historical delivery data and identify the factors that influence delivery time while building machine-learning models capable of predicting delivery duration.

---

# 🎯 Project Objectives

The major objectives of this project are:

1. Store delivery data in **HDFS**.
2. Create a structured analytical layer using **Apache Hive**.
3. Perform distributed data processing using **Apache Spark/PySpark**.
4. Identify and handle missing values and duplicate records.
5. Perform exploratory data analysis.
6. Analyze the relationship between delivery time and operational factors.
7. Engineer features for machine-learning models.
8. Build delivery-time prediction models.
9. Compare model performance using appropriate regression metrics.
10. Store processed data and prediction results in HDFS.
11. Maintain a reproducible project using Git and GitHub.

---

# 📊 Dataset

### Dataset Name

`Food_Delivery_Times.csv`

### Dataset Size

- **Records:** 1,000
- **Features:** 9
- **Target Variable:** `Delivery_Time_min`

> Although the classroom dataset contains 1,000 records, the project demonstrates a distributed Big Data architecture that can be scaled to substantially larger datasets.

The project therefore focuses not only on dataset size, but also on demonstrating distributed storage, SQL analytics, Spark processing, and a reproducible Hadoop ecosystem workflow.

---

# 🗂️ Data Dictionary

| Column | Data Type | Description | Role |
|---|---|---|---|
| `Order_ID` | Integer | Unique order identifier | Identifier |
| `Distance_km` | Double | Delivery distance in kilometers | Feature |
| `Weather` | String | Weather condition during delivery | Feature |
| `Traffic_Level` | String | Traffic condition | Feature |
| `Time_of_Day` | String | Time period of delivery | Feature |
| `Vehicle_Type` | String | Vehicle used for delivery | Feature |
| `Preparation_Time_min` | Integer | Food preparation time | Feature |
| `Courier_Experience_yrs` | Double | Courier experience in years | Feature |
| `Delivery_Time_min` | Integer | Total delivery time in minutes | Target |

Detailed information is available in:

```text
data/data_dictionary.md
```

---

# 🏗️ Technology Stack

| Technology | Purpose |
|---|---|
| **Docker** | Runs the Big Data classroom environment |
| **Hadoop HDFS** | Distributed data storage |
| **NameNode** | HDFS metadata and namespace management |
| **DataNode** | Stores HDFS data blocks |
| **YARN** | Cluster resource management |
| **Apache Hive** | SQL-based data analysis |
| **Apache Spark** | Distributed data processing |
| **PySpark** | Python interface for Spark |
| **JupyterLab** | Interactive development environment |
| **Python** | Data analysis and machine learning |
| **Scikit-learn** | Machine-learning models |
| **Git/GitHub** | Version control and reproducibility |

The supplied university environment is based on Windows CMD, Docker, HDFS, YARN, Hive, Spark/PySpark, HBase, Pig and Jupyter. :chatgpt-content-reference{index="2"}

---

# 🔄 End-to-End Architecture

```text
Food_Delivery_Times.csv
          │
          ▼
     Local / Jupyter
          │
          ▼
     NameNode Container
          │
          ▼
         HDFS
          │
     ┌────┴─────┐
     │          │
     ▼          ▼
   Hive      Spark
     │          │
     │          ▼
     │     Data Cleaning
     │          │
     │          ▼
     │      Transformation
     │          │
     │          ▼
     │      EDA + ML
     │          │
     └────┬─────┘
          ▼
   Analytical Results
          │
          ▼
    HDFS Results
          │
          ▼
     GitHub / Report
```

---

# 🗄️ HDFS Data Organization

The project uses the following HDFS structure:

```text
/data/delivery/
│
├── raw/
│   └── Food_Delivery_Times.csv
│
├── processed/
│   └── processed delivery data
│
└── results/
    └── prediction / analytical results
```

The raw dataset is stored at:

```text
hdfs://namenode:8020/data/delivery/raw/Food_Delivery_Times.csv
```

The processed dataset is stored under:

```text
hdfs://namenode:8020/data/delivery/processed
```

---

# 🐘 HDFS Operations

The project demonstrates essential HDFS operations including:

```bash
hdfs dfs -mkdir -p /data/delivery/raw
```

```bash
hdfs dfs -mkdir -p /data/delivery/processed
```

```bash
hdfs dfs -mkdir -p /data/delivery/results
```

```bash
hdfs dfs -ls /data/delivery/raw
```

```bash
hdfs dfs -ls /data/delivery/processed
```

The complete command reference is available in:

```text
hdfs/hdfs_commands.txt
```

The university capstone specifically requires the dataset to be stored and managed through HDFS and relevant HDFS commands to be demonstrated. :chatgpt-content-reference{index="3"}

---

# 🐝 Hive Data Layer

Apache Hive is used as the SQL-oriented analytical layer.

### Database

```text
delivery_db
```

### Table

```text
delivery_data
```

### Storage Format

```text
PARQUET
```

### HDFS Location

```text
hdfs://namenode:8020/data/delivery/processed
```

The Hive table contains:

```text
order_id
distance_km
weather
traffic_level
time_of_day
vehicle_type
preparation_time_min
courier_experience_yrs
delivery_time_min
```

### Example Hive Query

```sql
USE delivery_db;

SELECT
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_min), 2) AS average_delivery_time
FROM delivery_data;
```

### Distance-Based Analysis

The project also categorizes delivery distance into:

```text
Short       < 5 km
Medium      5–10 km
Long        10–15 km
Very Long   15+ km
```

Hive SQL scripts are available in:

```text
hive/
├── 01_create_database.sql
├── 02_create_table.sql
└── 03_analysis_queries.sql
```

---

# ⚡ Spark / PySpark Processing

Apache Spark is used for distributed data processing and analytics.

The Spark workflow includes:

### 1. Spark Session

A Spark session is created using the classroom Spark cluster.

### 2. Read Data from HDFS

```python
df = (
    spark.read
    .option("header", True)
    .option("inferSchema", True)
    .csv(
        "hdfs://namenode:8020/data/delivery/raw/Food_Delivery_Times.csv"
    )
)
```

### 3. Data Quality Checks

The workflow checks:

- Number of records
- Schema
- Missing values
- Duplicate records
- Data types
- Invalid values

### 4. Data Cleaning

Missing categorical values are handled using:

```text
Unknown
```

Missing courier experience values are replaced using the calculated mean experience.

After cleaning:

```text
Missing values = 0
Duplicate records = 0
```

### 5. Transformation

The Spark workflow creates analytical variables such as distance categories and prepares the dataset for machine learning.

---

# 📈 Exploratory Data Analysis

The project analyzes delivery time against several variables.

## Weather Analysis

The dataset contains weather conditions including:

- Clear
- Rainy
- Snowy
- Foggy
- Windy
- Unknown

The analysis compares the number of deliveries and average delivery time for each weather category.

---

## 🚦 Traffic Analysis

Traffic level is analyzed to determine its relationship with delivery duration.

The analysis examines:

```text
Traffic Level
      ↓
Number of Orders
      ↓
Average Delivery Time
```

---

## 🛵 Vehicle Analysis

Delivery performance is compared across:

- Bike
- Scooter
- Car

---

## 🕐 Time-of-Day Analysis

Delivery time is analyzed across:

- Morning
- Afternoon
- Evening
- Night

---

## 📍 Distance Analysis

Distance shows a clear operational relationship with delivery time.

| Distance Category | Orders | Average Delivery Time |
|---|---:|---:|
| Short (<5 km) | 248 | 34.33 min |
| Medium (5–10 km) | 240 | 49.04 min |
| Long (10–15 km) | 261 | 63.30 min |
| Very Long (15+ km) | 251 | 79.40 min |

### Key Observation

Average delivery time increases substantially as delivery distance increases.

This makes **distance** an important predictive feature for delivery-time estimation.

---

# 🤖 Machine Learning

The project treats:

```text
Delivery_Time_min
```

as the regression target.

### Input Features

Numerical features:

```text
Distance_km
Preparation_Time_min
Courier_Experience_yrs
```

Categorical features:

```text
Weather
Traffic_Level
Time_of_Day
Vehicle_Type
```

`Order_ID` is treated as an identifier and is not used as a predictive feature.

---

# 🧠 Machine Learning Pipeline

The PySpark ML workflow includes:

```text
Raw Features
     │
     ▼
StringIndexer
     │
     ▼
OneHotEncoder
     │
     ▼
VectorAssembler
     │
     ▼
Training / Testing Split
     │
     ▼
Regression Model
     │
     ▼
Predictions
     │
     ▼
Model Evaluation
```

---

# 📚 Models

The project evaluates multiple regression algorithms.

### Linear Regression

Used as a baseline regression model.

### Random Forest Regression

Used to capture nonlinear relationships between delivery conditions and delivery time.

The final model will be selected based on the evaluation metrics obtained from the Spark ML workflow.

---

# 📏 Model Evaluation

The following regression metrics are used:

### RMSE

Root Mean Squared Error measures the typical prediction error magnitude.

### MAE

Mean Absolute Error measures the average absolute difference between actual and predicted delivery time.

### R²

R² measures how much variation in delivery time is explained by the model.

> Model scores will be added here after the final Spark ML execution is completed.

| Model | RMSE | MAE | R² |
|---|---:|---:|---:|
| Linear Regression | TBD | TBD | TBD |
| Random Forest Regression | TBD | TBD | TBD |

---

# 📊 Business Insights

Based on the completed exploratory analysis:

### 1. Distance is a major delivery-time factor

Longer delivery distances are associated with considerably higher average delivery times.

### 2. Weather can affect delivery performance

Adverse weather conditions show different delivery-time patterns compared with clear conditions.

### 3. Vehicle type provides operational information

Delivery performance varies across bikes, scooters and cars.

### 4. Preparation time is operationally important

Longer food preparation can contribute directly to total delivery duration.

### 5. Courier experience can provide predictive information

Courier experience is included as a feature because courier characteristics may influence delivery performance.

Final business conclusions will be updated after completing the model evaluation and remaining Spark analytics.

---

# 📁 Project Structure

```text
delivery-time-prediction-bigdata/
│
├── README.md
│
├── data/
│   └── data_dictionary.md
│
├── hdfs/
│   └── hdfs_commands.txt
│
├── hive/
│   ├── 01_create_database.sql
│   ├── 02_create_table.sql
│   └── 03_analysis_queries.sql
│
├── results/
│
├── screenshots/
│
└── spark/
    └── Delivery_Time_Prediction.ipynb
```

The structure follows the capstone reference pattern of separate HDFS, Hive, Spark, results, screenshots and documentation sections. :chatgpt-content-reference{index="4"}

---

# 🚀 How to Run the Project

## 1. Start Docker

Open Windows Command Prompt and navigate to the supplied Big Data environment:

```cmd
cd C:\bigdata-docker
```

Start the complete stack:

```cmd
docker-compose --profile full up -d
```

Check the services:

```cmd
docker-compose ps
```

---

# 2. Access JupyterLab

Open:

```text
http://localhost:8888
```

Use the configured classroom Jupyter access.

---

# 3. Upload Dataset to HDFS

The dataset is transferred through the Windows host and NameNode container before being placed into HDFS.

Verify:

```cmd
docker exec -it namenode hdfs dfs -ls /data/delivery/raw/
```

Expected file:

```text
Food_Delivery_Times.csv
```

---

# 4. Start Spark Analysis

Open:

```text
spark/Delivery_Time_Prediction.ipynb
```

Execute the notebook cells sequentially.

The notebook performs:

```text
Spark initialization
        ↓
HDFS data loading
        ↓
Data quality checks
        ↓
Cleaning
        ↓
Transformation
        ↓
EDA
        ↓
Feature engineering
        ↓
Machine learning
        ↓
Model evaluation
        ↓
Prediction results
```

---

# 5. Run Hive Analysis

Enter the HiveServer2 container:

```cmd
docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000
```

Select the project database:

```sql
USE delivery_db;
```

Then execute the SQL scripts from:

```text
hive/
```

---

# 🔍 Validation

The project validates the complete pipeline through:

- Docker service status
- HDFS directory verification
- HDFS file verification
- Spark HDFS read
- Spark record count
- Data-quality checks
- Hive database verification
- Hive table verification
- Hive SQL results
- Spark analytical results
- Machine-learning predictions
- GitHub version control

The capstone guide emphasizes that running containers alone is not sufficient; the actual HDFS, Spark and Hive workflow must be demonstrated. :chatgpt-content-reference{index="5"}

---

# 📌 Results

## Dataset Statistics

| Metric | Value |
|---|---:|
| Total Records | 1,000 |
| Total Columns | 9 |
| Average Delivery Time | 56.73 min |
| Minimum Delivery Time | 8 min |
| Maximum Delivery Time | 153 min |
| Duplicate Records | 0 |
| Missing Values After Cleaning | 0 |

---

## Distance Analysis

| Category | Average Delivery Time |
|---|---:|
| Short | 34.33 min |
| Medium | 49.04 min |
| Long | 63.30 min |
| Very Long | 79.40 min |

---

## Machine Learning Results

Final model performance will be documented after completing the Spark ML execution:

| Model | RMSE | MAE | R² |
|---|---:|---:|---:|
| Linear Regression | TBD | TBD | TBD |
| Random Forest Regression | TBD | TBD | TBD |

---

# 📌 Limitations

1. The current dataset contains 1,000 records and is primarily suitable for demonstrating the Big Data architecture in the classroom environment.
2. The dataset does not contain some operational variables that may influence real-world delivery time, such as:
   - Customer location
   - Restaurant location
   - Courier location
   - Order volume
   - Exact order timestamp
   - Route information
3. The dataset is therefore better suited for demonstrating the analytical pipeline than for production deployment.
4. Model performance depends on the available features and dataset quality.

---

# 🔮 Future Enhancements

The project can be extended by adding:

- Larger real-world delivery datasets
- Real-time delivery streams
- GPS/location information
- Restaurant preparation workload
- Courier availability
- Route optimization
- Weather APIs
- Real-time traffic data
- Spark Structured Streaming
- Model monitoring
- Automated prediction services
- Dashboard integration

For larger datasets, the same HDFS → Hive → Spark architecture can be scaled to support distributed storage and processing.

---

# 👥 Team Contributions

| Team Member | Responsibility | Evidence |
|---|---|---|
| Student 1 | Data Ingestion + HDFS | HDFS commands and dataset storage |
| Student 2 | Hive + Data Modeling | Hive database, table and SQL |
| Student 3 | Spark + PySpark | Notebook, transformations and analytics |
| Student 4 | Advanced Technology | HBase/Pig where applicable |
| Student 5 | Integration + Documentation | README, results and integration |

> Update this section with the actual names and contributions of your team members.

The university capstone guide expects every student to have a genuine technical contribution and be able to explain their work during the viva. :chatgpt-content-reference{index="6"}

---

# 🎓 Academic Context

**Institution:** Jain University  
**Program:** M.Sc. Data Science & Analytics  
**Project:** Big Data Analytics Capstone  
**Project Topic:** Delivery Time Prediction  
**Technology Focus:** HDFS + Hive + Spark/PySpark  

---

# 📝 Viva Preparation

Team members should be prepared to explain:

1. Why was this problem selected?
2. Why is Big Data technology useful?
3. Why was HDFS used?
4. What is the role of NameNode and DataNode?
5. What is the role of YARN?
6. Why was Hive used?
7. Why was Spark used?
8. What transformations were performed?
9. How were missing values handled?
10. How were machine-learning features created?
11. Why were Linear Regression and Random Forest used?
12. How were the models evaluated?
13. What happens when a Spark job is executed?
14. How does the complete pipeline work?
15. What was your individual contribution?

These topics align with the technical viva areas specified in the capstone guide. :chatgpt-content-reference{index="7"}

---

# 📚 References

- HCL GUVI × JAIN UNIVERSITY — Big Data Analytics Student Stack Self-Check & Capstone Guide
- HCL GUVI × JAIN UNIVERSITY — Big Data Analytics Reference Sample Project
- Apache Hadoop Documentation
- Apache Hive Documentation
- Apache Spark Documentation
- Scikit-learn Documentation

---

# ⭐ Project Status

```text
HDFS                  ✅ Completed
Hive Database         ✅ Completed
Hive Table            ✅ Completed
Hive Queries          ✅ In Progress / Expanding
Spark Setup           ✅ Completed
Spark HDFS Read       ✅ Completed
Data Cleaning         ✅ Completed
EDA                   ✅ Completed
Feature Engineering   ✅ Completed
ML Models             🔄 In Progress
Model Evaluation      🔄 In Progress
Final Results         🔄 In Progress
GitHub Documentation  ✅ Completed
```

---

## 📌 Note

This project is developed for academic Big Data Analytics purposes using the supplied HCL GUVI × JAIN University classroom environment.

The architecture demonstrates distributed storage and processing using HDFS, Hive and Spark/PySpark. The project should not be interpreted as a production food-delivery prediction system without further validation on larger and real-world operational data.