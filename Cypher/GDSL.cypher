//=========CONTEXT: ===========
// The following scripts require loading the Graph Data Science Library (GDSL) in Neo4j.
//
//=========CONTENTS: ===========
//  - Create a Native Projection to run default natural orientation algorithms
//  - Create a Native Projection on all nodes (default node projection) and UNDIRECTED relationship projection
//  - Eigenvector Centrality - natural
//  - Eigenvector Centrality - UNDIRECTED
//  - Local Clustering Coefficient
//  - Degree Centrality - natural - outDegrees
//  - Degree Centrality - reverse - inDegrees
//  - Degree Centrality - both directions - sumDegrees
//  - Global Triangle Count
//  - Average Clustering Coefficient

// For further information, see GDSL Manual: https://neo4j.com/docs/graph-data-science/current/


//========= CYPHER SCRIPTS:========

//Before you can utilise the graph algorithms in Neo4j, 
//you must project the graph to be analysed using one of the following options 
//depending on the projection requirements to the algorithm you wish to run.
//You can create multiple projections, but name them uniquely. 

//————Create Default Native Projection ——————


CALL gds.graph.create(‘YourGraphName’, '*', '*');

//If you are using Neo4j/GDSL from version 4.4.0 onwards, the procedure name has changed to 
//CALL gds.graph.project(‘YourGraphName’, '*', '*');



//——————Create UNDIRECTED Native Projection ————————
//Amend as relTypes as needed.  
//Tip: Use 'Distinct RelType Count' Cypher to gather all relationship types in a spreadsheet column 
//remove all quotation marks and then place 
// : {orientation: 'UNDIRECTED'},' in the adjacent column.
//Copy and paste both columns into Neo4j Browser.  

//NB: When dealing with CIDOC CRM edge names extracted from RDFS
//use back ticks [`] as escape characters around:
//`P4_has_time-span`and
//`P14.1_in_the_role_of`
//otherwise they throw errors due to the hyphen and .1 in the names.

CALL gds.graph.create(
'LCD-SUL_UD',  //projection name
'*',  //node projection
{ //specified relationship projections to follow
P2_has_type	: {orientation: 'UNDIRECTED'},
P7_took_place_at	: {orientation: 'UNDIRECTED'},
P46_is_composed_of	: {orientation: 'UNDIRECTED'},
P59_has_section	: {orientation: 'UNDIRECTED'},
P35_has_identified	: {orientation: 'UNDIRECTED'},
P9_consists_of	: {orientation: 'UNDIRECTED'},
P44_has_condition	: {orientation: 'UNDIRECTED'},
P111_added	: {orientation: 'UNDIRECTED'},
P126_employed	: {orientation: 'UNDIRECTED'},
`P4_has_time-span`	: {orientation: 'UNDIRECTED'},
P34_concerned	: {orientation: 'UNDIRECTED'},
P1_is_identified_by	: {orientation: 'UNDIRECTED'},
P108_has_produced	: {orientation: 'UNDIRECTED'},
P31_has_modified	: {orientation: 'UNDIRECTED'},
P134_continued	: {orientation: 'UNDIRECTED'},
P55_has_current_location	: {orientation: 'UNDIRECTED'},
P32_used_general_technique	: {orientation: 'UNDIRECTED'},
P110_augmented	: {orientation: 'UNDIRECTED'},
P160_has_temporal_projection	: {orientation: 'UNDIRECTED'},
P140_assigned_attribute_to	: {orientation: 'UNDIRECTED'},
P70_documents	: {orientation: 'UNDIRECTED'},
P86_falls_within	: {orientation: 'UNDIRECTED'},
P148_has_component	: {orientation: 'UNDIRECTED'},
P33_used_specific_technique	: {orientation: 'UNDIRECTED'},
P45_consists_of	: {orientation: 'UNDIRECTED'},
P48_has_preferred_identifier	: {orientation: 'UNDIRECTED'}
});



//——————Eigenvector Centrality - natural —————————
//Uses the Default Native Projection


CALL gds.eigenvector.stream('LCD-SUL') //use 'YourGraphName'
YIELD nodeId, score
 
RETURN id(gds.util.asNode(nodeId)) AS id,
gds.util.asNode(nodeId).label AS name, 
labels(gds.util.asNode(nodeId)) AS CRMEntity,
score
 
ORDER BY score DESC;


//——————Eigenvector Centrality - UNDIRECTED —————————
//Uses the UNDIRECTED Native Projection 


CALL gds.eigenvector.stream('LCD-SUL_UD') //use 'YourGraphName_UD'
YIELD nodeId, score

RETURN id(gds.util.asNode(nodeId)) AS id,
 gds.util.asNode(nodeId).label AS name, 
labels(gds.util.asNode(nodeId)) AS CRMEntity,
score 
 
ORDER BY score DESC;


//---------Local Clustering Coefficient-----------
//Uses the UNDIRECTED Native Projection
//Only runs on UNDIRECTED projections


CALL gds.localClusteringCoefficient.stream('LCD-SUL_UD')
YIELD nodeId, localClusteringCoefficient

RETURN 
id(gds.util.asNode(nodeId)) AS id,
gds.util.asNode(nodeId).label AS name,
labels(gds.util.asNode(nodeId)) AS CRMEntity,
localClusteringCoefficient

ORDER BY localClusteringCoefficient DESC;


//——————Degree Centrality - natural - outDegrees———————
//Uses the Default Native Projection


CALL gds.degree.stream('LCD-SUL')
YIELD nodeId, score

RETURN 
id(gds.util.asNode(nodeId)) AS id,
gds.util.asNode(nodeId).label AS name, 
labels(gds.util.asNode(nodeId)) AS CRMEntity, 
score AS outDegree

ORDER BY outDegree DESC, name DESC;


//—————— Degree Centrality - reverse - inDegrees—————————
//Uses the Default Native Projection.  This algorithm allows for changing the orientation as a parameter in the query. 


CALL gds.degree.stream(
   'LCD-SUL',
   { orientation: 'REVERSE' }
)
YIELD nodeId, score
RETURN id(gds.util.asNode(nodeId)) AS id,
labels(gds.util.asNode(nodeId)) AS CRMEntity,
gds.util.asNode(nodeId).label AS name, 
score AS inDegree
ORDER BY inDegree DESC, name DESC;


//———————Degree Centrality - both directions - sumDegrees——————
//Uses the Default Native Projection


CALL gds.degree.stream(
   'LCD-SUL',
   { orientation: 'UNDIRECTED' }
)
YIELD nodeId, score
RETURN 
id(gds.util.asNode(nodeId)) AS id,
gds.util.asNode(nodeId).label AS name, 
labels(gds.util.asNode(nodeId)) AS CRMEntity, 
score AS sumDegrees
ORDER BY sumDegrees DESC, name DESC;


//———————GlobalTriangleCount——————
//Requires UNDIRECTED projection 

//Use resulting projection message to ensure the undirected projection covers the whole graph.  
//The relationship (edge) Count for the undirected projection is twice that of the original rel (edge) count (size).


CALL gds.triangleCount.stats('yourGraph_UD')
YIELD globalTriangleCount, nodeCount


//———————Average Clustering Coefficient——————

//Requires UNDIRECTED projection 

CALL gds.localClusteringCoefficient.stats('yourGraph_UD')
YIELD averageClusteringCoefficient, nodeCount


