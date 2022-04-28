//Creating bi-directional relationships between NLP-derived nodes
//NB: Neo4j automatically skips any a.chunkText = 'nan' nodes when Merging with relationships.  This saves having to delete them, but as a result, will effect validation counts.

Match (a:Comments), (b:NounChunk)
WHERE a.reference = b.reference AND a.rowID = b.rowID AND b.sourceTextType = 'Comments'
MERGE (a)-[r:HAS_CHUNKS]->(b)
Merge (b)-[s:FROM_TEXT]->(a);
 
//results =  86530 rels, in 910ms

Match (a:ConditionComments), (b:NounChunk)
WHERE a.reference = b.reference AND a.rowID = b.rowID AND b.sourceTextType = 'Condition Comments'
MERGE (a)-[r:HAS_CHUNKS]->(b)
Merge (b)-[s:FROM_TEXT]->(a);
 
//results = 4240 rels, in 73ms

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
