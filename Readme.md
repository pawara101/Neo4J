# Neo4j

1. Neo4j Graph Database has the following building blocks
    - Nodes
    - Properties
    - Relationships
    - Labels
    - Data Browser

2. Basic Queries
    - Create Node
    
        `CREATE (ee:Person {name: 'Emil', from: 'Sweden', kloutScore: 99})`
        `MATCH (ee:Person) WHERE ee.name = 'Emil'CREATE (js:Person { name: 'Johan', from: 'Sweden', learn: 'surfing' }),(ir:Person { name: 'Ian', from: 'England', title: 'author' }),(rvb:Person { name: 'Rik', from: 'Belgium', pet: 'Orval' }),(ally:Person { name: 'Allison', from: 'California', hobby: 'surfing' }),(ee)-[:KNOWS {since: 2001}]->(js),(ee)-[:KNOWS {rating: 5}]->(ir),(js)-[:KNOWS]->(ir),(js)-[:KNOWS]->(rvb),(ir)-[:KNOWS]->(js),(ir)-[:KNOWS]->(ally),(rvb)-[:KNOWS]->(ally)`

3. Nodes
- Nodes are defined within parentheses (). Optionally, we can specify node label(s): (:Movie)

4. Relationships
- Relationships are defined within square brackets []. Optionally we can specify type and direction:

    `(:Movie)<-[:RATED]-(:User)`

5. Variables
- Graph elements can be bound to variables that can be referred to later in the query:
    `(m:Movie)<-[r:RATED]-(u:User)`

6. Predicates
- Filters can be applied to these graph patterns to limit the matching paths. Boolean logic operators, regular expressions and string comparison operators can be used here within the WHERE clause, e.g. WHERE m.title CONTAINS 'Matrix'    
