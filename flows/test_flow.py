from prefect import flow, get_run_logger

@flow(name="Prefect Cloud Quickstart")
def quickstart_flow():
    logger = get_run_logger()
    logger.warning("Prefect quickstart flow is running on Docker!")

if __name__ == "__main__":
    quickstart_flow()