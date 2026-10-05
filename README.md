# \# Delivery Time Prediction using Big Data Analytics

# 

# \## 1. Project Overview

# 

# This project analyzes and predicts food delivery time using

# the Hadoop and Spark ecosystem.

# 

# The project demonstrates an end-to-end Big Data Analytics workflow:

# 

# Dataset → HDFS → Hive → Spark/PySpark → Data Cleaning →

# Exploratory Data Analysis → Machine Learning → Results

# 

# \## 2. Business Problem

# 

# Food delivery time is affected by several factors such as:

# 

# \- Delivery distance

# \- Weather conditions

# \- Traffic level

# \- Time of day

# \- Vehicle type

# \- Food preparation time

# \- Courier experience

# 

# The objective is to analyze these factors and build a machine

# learning model to predict delivery time.

# 

# \## 3. Dataset

# 

# Dataset: Food Delivery Times

# 

# Number of records: 1,000

# 

# Target variable:

# 

# `Delivery\_Time\_min`

# 

# \### Important Features

# 

# \- Distance\_km

# \- Weather

# \- Traffic\_Level

# \- Time\_of\_Day

# \- Vehicle\_Type

# \- Preparation\_Time\_min

# \- Courier\_Experience\_yrs

# 

# `Order\_ID` is used only as an identifier and is not used

# as a machine learning feature.

# 

# \## 4. Technologies Used

# 

# \- Hadoop HDFS

# \- Hive

# \- Apache Spark

# \- PySpark

# \- Spark MLlib

# \- Docker

# \- JupyterLab

# \- Python

# \- GitHub

# 

# \## 5. Architecture

# 

# Dataset

# ↓

# HDFS Raw Layer

# ↓

# Hive

# ↓

# Spark / PySpark

# ↓

# Data Cleaning

# ↓

# Exploratory Data Analysis

# ↓

# Feature Engineering

# ↓

# Machine Learning

# ↓

# Predictions

# ↓

# HDFS Results

# 

# \## 6. Data Storage

# 

# Raw dataset:

# 

# `/data/delivery/raw/`

# 

# Processed dataset:

# 

# `/data/delivery/processed/`

# 

# Prediction results:

# 

# `/data/delivery/results/`

# 

# \## 7. Data Cleaning

# 

# The project handles missing values using:

# 

# \- `Unknown` for missing categorical values

# \- Mean courier experience for missing numerical values

# 

# Duplicate records are also checked.

# 

# \## 8. Exploratory Data Analysis

# 

# The project analyzes delivery time according to:

# 

# \- Weather

# \- Traffic level

# \- Vehicle type

# \- Time of day

# \- Distance category

# 

# \## 9. Machine Learning

# 

# Two regression models are evaluated:

# 

# 1\. Linear Regression

# 2\. Random Forest Regression

# 

# \### Evaluation Metrics

# 

# \- MAE

# \- RMSE

# \- R²

# 

# The model with the better evaluation performance is selected

# as the final model.

# 

# \## 10. Results

# 

# Model results and prediction outputs are stored in the

# `results/` directory.

# 

# \## 11. Project Structure

# 

# ```text

# delivery-time-prediction-bigdata/

# │

# ├── README.md

# ├── hive/

# ├── spark/

# ├── hdfs/

# ├── data/

# ├── results/

# └── screenshots/

