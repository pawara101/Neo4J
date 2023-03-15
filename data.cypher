// Node always represents by ().
//Student Nodes
CREATE 
(kasun:STUDENT:MONITOR{name:'kasun gayantha',age:18,grade:12,marks:45}),
(nimal:STUDENT{name:'nimal udayanga',age:19,grade:13,marks:56}),
(piyal:STUDENT{name:'piyal rajapaksha',age:17,grade:12,marks:67}),
(gayan:STUDENT{name:'gayan perera',age:17,grade:13,marks:45}),
(wimal:STUDENT{name:'wimal udayanga',age:18,grade:13,marks:55}),
(namal:STUDENT{name:'namal wimanga',age:21,grade:13,marks:97}),
(wimani:STUDENT{name:'wimani nilushika',age:13,grade:6,marks:45}),
(nilushi:STUDENT{name:'nilushi priyangika',age:34,grade:13,marks:45}),
(priyan:STUDENT{name:'priyan athukorala',age:24,grade:12,marks:34}),
(kamal:STUDENT{name:'kamal priyanka',age:22,grade:12,marks:24}),

//Teacher Nodes
(gunasekara:TEACHER{name:'gunasekara wimalarathna',subject:'sinhala',grade:13}),
(nilushika:TEACHER{name:'nilushi kumari',subject:'maths',grade:12}),
(ranga:TEACHER{name:'ranga disanayake',subject:'arts',grade:12}),
(sarath:TEACHER{name:'sarath kumara',subject:'science',grade:13}),

// informations about subjects

(sinhala:SUBJECT {name:'sinhala litrature'}),
(maths:SUBJECT{name:'maths'}),
(arts:SUBJECT{name:'arts'}),
(science:SUBJECT{name:'science'}),

// Relationships

/// Kasun and Nimal are Friends
(kasun) -[:FRIENDS]-> (nimal),
(kasun) -[:FRIENDS]-> (piyal),
(kasun)-[:FRIENDS]->(gayan),
(kasun)-[:FRIENDS]->(namal),
(kasun)-[:FRIENDS]->(wimani),
(kasun)-[:FRIENDS]->(nilushi),
(priyan)-[:FRIENDS]->(kamal),
(nilushi)-[:FRIENDS]->(priyan),
(gayan)-[:FRIENDS]->(nimal),

(gunasekara) -[:TEACHES]-> (kasun),
(gunasekara)-[:TEACHES]->(piyal),
(gunasekara)-[:TEACHES]->(nilushi),
(ranga)-[:TEACHES]->(wimani),
(ranga)-[:TEACHES]->(kamal),
(ranga)-[:TEACHES]->(nimal),
(nilushika)-[:TEACHES]->(wimal),
(nilushika)-[:TEACHES]->(namal),
(nilushika)-[:TEACHES]->(wimani),
(sarath)-[:TEACHES]->(nilushi),
(sarath)-[:TEACHES]->(priyan),
(sarath)-[:TEACHES]->(kamal),

//relationships with relationship properties

(kasun)-[:STUDIES{marks:23}]->(sinhala),
(nimal)-[:STUDIES{marks:44}]->(maths),
(piyal)-[:STUDIES{marks:67}]->(science),
(gayan)-[:STUDIES{marks:45}]->(sinhala),
(wimal)-[:STUDIES{marks:78}]->(science),
(namal)-[:STUDIES{marks:23}]->(maths),
(nilushi)-[:STUDIES{marks:45}]->(arts),
(priyan)-[:STUDIES{marks:78}]->(science),
(kamal)-[:STUDIES{marks:56}]->(sinhala),
(kasun)-[:STUDIES{marks:90}]->(maths);

