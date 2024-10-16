from airflow import DAG
from airflow.decorators import task, dag


@task.virtualenv(
    requirements=['scikit-learn==1.5.2', 'pandas==2.2.3'],
    system_site_packages=False,
    venv_cache_path='/tmp/test04_venv' 
)
def collect_data():
    import pandas as pd
    from sklearn.datasets import load_wine

    wine_dataset = load_wine()
    X = wine_dataset['data'].tolist()
    y = wine_dataset['target'].tolist()  # Converting to a JSON-serializable list

    print(y)

    return {'X': X, 'y': y}


@task.virtualenv(
    requirements=['scikit-learn==1.5.2'],
    system_site_packages=False,
    venv_cache_path='/tmp/test04_venv'  # Reusing the same environment
)
def prepare_data(data):
    from sklearn.model_selection import train_test_split

    X = data['X']
    y = data['y']

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, shuffle=True, random_state=32)
    print(y_test)


@dag(
    dag_id="test04",
    description="Wine model.",
    schedule=None,
    tags=["example"]
)
def wine_dag():
    data = collect_data()
    prepare_data(data)


wine_dag()
