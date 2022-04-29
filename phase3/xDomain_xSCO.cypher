//Reification method. For each pair of nodes with a [:DOMAIN] relationship, I have created a second edge in reverse direction using the label [:xDOMAIN].

MATCH (a:Relationship)-[r:DOMAIN]->(b:Class)
MERGE (b)-[s:xDOMAIN]->(a);
//Return *

//result = created 308 rels

//For each pair of nodes with a [:SCO] relationship, I have created a second edge in reverse direction using the label [:xSCO] representative of a ‘superclass of’ relationship.

MATCH (a:Class)-[r:SCO]->(b:Class)
MERGE (b)-[s:xSCO]->(a);
//Return *

	//result = created 89 rels

