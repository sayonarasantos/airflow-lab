import pandas as pd
from sklearn.datasets import load_wine

wine_data = load_wine()
wine_df = pd.DataFrame(wine_data.data, columns=wine_data.feature_names)
wine_df['target'] = wine_data.target
print(wine_df.head())
