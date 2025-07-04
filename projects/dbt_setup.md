# Setting Up the NBA dbt Project (Run Once)

This short guide will help you set up the `nba.duckdb` database using `dbt`, a tool that lets us build SQL data pipelines in a clean, modular way.

You’ll only need to do this setup once — after that, you’ll use the database with Python and pandas.

---

## 1. Install the required Python packages

If you haven’t already, install the DuckDB adapter for dbt.

```bash
pip install dbt-duckdb
```

---

## 2. Navigate to the project folder

Make sure you're in the same folder as `dbt_project.yml`.

If your terminal is open elsewhere, move into the repo:

```bash
cd nba-dbt-pipeline
```

---

## 3. Run dbt to build the models

This command will:
- Run the SQL models inside the `/models` folder
- Build the cleaned and enriched tables
- Save them into the `nba.duckdb` file (inside `duckdb/`)

```bash
dbt build
```

You should see green ✅ messages like:
```
Finished running 6 models
```

---

## 4. Check that the database was created

After running `dbt build`, you should see a file at:

```
duckdb/nba.duckdb
```

This is the file you’ll query from Python using DuckDB and pandas.

---

## 5. What’s inside the database?

Here are the tables you’ll use in your analysis:

| Table Name              | Description                                  |
|-------------------------|----------------------------------------------|
| `player_stats`          | Raw player stat data                         |
| `player_stats_cleaned`  | Cleaned version with renamed columns         |
| `player_stats_enriched` | Includes derived metrics (e.g. rank, active) |
| `players`               | Raw player metadata                          |
| `players_cleaned`       | Cleaned player info (position, height, age)  |
| `top_scorers_by_season` | Final gold-layer table for top performers    |

---

## 6. You’re Done

Once this is built, you can start the tutorial notebook and connect to the DuckDB file like this:

```python
import duckdb
con = duckdb.connect('../duckdb/nba.duckdb')
```

From there, you’ll load tables into pandas and start exploring real NBA data.
