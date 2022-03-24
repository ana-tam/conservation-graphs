## Python for Verbs only

import spacy
import json
   
 nlp = spacy.load("en_core_web_sm")
 source = open("inputfile.csv")
 verbResults = open("verbs.json", "a", newline='')
 data = source.read()
 doc = nlp(data)
    
for token in doc:
     spaced = (token.text, token.lemma_, token.pos_, token.tag_, token.dep_)
     if token.pos_ == "VERB" in spaced:
         json.dump(spaced, verbResults)
verbResults.close()
print("Finished")
