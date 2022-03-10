#Using pandas dataframe.at to access data from specific cell
#based on:  https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.at.html

import pandas as pd
import spacy
import json
    
nlp = spacy.load("en_core_web_sm")
source = open("inputfile.csv")
results = open("outputfile.json", 'a', newline='')
data = pd.read_csv("inputfile.csv")

#this snippet calls to a specific cell via row index and column name

cellContent = data.at[0, 'ColumnHeader']
print(cellContent)
