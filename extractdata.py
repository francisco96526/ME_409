import numpy as np
import pandas as pd
from pathlib import Path

foldername = "example_output_data"
filenames = ["cost_breakdown.csv","end_use.csv","energy_output.csv","gwp_breakdown.csv","installed_technologies.csv","losses.csv","monthly_operation.csv","performance.csv","shares.csv","storage.csv"]
filePath = Path("data",foldername,filenames[0])
df = pd.read_csv(filePath,sep='\t')

split1 = df.index[df['Technology'] == 'Storage technology'][0] + 1
split2 = df.index[df['Technology'] == 'Resource'][0] + 1

table1 = df[0:split1]

table2 = df[split1:split2-1]
table3 = df[split2:]

table2 = table2.rename(columns={'Technology':'Storage technology'})
table3 = table3.rename(columns={'Technology':'Resource','C_inv [MCHF/y]':'C_op [MCHF/y]'})
table3 = table3[['Resource','C_op [MCHF/y]']]

filePath1 = Path("data",foldername,"Extracted_cost_breakdown_1.csv")
filePath2 = Path("data",foldername,"Extracted_cost_breakdown_2.csv")
filePath3 = Path("data",foldername,"Extracted_cost_breakdown_3.csv")

table1.to_csv(filePath1)
table2.to_csv(filePath2)
table3.to_csv(filePath3)