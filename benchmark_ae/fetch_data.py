import pandas as pd
from pathlib import Path
from sklearn.model_selection import train_test_split

def fetch_data(data_dir, train_test=False, test_size=0.2, random_state=42):
    
    data_dir = Path(data_dir)
    X = pd.read_csv(data_dir/'parameters.csv')
    y = pd.read_csv(data_dir/'outputs.csv')
    
    if train_test:
        return train_test_split(X, y, test_size=test_size, random_state=random_state)
    else:
        return X, y