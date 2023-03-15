

//Page Rank

CALL gds.graph.project(
  'Recomended_Movie',
  ['User','Movie'],
  'RATED'
)

// Stream
CALL gds.pageRank.stream('Recomended_Movie')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).title AS title, score
ORDER BY score DESC, title ASC


// Create Node Pawra
CREATE (u:User {name: 'Pawara', UserID: '239362L'}) RETURN u



//movie list

with ["Mission: Impossible","Batman","Jurassic Park","Maverick","Casino Royale","RoboCop","Rocky","Shutter Island","Guardians of the Galaxy","Alice in Wonderland","Tron","Harry Potter and the Deathly Hallows: Part 2"] as movies  UNWIND movies as movie
MATCH (u:User{name: "Pawara"}),(m:Movie{title:movie}) 
MERGE (u) -[r:RATED {rating:toInteger(rand()*5)+1}]->(m)
RETURN u,m ;





// Content based filtering
MATCH (m:Movie {title:'Batman'})-[:IN_GENRE]->
      (g:Genre)<-[:IN_GENRE]-(other:Movie)
WITH m, other, count(g) AS intersection, collect(g.name) as common

WITH m,other, intersection, common,
     [(m)-[:IN_GENRE]->(mg) | mg.name] AS set1,
     [(other)-[:IN_GENRE]->(og) | og.name] AS set2

WITH m,other,intersection, common, set1, set2,
     set1+[x IN set2 WHERE NOT x IN set1] AS union

RETURN m.title, other.title, common, set1,set2,
       ((1.0*intersection)/size(union)) AS jaccard

ORDER BY jaccard DESC LIMIT 25

//Colaberative filtering
MATCH (u:User {name: 'Pawara'})
MATCH (u)-[r:RATED]->(m:Movie)
RETURN *
LIMIT 100;


// Stream
CALL gds.pageRank.stream('Recomended_Movie')
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).title AS title, score
ORDER BY score DESC, title ASC





// Show average ratings by Misty Williams
MATCH (u:User {name: 'Pawara'})
MATCH (u)-[r:RATED]->(m:Movie)
RETURN avg(r.rating) AS average;

// What are the movies that Misty liked more than average?
MATCH (u:User {name: 'Pawara'})
MATCH (u)-[r:RATED]->(m:Movie)
WITH u, avg(r.rating) AS average
MATCH (u)-[r:RATED]->(m:Movie)
WHERE r.rating > average
RETURN *;


MATCH (u:User {name: 'Pawara'})
MATCH (u)-[r:RATED]->(m:Movie)
RETURN *;
