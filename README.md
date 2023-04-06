# Demo 💥


## Features

- Fast lightning processing with [**Polars**](https://pola-rs.github.io/polars-book/user-guide/index.html) 💥 
- [**Minio**](https://min.io/) as storage layer for easy local development and testing 📦
- Orchestration and flexible Docker deployments with [**Prefect**](https://www.prefect.io) 🕒
- [**Delta tables**](https://delta-io.github.io/delta-rs/python/index.html) for robust data versioning metadata handling and access 🌟


## Architecture 🏢

![Architecture](/img/architecture.png)

## ETL flow

![ETL](/img/etl_flow.png)

## Setup

- Run localtest.py to scrap
- Run following commands in terminal
```bash
build
docker-compose up
```
- Modify and run deploy.py to change Prefect Orchestration
- Run delta_read.py and delta_write.py for local Delta Tables testing

## To do

- Implement data quality and monitoring with [**Great Expectations**](https://greatexpectations.io/) integration with Prefect ✅
- Delta tables currently only in local deployment, direct integration with Minio pending
- Delta tables are generated first in local storage, then can be uploaded to Minio
- [**Duckdb**](https://duckdb.org/preset) setup with Minio to read delta tables 🚀
- [**Preset**](https://preset.io/) integration with Duckdb for better dashboard capabilities 📊


## Acknowledgements

- [rpeden](https://github.com/rpeden/prefect-docker-compose) for inspiration for Docker Compose
- [Paco Ibañez](https://github.com/fraibacas/prefect-orion) for the original Prefect and Minio Docker setup