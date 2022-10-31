import numpy as np
import pandas as pd
from pathlib import Path

filename = "cost_breakdown.csv"
filePath = Path("data","example_output_data",filename)
fileData = pd.read_csv(filePath,sep='\t')

print(fileData)