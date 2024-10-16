from airflow import DAG
from airflow.decorators import task


@task.virtualenv(
    requirements=["scikit-learn==1.5.2", "pandas==2.2.3"],
    system_site_packages=False
)
def collect_data():
    import pandas as pd
    from sklearn.datasets import load_wine

    wine_data = load_wine()
    wine_df = pd.DataFrame(wine_data.data, columns=wine_data.feature_names)
    wine_df["target"] = wine_data.target
    print(wine_df.head())


with DAG(
    dag_id="test02",
    description="Wine model.",
    schedule=None,
    tags=["example"]
) as dag:
    collect_data_task = collect_data()
