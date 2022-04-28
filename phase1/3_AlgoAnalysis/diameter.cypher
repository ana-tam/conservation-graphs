//Diameter as “the longest shortest path in the network”.
//Source: https://guides.neo4j.com/sandbox/graph-algorithms/


MATCH (n)
WITH collect(n) AS nodes
UNWIND nodes AS a
UNWIND nodes AS b
WITH a, b
WHERE id(a) < id(b)
MATCH path=shortestPath((a)-[*]-(b))
//RETURN length(path) AS diameter
//ORDER BY diameter
//DESC LIMIT 1
RETURN max(length(path)) as diameter;

//---For Large Graphs--Use Call and Periodic Commit---

MATCH (n)
WITH collect(n) AS nodes
UNWIND nodes AS a
UNWIND nodes AS b
WITH a, b
WHERE id(a) < id(b)
CALL apoc.periodic.commit(
MATCH path=shortestPath((a)-[*]-(b))
RETURN length(path) AS diameter
ORDER BY diameter
DESC LIMIT 1;




