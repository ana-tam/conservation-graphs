// as of 4 Oct 2021, I have not added this to 4.4_TNA_NLP_w_CIDOC_CAMEO as I’m still trying to determine if that’s the best/most accurate relationship
//MATCH (n:Comments),(b:Resource{name:"E62_String"})
//MERGE (n)-[:skos__semanticRelation]->(b);
//MATCH (n:ConditionComments),(b:Resource{name:"E62_String"})
//MERGE (n)-[:skos__semanticRelation]->(b);




MATCH (n:TreatmentEvent),(b:Resource{name:"E7_Activity"})
MERGE (n)-[:skos__semanticRelation]->(b);

	//Created 5851 relationships

//MATCH (n:RowID),(b:Resource{name:"E42_Identifier"})
//MERGE (n)-[:skos__semanticRelation]->(b);
//skipped because haven’t created RowID as nodes

	//Created 5851 relationships

MATCH (n:Reference),(b:Resource{name:"E42_Identifier"})
MERGE (n)-[:skos__semanticRelation]->(b);

//Created 5851 rels as duplicates not removed
//if dupls were remove, then would have been 5527 relationships

MATCH (n:PrimaryDamage),(b:Resource{name:"E14_Condition_Assessment"})
MERGE (n)-[:skos__semanticRelation]->(b);

	//created 3834 relationships
	//changed from E13_Attribute_Assignment to E14_Condition_Assessment, the P_’s are more appropriate then using wider E13.

MATCH (n:SecondaryDamage),(b:Resource{name:"E14_Condition_Assessment"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 1588 relationships

MATCH (n:RepairMaterial),(b:Resource{name:"E57_Material"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 543 relationships

MATCH (n:Adhesives),(b:Resource{name:"E57_Material"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 241 relationships

MATCH(n:Solvents),(b:Resource{name:"E57_Material"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 23 relationships

MATCH (n:DateRequested),(b:Resource{name:"E52_Time-Span"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 112 relationships
//note E50_Date refers to the time appellation (i.e. Bronze Age, 1984, etc.) and not the primitive value so won’t support inference as a value.

MATCH (n:DateTreated),(b:Resource{name:"E52_Time-Span"})
MERGE (n)-[:skos__semanticRelation]->(b);
//created 5761 relationships

MATCH (n:Person),(b:Resource{name:"E21_Person"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 20 relationships

MATCH (n:WorkTime),(b:Resource{name:"E52_Time-Span"})
MERGE (n)-[:skos__semanticRelation]->(b);

//created 3718 relationships

