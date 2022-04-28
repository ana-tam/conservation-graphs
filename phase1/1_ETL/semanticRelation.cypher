//Cypher scripts to match nodes and link them across subgraphs/datasets
//using regular expression (regex) matching, note the =~ [for regex matching] in the Where clauses

//---Matching :NounChunk nodes (via .chunkRootText) to :Cameo nodes (using regex matching)

Match (a:NounChunk), (b:Cameo)
Where a.chunkRootText =~ b.entity
//return first to check
Merge (a)-[:nRoot__semanticRelation]->(b)
Merge (b)-[:nRoot__semanticRelation]->(a)
Return a.rowID, a.chunkRootText, b.entity;

// ---- Matching :Verb nodes (via .tokenText) to :Cameo nodes (using regex matching)
 
Match (a:Verb), (b:Cameo)
Where a.tokenText =~ b.entity
//return first to check
Merge (a)-[:vtext__semanticRelation]->(b)
Merge (b)-[:vtext__semanticRelation]->(a)
Return a.rowID, a.tokenText, b.entity;


//----Matching :Materials to to :Cameo nodes
//:Material label includes :Solvents, :RepairMaterials, and :Adhesives together.

Match (a:Material), (b:Cameo)
Where a.name =~ b.entity
// Return a, b   //return first to check
Merge (a)-[:skos__semanticRelation]->(b)
Merge (b)-[:skos__semanticRelation]->(a);

