##This is the revised code to iterate through batched reference numbers (i.e E 190/1141/1-3 is actually a shorthand entry for reference numbers E 190/1141/1, E 190/1141/2, and E 190/1141/3)
##The script parses the batch reference string and then GETs each record from the API.
##NB: very important where the indents are for each line so that the for-loops work correctly.

import urllib.parse
import requests
import json

## this is the for-loop to iterate through the batched reference numbers, ie. where a range is give with a hyphen

sample = open('List_of_BatchedReferences.csv')
data = []
results = open('APIResults_BatchesGroup.json', 'a')
url = 'https://discovery.nationalarchives.gov.uk/API/search/v1/records'
s = requests.Session()

for batch in sample:
splitRef = batch.rsplit('/',1)
refRoot = str(splitRef[0])
refRange = splitRef[-1]
start, end = [int(item) for item in refRange.split('-')]
li = list(range(start, end + 1))
for i in li:
j = str(i)
newRef = refRoot + r'/' + j
data.append(newRef)

##this GETs the records from the Discovery API

for x in data:
     ref_param = {'sps.references': r'"' + x + r'"', 'sps.departments': x.split()[0],'sps.referenceQuery': r'"' + x + r'"', 'sps.searchQuery': r'"' + x + r'"','sps.batchStartMark': r'*'}
     enc_ref = urllib.parse.urlencode(ref_param)
     r = s.get(url, params=enc_ref)
     json.dump(r.json(), results)
 
results.close()
print(s)
