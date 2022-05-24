

//**-----Distinct Label by Count ---**

//What nodes are there, what are they called, and how many of each

MATCH (n) 
RETURN
DISTINCT labels(n),
COUNT(*); 


//**-----Distinct Relationship Type by Count ---**

//What relationship types are there and how many of each

MATCH ()-[relationship]->() RETURN TYPE(relationship) AS type, COUNT(relationship) AS amount ORDER BY amount DESC;


