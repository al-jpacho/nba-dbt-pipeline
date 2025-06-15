# NBA Analytics Pipeline with dbt & DuckDB

This project demonstrates a modular data pipeline using the [nba\_api](https://github.com/swar/nba_api), DuckDB, and dbt. It follows a medallion architecture—Bronze, Silver, and Gold layers—to ingest, clean, and transform NBA player data for the 2024–2025 season.

---

## Project Overview

This project:

* Ingests player metadata and season statistics using the `nba_api`
* Loads raw data into DuckDB (Bronze layer)
* Cleans, normalises, and enriches the data (Silver layer)
* Builds an analytics-ready table of the top scorers (Gold layer)
* Uses dbt for transformations, testing, and documentation
* Demonstrates best practices in data modelling and pipeline design

---

## Architecture

```
              ┌────────────┐
              │  API Data  │  ← nba_api
              └─────┬──────┘
                    ▼
        ┌─────────────────────┐
        │    Bronze Layer     │
        │ Raw data ingestion  │
        └────────┬────────────┘
                 ▼
        ┌─────────────────────┐
        │    Silver Layer     │
        │ Cleaned, typed data │
        └────────┬────────────┘
                 ▼
        ┌──────────────────────┐
        │     Gold Layer       │
        │ Analytics-ready data │
        └──────────────────────┘
```

---

## Tools Used

| Tool      | Purpose                                |
| --------- | -------------------------------------- |
| `nba_api` | Pulls real-time NBA player data        |
| `DuckDB`  | Local OLAP database engine             |
| `dbt`     | Transformation, testing, documentation |
| `pandas`  | Preprocessing in Python                |
| `Jupyter` | Interactive notebook environment       |

---

## Features

* Automated ingestion of NBA player and stat data
* Modular dbt models aligned to medallion architecture
* Data cleaning, typing, and enrichment in Silver models
* Gold model output ranking top scorers
* Testable, maintainable structure using dbt's best practices
* Interactive notebook walkthrough and Python ingestion script

---

## Directory Structure

```
nba-dbt-pipeline/
├── duckdb/                   # DuckDB database
├── models/                   # dbt models (bronze/silver/gold)
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── notebooks/                # Development notebooks
│   └── nba_pipeline.ipynb
├── scripts/                  # Data ingestion scripts
│   └── ingest_raw_data.py
├── dbt_project.yml
├── README.md
└── requirements.txt
```

---

## Example Output

Gold model output showing top 10 scorers for the 2024–2025 NBA season:

| player\_id | full\_name              | team\_name | points\_per\_game | games\_played | season    | player\_rank |
| ---------- | ----------------------- | ---------- | ----------------- | ------------- | --------- | ------------ |
| 1628983    | Shai Gilgeous-Alexander | Thunder    | 32.7              | 76            | 2024-2025 | 1            |
| 203507     | Giannis Antetokounmpo   | Bucks      | 30.4              | 67            | 2024-2025 | 2            |

---

## Installation

Clone the repository and install dependencies:

```bash
git clone https://github.com/your-username/nba-dbt-pipeline.git
cd nba-dbt-pipeline
pip install -r requirements.txt
```

---

## Usage

1. Run the data ingestion script:

```bash
python scripts/ingest_nba_data.py
```

2. Compile and run dbt transformations:

```bash
dbt compile
dbt run
```

3. Explore the data using the notebook:

```bash
jupyter notebook notebooks/nba_pipeline_dev.ipynb
```

---

## License

This project is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).