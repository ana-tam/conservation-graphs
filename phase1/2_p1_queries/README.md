# Querying the Phase 1 DBMS


Example queries for the Phase 1 DBMS / LPG model.


---

## The Materials Graph
Results in a graph of every instance of :Materials used in all :TreatmentEvents centralised around the more general :TNAMaterials nodes where high-frequency use form larger clusters.

[MaterialsGraph.cypher](./MaterialsGraph.cypher)

includes:

- a dependency list (of nodes already pre-loaded)
- Query to CREATE :TNAMAterials nodes using list of unique materials from the :Adhesives, :Solvents, and :RepairMaterials columns in the original TNA.csv
- Query to CREATE edges connecting instances of :Material to the more general/higher-level category nodes :TNAMaterials
- MATCH query to return the Materials Graph


[MaterialsGraph.png](./MaterialsGraph.png)

---

## The Temporal Graph

