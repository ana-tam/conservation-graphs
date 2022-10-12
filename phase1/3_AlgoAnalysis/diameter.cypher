//Diameter as “the longest shortest path in the network”.
//Source: https://guides.neo4j.com/sandbox/graph-algorithms/


MATCH (n)
WITH collect(n) AS nodes
UNWIND nodes AS a
UNWIND nodes AS b
WITH a, b
WHERE id(a) < id(b)
MATCH path=shortestPath((a)-[*]-(b))
RETURN max(length(path)) as diameter;





