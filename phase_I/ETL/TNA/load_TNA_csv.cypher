//Scripts to load the TNA dataset in a star-schema into Neo4j from .csv
//Each section (seperated by //*** ) creates different labelled nodes or relationships.


//******* :TreatmentEvent nodes. ********
//This Load procedure creates a single :TreatmentEvent node per row directly from the .csv, with each column header added as a property key for the corresponding value. 

LOAD CSV WITH HEADERS FROM 'file:///TNA2022.csv' AS row
CREATE (n:TreatmentEvent 
{rowID:row.RowID,   //Adding rowID ensures subsequent matching is more unique. This column needs to be done in pre-processing.
reference:row.Reference,
primaryDamage:row.Primarydamage,
secondaryDamage:row.Secondarydamage,
conditionComments:row.Conditioncomments,
repairMaterial:row.RepairMaterial,
adhesives:row.Adhesives,
solvents:row.Solvents,
dateRequested:row.Daterequested,
dateTreated:row.Datetreated,
person:row.Person,  
workTime:row.Time,
comments:row.Comments});
//Return n
//Uncomment the Return statement and delete the semicolon in preceeding line to see the results if copy and pasting a section at a time.  
//The semicolon signals the end of the script.  

//results = added 5851 labels, created 5851 nodes, set 34549 properties

//Setting time to float; date to date
MATCH (a:TreatmentEvent)  
SET a.workTime = toFloat(a.workTime)
SET a.dateTreated = date(a.dateTreated)
SET a.dateRequested = date(a.dateRequested);

//results = set 9591 properties

//******* :Adhesive :Material nodes ***********
//Neo4j supports multiple labels.  

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row, split(row.Adhesives, ",") AS adhesives
UNWIND adhesives AS adhesive
MERGE (n:Adhesive :Material {reference: row.Reference,
name: adhesive,
rowID:row.RowID});

//results = added 241 labels, created 241 nodes, 723 properties

//******* :RepairMaterial :Material nodes ***********  

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row, split(row.RepairMaterial, ",") AS repairMaterials
UNWIND repairMaterials AS repairMaterial
MERGE (n:RepairMaterial :Material {reference: row.Reference,
name: repairMaterial,
rowID:row.RowID});

//result = 543 nodes, 1629 properties

//******* :Solvent :Material nodes ***********  

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row, split(row.Solvents, ",") AS solvents
UNWIND solvents AS solvent
MERGE (n:Solvent :Material {reference: row.Reference,
name: solvent,
rowID:row.RowID});

//results = 23 nodes, 69 properties

//******* :WorkTime nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Time IS null
MERGE(a:WorkTime {workTime: row.Time, reference: row.Reference,
rowID:row.RowID});

//results= 3718 nodes, 11154 properties

//******* :PrimaryDamage nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Primarydamage IS null
MERGE(a:PrimaryDamage {primaryDamage: row.Primarydamage, reference: row.Reference,
rowID:row.RowID});

//results = 3834 labels, 3834 nodes, 11502 properties

//******* :SecondaryDamage nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Secondarydamage IS null
MERGE(a:SecondaryDamage {secondaryDamage: row.Secondarydamage, reference: row.Reference,
rowID:row.RowID});

// results = 1588 label, 1588 node, 4764 properties

//******* :DateTreated nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Datetreated IS null
MERGE(a:DateTreated {dateTreated: row.Datetreated, reference: row.Reference,
rowID:row.RowID});

//results = 5761 labels, 5761 nodes, 17283 properties 

//Setting date properties 
Match (a:DateTreated)
SET a.dateTreated = date(a.dateTreated)

//output = Set 5761 properties after 43 ms

//******* :DateRequested nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Daterequested IS null
MERGE(a:DateRequested {dateRequested: row.Daterequested, reference: row.Reference,
rowID:row.RowID})

//results = 112 nodes, 336 properties

//Setting date properties 
Match (a:DateRequested)
SET a.dateRequested = date(a.dateRequested)
//results =  112 properties set

//******* :Comments nodes *********** 
LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Comments IS null
MERGE(a:Comments {comments: row.Comments, reference: row.Reference,
rowID:row.RowID});

//results = 2895 labels, 2895 nodes, 8685 properties

//******* :ConditionComments nodes *********** 

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
WITH row WHERE NOT row.Conditioncomments IS null
MERGE(a:ConditionComments {conditionComments: row.Conditioncomments, reference: row.Reference,
rowID:row.RowID});

//results = 330 label, 330 node, 990 properties

//******* Bi-directional Relationships between data nodes *******

