//Configuring Neosemantics

CREATE CONSTRAINT n10s_unique_uri ON (r:Resource)
ASSERT r.uri IS UNIQUE;

CALL n10s.graphconfig.init( { handleMultival: "ARRAY" , handleVocabUris: "IGNORE"});
 
//Loading CIDOC CRM v.7.1.1 RDFS serialisation

CALL n10s.onto.import.fetch(
"https://gitlab.isl.ics.forth.gr/cidoc-crm/cidoc_crm_rdf/-/raw/v7.1.1_preparation/CIDOC_CRM_7.1.1_RDFS_Impl_v1.1.rdfs","RDF/XML", {
languageFilter: 'en'});
