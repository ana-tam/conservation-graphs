//Script to load the TNA dataset as mapped nodes in Neo4j from .csv
//This Load procedure creates a :TreatmentEvent node per row directly from the .csv, with each column header as the property key for the corresponding value.  

LOAD CSV WITH HEADERS FROM 'file:///TNAcombined2021.csv' AS row
CREATE (:TreatmentEvent 
{rowID:row.RowID,
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

//Adding rowID ensures subsequent matching is more unique.
//results = added 5851 labels, created 5851 nodes, set 34549 properties
