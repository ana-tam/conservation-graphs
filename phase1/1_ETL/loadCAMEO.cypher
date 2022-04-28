//Cypher script to load CAMEO content extracted via Python (BeautifulSoup)
//Labels resulting nodes as :Cameo
//Node properties include 'entity' which is the entry's name followed by headers as keys and paragraphs as values to each key (created by soupCombine.py)

CALL apoc.periodic.iterate(
"call apoc.load.json('file:///CAMEOsoup.json')
YIELD value as value",
"UNWIND [k IN KEYS(value) | {entity: k, props: value[k]}] AS obj
Merge (n:Cameo{entity:obj.entity})
Set n += obj.props",
{batchSize:500});
