//******Triangle Count algorithm requires an Undirected native projection

CALL gds.graph.create(
'Algos_NLPflowerbase_UD',  //projection name
'*',  //node projection set to default
{ //relationship projection explicitly changing all orientations to ‘undirected’
FROM_TEXT: {
orientation: 'UNDIRECTED'
},
HAS_CHUNKS: {
orientation: 'UNDIRECTED'
},
HAS_VERB: {
orientation: 'UNDIRECTED'
},
REFERS_TO_EVENT: {
orientation: 'UNDIRECTED'
},
INVOLVES_TREAT_OF: {
orientation: 'UNDIRECTED'
},
WAS_TREATED_DURING: {
orientation: 'UNDIRECTED'
},
OCCURRED_ON: {
orientation: 'UNDIRECTED'
},
RECORDED_DAMAGE: {,
orientation: 'UNDIRECTED'
},
RECORDED_DURING: {
orientation: 'UNDIRECTED'
},
WAS_TREATED_BY: {
orientation: 'UNDIRECTED'
},
UNDERTOOK: {
orientation: 'UNDIRECTED'
},
HAD_DURATION: {
orientation: 'UNDIRECTED'
},
HAS_TEXT: {
orientation: 'UNDIRECTED'
},
HAS_EVENT: {
orientation: 'UNDIRECTED'
},
INVOLVED_USE_OF: {
orientation: 'UNDIRECTED'
},
WAS_USED_TO_TREAT_DURING: {
orientation: 'UNDIRECTED'
},
WAS_REQUESTED_ON: {
orientation: 'UNDIRECTED'
}
}
)
YIELD graphName, nodeCount, relationshipCount;

//********* to run estimate memory usage  ************

CALL gds.triangleCount.write.estimate('Algos_NLPflowerbase', { writeProperty: 'triangleCount' })
YIELD nodeCount, relationshipCount, bytesMin, bytesMax, requiredMemory

//****** run .stats for Global Triangle Count ************* 

CALL gds.triangleCount.stats('Algos_NLPflowerbase_UD')
YIELD globalTriangleCount, nodeCount

//results = |Global Triangle Count = 0|
//          |nodeCount = 94392|
