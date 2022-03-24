#This script takes in the tidied source csv (TNAcombined2022.csv), and outputs both Verbs and Nounchunks (via spaCy)
#from the 'Conditioncomments'(i.e. COND) and 'Comments' (i.e. COMT) columns by passing in the source csv once and iterating through the relevant cells via pandas dataframe method.
#This script takes one .csv input file and results in 4 output .json files.

import pandas as pd
import spacy
import json

nlp = spacy.load("en_core_web_sm")
data = pd.read_csv("TNAcombined2022.csv")
COMTNounChResults = open("fullTNA_COMTnounChResults.json", 'a', newline='')
COMTverbResults = open("fullTNA_COMTverbResults.json", 'a', newline='')
CONDNounChResults = open("fullTNA_CONDnounChResults.json", 'a', newline='')
CONDverbResults = open("fullTNA_CONDverbResults.json", 'a', newline='')


# this snippet calls to a specific cell via row index and column name

for index, row in data.iterrows():
   rowID = row['RowID']
   ref = row['Reference']
   comt = str(row['Comments'])
   cond = str(row['Conditioncomments'])
   nlpcomt = nlp(comt)
   nlpcond = nlp(cond)

   for token in nlpcomt:
       spaced = (rowID, ref, token.text, token.lemma_, token.pos_, token.tag_, token.dep_)
       if token.pos_ == "VERB" in spaced:
           json.dump(spaced, COMTverbResults)
       for chunk in nlpcomt.noun_chunks:
           nounChunks = (rowID, ref, chunk.text, chunk.root.text, chunk.root.dep_, chunk.root.head.text)
           json.dump(nounChunks, COMTNounChResults)

   for token in nlpcond:
       spaced = (rowID, ref, token.text, token.lemma_, token.pos_, token.tag_, token.dep_)
       if token.pos_ == "VERB" in spaced:
           json.dump(spaced, CONDverbResults)
       for chunk in nlpcond.noun_chunks:
           nounChunks = (rowID, ref, chunk.text, chunk.root.text, chunk.root.dep_, chunk.root.head.text)
           json.dump(nounChunks, CONDNounChResults)

COMTverbResults.close()
COMTNounChResults.close()
CONDverbResults.close()
CONDNounChResults.close()
