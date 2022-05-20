

//**-----Materials Graph Dependencies---**

// Need these nodes already created in the dbms.  Load from TNA.csv
// :TreatmentEvent
// :RepairMaterials :Material
// :Adhesives :Material
// :Solvents :Material

//**-----For Loading into Neo4j ----***

LOAD CSV WITH HEADERS FROM 'file:///TNAuniqueMaterials.csv' AS row
CREATE (n:TNAMaterials{ 
name:row.uniqueMaterials});

//results: Added 105 labels, created 105 nodes, set 105 properties

//**------For creating edges ----****

Match (a:Material), (b:TNAMaterials)
Where a.name = b.name
Merge (a)-[:IS_INSTANCE_OF]->(b) //"specific instance"
Merge (b)-[:IS_GENERAL_OF]->(a)//"general reference"


//***-------Cypher Query to display Materials Graph ----***

Match p=(a:TreatmentEvent)-[*2]-(b:TNAMaterials) Return p;
