#The following code makes calls via a list of URLs compiled into a .csv file.  
#It iterates through each URL in the .csv and extracts only the h1, h2's and related p's (immediatey following the h2's) from each page.
#The intended use for this code in this project is to transform html content from a Wiki-based materials database into .json.

import json
import requests
from bs4 import BeautifulSoup
#url='http://URL_HERE'  #Uncomment this line if passing in URL directly and comment out line 10, datafile variable.
results = open("Results.json", 'a', newline='')
datafile = open("Wiki_Content.csv", 'r', newline='')
    
urlReader = datafile.read().splitlines() #NB:  without this step, it doesn't open the csv properly and iterates through with bad/useless/empty results, until last row.
    
    for url in urlReader:
         req = requests.get(url)
         soup = BeautifulSoup(req.text, "html.parser")
         head1 = soup.h1.get_text()
         listHeads1 = []
         listHeads1.append(head1)
    
         listHeads2 = []
         listSubText = []
    
         head2 = soup.find_all("h2")[1:-1]
         sections = soup.select('h2+p')
    
         for x in head2:
             subheads = x.get_text()
             listHeads2.append(subheads)
    
         for y in sections:
             subtext = y.get_text()
             listSubText.append(subtext)
    
         zipH2group = (zip(listHeads2, listSubText))
         dictH2group = [dict(zipH2group)]
    
         zipH1TopGroup = (zip(listHeads1, dictH2group))
         dictH1TopGroup = [dict(zipH1TopGroup)]
    
         json.dump(dictH1TopGroup, results)
    results.close()

    # Uncomment any one of the following 'print' commands to test run.  otherwise can ignore all prints to follow
    #print(listHeads2)
    #print(listSubText)
    #print(dictH2group)
    #print(dictH1TopGroup)
