# Netflix Content Analysis

An end-to-end data analytics project that explores Netflix's content catalogue using Python, MySQL, and Power BI. The data was cleaned and analysed in a Jupyter Notebook, queried in MySQL, and presented through a 3-page interactive Power BI dashboard.

## Project Overview

This project answers questions such as:

- How large is the Netflix catalogue, and how is it split between movies and TV shows?
- Which release years, ratings, countries, and genres dominate?
- What do typical movie durations and TV show season counts look like?
- Who are the most frequent directors and actors?

## Tools & Technologies

- Python (Pandas, NumPy, Matplotlib, Seaborn)
- Jupyter Notebook
- MySQL
- Power BI

## Repository Structure

netflixContentAnalysis/
- netflix_data.csv 


## Workflow

1. Data inspection: Loaded the dataset in Python and checked shape, data types, missing values, and duplicates.
2. Data cleaning: Handled missing values (for example, an "Unknown" category for country), standardised formats, and split multi-value fields such as country, cast, and listed_in.
3. Exploratory analysis: Used Pandas and NumPy for aggregation, and Matplotlib for charts inside the notebook.
4. SQL analysis: Loaded the cleaned data into MySQL and wrote queries for counts, rankings, and category breakdowns.
5. Dashboarding: Built a 3-page Power BI dashboard with KPI cards, slicers, and interactive visuals.

## Dashboard Preview

### Page 1: Netflix Overview
KPI cards for total titles, movies, TV shows, average movie duration, and average TV show duration, plus release-year trends, category split, and titles by rating.
![Desktop 1] (Screenshots/Screenshot1.png)
