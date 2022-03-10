//The smaller file meant didn't need PERIODIC ITERATE

//******* Creating :Verb Nodes from 'Comments' **********

CALL apoc.load.json("file:///comment_verbs.json")
Yield value as result
Merge (a:Verb{
dataset:'TNA',
sourceTextType: 'Comments',
rowID:result.result[0],
reference:result.result[1],
tokenText:result.result[2],
tokenLemma:result.result[3],
tokenPOS:result.result[4],
tokenTag:result.result[5],
tokenDep:result.result[6]
});

//******* Creating :Verb Nodes fron 'Condition Comments' **********

CALL apoc.load.json("file:///condcomts_verbs.json")
Yield value as result
Merge (a:Verb{
dataset:'TNA',
sourceTextType: 'Condition Comments',
rowID:result.result[0],
reference:result.result[1],
tokenText:result.result[2],
tokenLemma:result.result[3],
tokenPOS:result.result[4],
tokenTag:result.result[5],
tokenDep:result.result[6]
});

//************ Setting :Verb properties to string types *********

MATCH (n:Verb)
SET n.reference = toString(n.reference)
SET n.rowID = toString(n.rowID);

//results = 36480 properties in 106ms

//******* Creating Bi-directional Relationships to connect :Verb nodes  **********

Match (a:Comments), (b:Verb)
WHERE a.reference = b.reference AND a.rowID = b.rowID AND b.sourceTextType = 'Comments'
MERGE (a)-[r:HAS_VERB]->(b)
Merge (b)-[s:FROM_TEXT]->(a);
 
//results = 34022 rels, in 414ms

Match (a:ConditionComments), (b:Verb)
WHERE a.reference = b.reference AND a.rowID = b.rowID AND b.sourceTextType = 'Condition Comments'
MERGE (a)-[r:HAS_VERB]->(b)
Merge (b)-[s:FROM_TEXT]->(a);
 
//results = 2458 rels, in 45ms

