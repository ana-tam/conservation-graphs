#Two Python scripts below for extracting nounchunks.  
#The 'spaced' variable is used to return a list that specifies the text itself and the dependencies within the chunked phrase.
#The first lists several dependencies.
#The second only specifies the chunked text itself.  


##Python for noun chunks - long results

import spacy
import json
   
nlp = spacy.load("en_core_web_sm")
source = open("source.csv") 
results = open("chunkresults.json", 'a', newline='') 
data = source.read()
doc = nlp(data)
   
for chunk in doc.noun_chunks:
spaced = (chunk.text, chunk.root.text, chunk.root.dep_,
            chunk.root.head.text)
json.dump(spaced, results)
results.close()
print("Finished")

//output: Finished

##Python for noun chunks - short and sweet

import spacy
import json
   
nlp = spacy.load("en_core_web_sm")
source = open("source.csv") 
results = open("chunkresults.json", 'a', newline='') 
data = source.read()
doc = nlp(data)
   
for chunk in doc.noun_chunks:
spaced = (chunk.text)
json.dump(spaced, results)
results.close()
print("Finished")

//output: Finished
