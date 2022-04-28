//Cypher script to load CAMEO content extracted via Python (BeautifulSoup)
//Labels resulting nodes as :Cameo
//Node properties include 'entity' which is the entry's name followed by headers as keys and paragraphs as values to each key (created by soupCombine.py)

//--Load CAMEO.json into Neo4j

CALL apoc.periodic.iterate(
"call apoc.load.json('file:///CAMEOsoup.json')
YIELD value as value",
"UNWIND [k IN KEYS(value) | {entity: k, props: value[k]}] AS obj
Merge (n:Cameo{entity:obj.entity})
Set n += obj.props",
{batchSize:500});

//--Re-naming 'Synonyms and Related Terms' property
//It was apparent after load, that the above property key/header used escape characters.  The following script changes this property key to "synonymsAndRelatedTerms"
//and is better in line with Neo4j property naming conventions and makes querying easier and avoids the ' marks. 

Match (b:Cameo) with b, b.`Synonyms and Related Terms` as syns
Call{
with syns
unwind syns as nyms
Return split(nyms, ';') as new
}
Set b.synonymsAndRelatedTerms = new;

//Can then delete [b.`Synonyms and Related Terms`]
