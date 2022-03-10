
//Create a native projection to the Graph Catalog to run Graph Data Science Library algorithms
//Using default aggregation (*) to include all nodes and relationships in the projection.

CALL gds.graph.create('Algos_NLPflowerbase', '*', '*');

//To run the eigenvector centrality algorithm on you graph 
CALL gds.eigenvector.stream('Algos_NLPflowerbase')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId) AS name, score 
  //didn’t specify .property after (nodeId) so it returns whole node.  
ORDER BY score DESC;

//To Drop/Release a projection:
//CALL gds.graph.drop('Algos_NLPflowerbase');
