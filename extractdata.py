import numpy as np
import pandas as pd
from pathlib import Path

foldername = "example_output_data"
filenames = ["cost_breakdown.csv","end_use.csv","energy_output.csv","gwp_breakdown.csv","installed_technologies.csv","losses.csv","monthly_operation.csv","performance.csv","shares.csv","storage.csv"]
filePath = Path("data",foldername,filenames[0])
df = pd.read_csv(filePath,sep='\t')

split1 = df.index[df['Technology'] == 'Storage technology'][0]
split2 = df.index[df['Technology'] == 'Resource'][0]

table1 = df[0:split1]

print(df[split1:split2])
print('---')
print(df[split2:])


