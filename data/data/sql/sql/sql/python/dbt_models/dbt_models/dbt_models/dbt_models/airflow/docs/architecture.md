# Architecture Overview

## Project Purpose

This project demonstrates a modern data engineering pipeline that ingests raw customer, product, and transaction data, transforms it into clean analytics-ready models, and validates data quality before downstream reporting.

## Pipeline Flow

1. Raw CSV files are stored in the `data/` folder.
2. Python ingestion script reads and validates the raw files.
3. SQL scripts define warehouse table structures.
4. dbt-style staging models clean and standardize raw data.
5. The final sales fact model joins customer, product, and transaction data.
6. Data quality checks validate duplicates, nulls, negative amounts, and orphan records.
7. Airflow DAG orchestrates the end-to-end workflow.

## Architecture Diagram

```text
Raw CSV Data
     |
     v
Python Ingestion
     |
     v
Warehouse Tables
     |
     v
dbt Staging Models
     |
     v
Sales Fact Model
     |
     v
Data Quality Checks
     |
     v
Reporting / BI Layer
