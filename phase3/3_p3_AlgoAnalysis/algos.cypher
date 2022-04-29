//ALGORITHM: Triangle Count 
//Undirected graph projection required (specified with 'UD' in the following scripts)
//mode = .estimate

CALL gds.triangleCount.write.estimate('TestGraph_UD', { writeProperty: 'triangleCount' })
YIELD nodeCount, relationshipCount, bytesMin, bytesMax, requiredMemory

//.stats

CALL gds.triangleCount.stats('TestGraph_UD')
YIELD globalTriangleCount, nodeCount
