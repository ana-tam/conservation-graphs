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
