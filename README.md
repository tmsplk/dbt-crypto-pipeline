# dbt Crypto Pipeline Project

## 📌 Overview
This repository contains a **dbt (Data Build Tool) project** that processes cryptocurrency data using DuckDB. The project follows a structured transformation approach with defined layers:

- **Raw Layer:** Initial ingestion of crypto data.
- **Clean Layer:** Data cleansing and standardization.
- **Curated Layer:** Business logic transformations.
- **Aggregated Layer:** Summarized data for reporting.

The project leverages dbt's modeling capabilities, macros, and packages to streamline data transformations.

## 🏗 Project Structure
```
/dbt_learn-main
│-- dbt_project.yml         # dbt project configuration
│-- dev.duckdb              # Local DuckDB database
│-- packages.yml            # dbt dependencies
│-- macros/                 # Custom dbt macros
│-- models/                 # SQL models for transformations
│   ├── raw/                # Raw data ingestion
│   ├── clean/              # Data cleaning models
│   ├── curated/            # Business logic models
│   ├── aggregate/          # Aggregated reporting models
│-- analyses/               # Analytical queries
│-- tests/                  # dbt tests
│-- .gitignore              # Ignore untracked files
│-- README.md               # Project documentation
```

## 🛠 Installation
```sh
# Clone the repository
git clone <repo_url>
cd dbt_learn-main

# Install dbt (if not installed)
pip install dbt-duckdb

# Install dependencies
dbt deps
```

## 🛠 Running dbt Commands
```sh
# Run all models
dbt run

# Test models
dbt test

# Generate documentation
dbt docs generate

# View documentation
dbt docs serve
```

## Custom Macros
This project includes custom macros such as `dynamic_union.sql`, which allows dynamic merging of tables.

## Database
The project uses **DuckDB** for local execution and storage of transformed data. The `dev.duckdb` file contains the working database.

## 📜 License
This project is licensed under the MIT License.

## ✨ Contributors
- **[@tmsplk](https://github.com/tmsplk)** - Maintainer