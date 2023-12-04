import pandas as pd

data = pd.read_csv('wdbc.dat', header=None)
data.iloc[:, 1] = data.iloc[:, 1].apply(lambda x: 1 if x == 'M' else -1 if x == 'B' else x)
data.to_csv('preprocessed_wdbc.dat', index=False, header=False)