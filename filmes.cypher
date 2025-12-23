// CONSTRAINTS DE UNICIDADE
CREATE CONSTRAINT IF NOT EXISTS FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (c:Content) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (g:Genre) REQUIRE g.name IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (a:Actor) REQUIRE a.name IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (d:Director) REQUIRE d.name IS UNIQUE;

// CRIAÇÃO DE USUÁRIOS
UNWIND [
  {id:"U1", n:"Ana"}, {id:"U2", n:"Beto"}, {id:"U3", n:"Caio"}, {id:"U4", n:"Duda"}, {id:"U5", n:"Enzo"},
  {id:"U6", n:"Fabi"}, {id:"U7", n:"Gabi"}, {id:"U8", n:"Hugo"}, {id:"U9", n:"Iara"}, {id:"U10", n:"João"}
] AS userData 
CREATE (:User {id: userData.id, name: userData.n});

// CRIAÇÃO DE CONTEÚDO, ATORES E DIRETORES
MERGE (m1:Movie:Content {id: "M1", title: "Inception"})
MERGE (a1:Actor {name: "Leonardo DiCaprio"}) MERGE (d1:Director {name: "Christopher Nolan"})
MERGE (g1:Genre {name: "Sci-Fi"})
MERGE (a1)-[:ACTED_IN]->(m1) MERGE (d1)-[:DIRECTED]->(m1) MERGE (m1)-[:IN_GENRE]->(g1);

MERGE (m2:Movie:Content {id: "M2", title: "The Matrix"})
MERGE (a2:Actor {name: "Keanu Reeves"}) MERGE (d2:Director {name: "Lana Wachowski"})
MERGE (g2:Genre {name: "Sci-Fi"})
MERGE (a2)-[:ACTED_IN]->(m2) MERGE (d2)-[:DIRECTED]->(m2) MERGE (m2)-[:IN_GENRE]->(g2);

MERGE (m3:Movie:Content {id: "M3", title: "Parasite"})
MERGE (a3:Actor {name: "Song Kang-ho"}) MERGE (d3:Director {name: "Bong Joon-ho"})
MERGE (g3:Genre {name: "Drama"})
MERGE (a3)-[:ACTED_IN]->(m3) MERGE (d3)-[:DIRECTED]->(m3) MERGE (m3)-[:IN_GENRE]->(g3);

MERGE (m4:Movie:Content {id: "M4", title: "The Dark Knight"})
MERGE (a4:Actor {name: "Christian Bale"}) MERGE (d4:Director {name: "Christopher Nolan"})
MERGE (g4:Genre {name: "Ação"})
MERGE (a4)-[:ACTED_IN]->(m4) MERGE (d4)-[:DIRECTED]->(m4) MERGE (m4)-[:IN_GENRE]->(g4);

MERGE (m5:Movie:Content {id: "M5", title: "La La Land"})
MERGE (a5:Actor {name: "Emma Stone"}) MERGE (d5:Director {name: "Damien Chazelle"})
MERGE (g5:Genre {name: "Musical"})
MERGE (a5)-[:ACTED_IN]->(m5) MERGE (d5)-[:DIRECTED]->(m5) MERGE (m5)-[:IN_GENRE]->(g5);

MERGE (m6:Movie:Content {id: "M6", title: "City of God"})
MERGE (a6:Actor {name: "Alexandre Rodrigues"}) MERGE (d6:Director {name: "Fernando Meirelles"})
MERGE (g6:Genre {name: "Crime"})
MERGE (a6)-[:ACTED_IN]->(m6) MERGE (d6)-[:DIRECTED]->(m6) MERGE (m6)-[:IN_GENRE]->(g6);

MERGE (s1:Series:Content {id: "S1", title: "Stranger Things"})
MERGE (a7:Actor {name: "Millie Bobby Brown"}) MERGE (d7:Director {name: "Duffer Brothers"})
MERGE (g7:Genre {name: "Terror"})
MERGE (a7)-[:ACTED_IN]->(s1) MERGE (d7)-[:DIRECTED]->(s1) MERGE (s1)-[:IN_GENRE]->(g7);

MERGE (s2:Series:Content {id: "S2", title: "Breaking Bad"})
MERGE (a8:Actor {name: "Bryan Cranston"}) MERGE (d8:Director {name: "Vince Gilligan"})
MERGE (g8:Genre {name: "Crime"})
MERGE (a8)-[:ACTED_IN]->(s2) MERGE (d8)-[:DIRECTED]->(s2) MERGE (s2)-[:IN_GENRE]->(g8);

MERGE (s3:Series:Content {id: "S3", title: "Money Heist"})
MERGE (a9:Actor {name: "Úrsula Corberó"}) MERGE (d9:Director {name: "Álex Pina"})
MERGE (g9:Genre {name: "Ação"})
MERGE (a9)-[:ACTED_IN]->(s3) MERGE (d9)-[:DIRECTED]->(s3) MERGE (s3)-[:IN_GENRE]->(g9);

MERGE (s4:Series:Content {id: "S4", title: "The Crown"})
MERGE (a10:Actor {name: "Claire Foy"}) MERGE (d10:Director {name: "Peter Morgan"})
MERGE (g10:Genre {name: "Drama"})
MERGE (a10)-[:ACTED_IN]->(s4) MERGE (d10)-[:DIRECTED]->(s4) MERGE (s4)-[:IN_GENRE]->(g10);

// HISTÓRICO DE VISUALIZAÇÃO (WATCHED)
MATCH (u:User {id:"U1"}), (c:Content {id:"M1"}) CREATE (u)-[:WATCHED {rating: 10}]->(c);
MATCH (u:User {id:"U2"}), (c:Content {id:"S2"}) CREATE (u)-[:WATCHED {rating: 9}]->(c);
MATCH (u:User {id:"U3"}), (c:Content {id:"M3"}) CREATE (u)-[:WATCHED {rating: 8}]->(c);
MATCH (u:User {id:"U4"}), (c:Content {id:"M4"}) CREATE (u)-[:WATCHED {rating: 9}]->(c);
MATCH (u:User {id:"U5"}), (c:Content {id:"S1"}) CREATE (u)-[:WATCHED {rating: 7}]->(c);
MATCH (u:User {id:"U6"}), (c:Content {id:"M6"}) CREATE (u)-[:WATCHED {rating: 10}]->(c);
MATCH (u:User {id:"U7"}), (c:Content {id:"S3"}) CREATE (u)-[:WATCHED {rating: 8}]->(c);
MATCH (u:User {id:"U8"}), (c:Content {id:"M5"}) CREATE (u)-[:WATCHED {rating: 9}]->(c);
MATCH (u:User {id:"U9"}), (c:Content {id:"S4"}) CREATE (u)-[:WATCHED {rating: 10}]->(c);
MATCH (u:User {id:"U10"}), (c:Content {id:"M2"}) CREATE (u)-[:WATCHED {rating: 8}]->(c);