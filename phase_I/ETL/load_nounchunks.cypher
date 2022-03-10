//****** Creating Nodes from Nounchunks derived from the 'Comments' column *******

CALL apoc.periodic.iterate(
"call apoc.load.json('file:///comment_nounchunks.json')
Yield value as result",
"MERGE (a:NounChunk{
dataset: 'TNA',
sourceTextType: 'Comments',
rowID:result.result[0],
reference:result.result[1],
chunkText:result.result[2],
chunkRootText:result.result[3],
chunkRootDep:result.result[4],
chunkRootHeadText:result.result[5]
})",
{batchSize:1000});

//****** Creating Nodes from Nounchunks derived from the 'Condition Comments' column *******

CALL apoc.periodic.iterate(
"call apoc.load.json('file:///condcomts_nounchunks.json')
Yield value as result",
"MERGE (a:NounChunk{
dataset: 'TNA',
sourceTextType: 'Condition Comments',
rowID:result.result[0],
reference:result.result[1],
chunkText:result.result[2],
chunkRootText:result.result[3],
chunkRootDep:result.result[4],
chunkRootHeadText:result.result[5]
})",
{batchSize:1000});

//******

MATCH (n:NounChunk)
SET n.reference = toString(n.reference)
SET n.rowID = toString(n.rowID);
//results = 107724 properties in 338ms

//****** Bi-directional Relationships *********

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

