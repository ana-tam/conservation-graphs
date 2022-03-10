#Using spaCy for lemma and pos (parts of speech)

import spacy
import json
   
nlp = spacy.load("en_core_web_sm")
source = open("inputfile.csv") 
  ##this opens a file in your IDE's default folder.  
results = open("outputfile.json", 'a', newline='') 
  ##will be saved in same folder as source above
data = source.read()
doc = nlp(data)
   
for token in doc:
  ##only saving specific attributes of the token)
  ##for for list of token attributes see: https://spacy.io/api/token
spaced = (token.text, token.lemma_, token.pos_)
json.dump(spaced, results)
results.close()
