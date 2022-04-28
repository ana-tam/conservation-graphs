//Credit:  Max de Marzi 
//https://github.com/maxdemarzi
//https://maxdemarzi.com/tag/motif/
//cypher source from within: https://github.com/maxdemarzi/motifs/blob/master/src/main/java/com/maxdemarzi/results/FindMotifs.java
//As of Neo4j v.4.4.2 the following results are the same if you Return Count(*) or if you make the Match = to a p varible and Return Count(p)

//Warning - these queries may take a very long time or exceed memory (returns error) if your graph is large.

//	m	3.1
"MATCH (p1)-[r1]-(p2)-[r2]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p2 <> p3"
Return Count(*);

//	m	3.2
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p1)
WHERE p1 <> p2 AND p1 <> p3 AND p2 <> p3"
Return Count(*);

//	m	4.1
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	4.2
"MATCH (p1)-[r1]-(p2)-[r2]-(p3), (p2)-[r3]-(p4)
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	4.3
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p2) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	4.4
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p1)
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	4.5
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p1), (p2)-[r5]-(p4)
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	4.6
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p1), (p2)-[r5]-(p4), (p1)-[r6]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p2 <> p3 AND p2 <> p4 AND p3 <> p4"
Return Count(*);

//	m	5.1
"MATCH (p1)-[r1]-(p3)-[r2]-(p5)-[r3]-(p1), (p2)-[r4]-(p3)-[r5]-(p4)-[r6]-(p5)-[r7]-(p2) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.2
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4), (p3)-[r4]-(p5)-[r5]-(p2), (p5)-[r6]-(p1) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.3
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4), (p3)-[r4]-(p5)-[r5]-(p1)-[r6]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.4
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p1)-[r6]-(p4)-[r7]-(p2) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.5
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5), (p3)-[r5]-(p5)-[r6]-(p1)-[r7]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.6
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p2), (p3)-[r6]-(p5)-[r7]-(p1)-[r8]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.7
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p2), (p5)-[r6]-(p1)-[r7]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.8
"MATCH (p1)-[r1]-(p3)-[r2]-(p4)-[r3]-(p5)-[r4]-(p1)-[r5]-(p4)-[r6]-(p2)-[r7]-(p5)-[r8]-(p3)-[r9]-(p2) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.9
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p3)
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.10
"MATCH (p1)-[r1]-(p5), (p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.11
"MATCH (p1)-[r1]-(p2)-[r2]-(p4)-[r3]-(p5)-[r4]-(p3)-[r5]-(p4)-[r6]-(p1) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.12
"MATCH (p1)-[r1]-(p4)-[r2]-(p5)-[r3]-(p3)-[r4]-(p4)-[r5]-(p2) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.13
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p1), (p5)-[r6]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.14
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4), (p5)-[r4]-(p3)-[r5]-(p1)-[r6]-(p5)-[r7]-(p2) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.15
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4), (p3)-[r4]-(p5)-[r5]-(p1) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.16
"MATCH (p1)-[r1]-(p3)-[r2]-(p4)-[r3]-(p5)-[r4]-(p1), (p5)-[r5]-(p2)-[r6]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.17
"MATCH (p1)-[r1]-(p5)-[r2]-(p4)-[r3]-(p3)-[r4]-(p2) 
WHERE  p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.18
"MATCH (p1)-[r1]-(p4)-[r2]-(p2), (p5)-[r3]-(p4)-[r4]-(p3) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.19
"MATCH (p1)-[r1]-(p2)-[r2]-(p4)-[r3]-(p3), (p4)-[r4]-(p5) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.20
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p1) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);

//	m	5.21
"MATCH (p1)-[r1]-(p2)-[r2]-(p3)-[r3]-(p4)-[r4]-(p5)-[r5]-(p1)-[r6]-(p3)-[r7]-(p5)-[r8]-(p2)-[r9]-(p4)-[r10]-(p1) 
WHERE p1 <> p2 AND p1 <> p3 AND p1 <> p4 AND p1 <> p5 AND p2 <> p3 AND p2 <> p4 AND p2 <> p5 AND p3 <> p4 AND p3 <> p5 AND p4 <> p5"
Return Count(*);






















