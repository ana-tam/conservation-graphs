# Conservation Graphs

This is the companion repository for the PhD thesis *Applying Graph Theory to Conservation Documentation* by Ana Tam (202X, University of the Arts London). 
Scripts are written in Python for data wrangling and Cypher for Neo4j graph database modelling and analysis.

## Structure of the Repository

The contents of this repository mirror the structure of the thesis:

directory | content
--- | ---
Datasets | The final prepared versions of the datasets used to create the graph models.
Data Preparation | The scripts to pre-process and wrangle the datasets (including NLP, html scraping, and API requests).
Phase 1 | Initial build (ETL) scripts, validation queries (Cypher), graph algorithm scripts (Cypher), and related results
Phase 2 | Graph theoretic investigations of existing cultural heritage knowledge graphs and the results
Phase 3 | Revised build (ETL) scripts, graph algorithms scripts (Cypher), validation queries (Cypher), SHACL, and related results
Misc | Script snippets or derivations of those used in the main research that may be of interest to the community.


## Neo4j 

### Versions & Plugins

The PhD project ran from 2018 - 2022.  During this time, the [Neo4j](https://neo4j.com/) platform was used and incrementally upgraded as new versions were released. All Cypher code in this repo is compatible up to these latest versions.  For the latest compatibility documentation, see the relevant official manuals.

Neo4j Enterprise v.4.3.5 - 4.4.7  bundled with Cypher Query Language (see [Cypher Manual](https://neo4j.com/docs/cypher-manual/current/))

Plugins | Official Manuals
------------- | ------------- 
APOC v.4.4.0.5  | [APOC User Guide](https://neo4j.com/labs/apoc/4.4/)
GDSL (Graph Data Science Library) v.2.0.4 | [Graph Data Science Manual](https://neo4j.com/docs/graph-data-science/current/)
Neosemantics v. 4.4.0.1 | [Neosemantics User Guide](https://neo4j.com/labs/neosemantics/4.3/)

### DBMS Configs

To ensure the above plugins are configured properly to allow loading from json in APOC and RDF in Neosemantics, copy and paste the following into the Settings file (aka .conf in older versions):

```
#Apoc config [today’s date]
apoc.import.file.enabled=true
#Neosemantics config [today’s date]
dbms.unmanaged_extension_classes=n10s.endpoint=/rdf
```

## Cite

For the PhD Thesis:  
>Tam, Ana. (202X). *Applying Graph Theory to Conservation Documentation*. PhD Thesis. University of the Arts London. Zenodo. https://doi.org/

For the datasets and scripts:  
>Tam, Ana. (202X). *Applying Graph Theory to Conservation Documentation* [datasets and scripts] Zenodo. https://doi.org/



