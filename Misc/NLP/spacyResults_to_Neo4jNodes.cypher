//Example code for loading and mapping spaCy-extracted NounChunks and Verbs (or any other parts-of-speech) as nodes in Neo4j:

//Sample of the json to be converted:

//spacyResults = ["fluted", "flute", "VERB", "VBN", "amod"]["used", "use", "VERB", "VBN", "ROOT"]["make", "make", "VERB", "VB", "xcomp"]["strengthened", "strengthen", "VERB", "VBN", "ROOT"]["keep", "keep", "VERB", "VB", "advcl"]["used", "use", "VERB", "VBD", "ROOT"]

//The sequence of the series are in this order: tokenText, tokenLemma, tokenPOS, tokenTag, tokenDep
//The following Cypher will create a :Verb node for each array (everything within the square brackets per node), with each element in the array mapped by index number as properties of the node.
//Thus the Cypher to load and map are:

CALL apoc.load.json("file:///spacyResults.json")
Yield value as result
Merge (a:Verb{
tokenText:result.result[0],
tokenLemma:result.result[1],
tokenPOS:result.result[2],
tokenTag:result.result[3],
tokenDep:result.result[4]
});

//Output in Neo4j Browser will look like this (unless you're in graph-view mode, in which case you'll see the nodes):

//{
//  "identity": 15,
//  "labels": [
//    "Verb"
//  ],
//  "properties": {
// "tokenText": "fluted",
// "tokenDep": "amod",
// "tokenTag": "VBN",
// "tokenLemma": "flute",
//"tokenPOS": "VERB"
//  }
//}
// ...etc
