
# Conservation Graphs

This is the companion repository to the PhD thesis *Applying Graph Theory to Conservation Documentation* by Ana Tam (2024, University of the Arts London) [[cite](https://github.com/ana-tam/conservation-graphs?tab=readme-ov-file#how-to-cite)]. 
Scripts are written in Python for data wrangling and Cypher for Neo4j graph database modelling and analysis.

This README doc consists of the following:
* [The Structure of the Repository](https://github.com/ana-tam/conservation-graphs#structure-of-the-repository)
* [Neo4j details](https://github.com/ana-tam/conservation-graphs#neo4j)
* [The PhD Abstract](https://github.com/ana-tam/conservation-graphs#abstract)
* [How to Cite this Work](https://github.com/ana-tam/conservation-graphs#how-to-cite)



## Structure of the Repository

The contents of this repository mirror the structure of the thesis and correspond to the case study chapters (ch. 5-7) and their related appendices.

directory | content
--- | ---
Datasets | The final prepared versions of the datasets used to create the graph models.
Data Preparation | The scripts to pre-process and wrangle the datasets (including NLP, HTML scraping, and API requests).
Phase 1 | Initial build (ETL) scripts, validation queries (Cypher), graph algorithm scripts (Cypher), and related results.  Corresponds to Appendix H in the thesis vol. 2.
Phase 2 | Graph theoretic investigations of existing cultural heritage knowledge graphs.  Corresponds to thesis chapter 5 (with Appendix F) for investigations of the CIDOC CRM RDFS serialisation graph, and chapter 6 (with Appendix G) on RDF graphs from the Linked Conservation Data project, respectively.  
Phase 3 | Build rationale and analysis of the revised LPG Model of the TNA CCD dataset. Corresponds to chapter 7 of the thesis (with Appendices B, C, D, E and I).
Misc | Script snippets or derivations of those used in the main research that may be of interest to the community.


## Neo4j 

### Versions & Plugins

The PhD project ran from 2018 - 2022.  During this time, the [Neo4j](https://neo4j.com/) platform was used and incrementally upgraded as new versions were released. All Cypher code in this repository is compatible up to these latest versions.  For the latest compatibility documentation, see the relevant official manuals.  All graph algorithms were executed in .stream mode which produces results but does not write to nor makes any changes to the DBMS. 

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

## Abstract

>Conservation is the management of change (UNESCO et al 2013). Heritage assets—which include tangible and intangible objects and places–are recognised as non-renewable resources. As conservators, we are merely stewards of these shared assets and the notes and records we create contribute to their long-term care and understanding. Therefore, it is imperative these records are both human- and machine-readable. This thesis leverages mathematical graph theory to identify and examine networks captured in conservation documentation. It demonstrates how the use of existing graph-based technologies, such as semantic web technologies (RDF) and property graph (PG) databases, can be used to build and inform computational models for conservation through the creation and analysis of graph-based metamodels and knowledge graphs.
Conservation treatment data provided by The National Archives (UK) was used to develop a labelled property graph model and database that was also convertible to CIDOC CRM-mapped RDF triples. To further inform the development, investigations were conducted on existing conservation graphs, including the CIDOC CRM RDFS serialisation and RDF graphs produced by the Linked Conservation Data (LCD) project. The modelling decisions and investigations made during this process contributed to a suite of verification, validation and calibration (VVC) practices for graph model creation, assessment, and refinement, including the use of graph theoretic algorithms. The outcome is a graph representation method for conservation data which includes modelling principles to aid queryabillity and avoid common modelling pitfalls.
Of the graph theoretic measures employed, leaf node detection, triangle count, motif frequency, diameter and eigenvector centrality measures were found to be diagnostic for comparing or contrasting data collection practices as evidenced in the datasets across institutions. Eigenvector centrality is also a strong candidate for systematic model validation due to its usefulness in identifying modelling errors. Furthermore, results demonstrate that the conservation graphs from each case study exhibit recurrent bipartite (k3,3) subgraphs, an indicator of non-planarity. This higher dimensionality speaks to an intrinsic characteristic of conservation data and may explain why tabular and traditional relational data models, while able to capture facets of conservation, have been so difficult to use to capture and model across conservation’s more complex nature. These results signal a promising new means for conservation to capture, encode, study, and discuss complex conservation events and practices.

## How to Cite

For the PhD Thesis:  
>Tam, Ana. (2024). *Applying Graph Theory to Conservation Documentation*. PhD Thesis. University of the Arts London. Zenodo. https://doi.org/

For the datasets and scripts:  
>Tam, Ana. (2024). *Applying Graph Theory to Conservation Documentation* [datasets and scripts] Zenodo. https://doi.org/



