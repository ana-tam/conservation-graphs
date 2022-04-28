//Cypher scripts to match nodes and link them across subgraphs/datasets
//may require regex matching using insensitivity and wildcards



//----:Material label includes :Solvents, :RepairMaterials, and :Adhesives together.

Match (a:Material), (b:Cameo)
Where a.name =~ b.entity
// Return a, b   //return first to check
Merge (a)-[:skos__semanticRelation]->(b)
Merge (b)-[:skos__semanticRelation]->(a);
