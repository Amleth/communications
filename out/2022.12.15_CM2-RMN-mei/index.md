<style>
body { font-family: GoudyNoto; font-weight: 300; }
h1 { letter-spacing: 0.1em; font-family: "FuturaPT" !important; font-weight: 200; text-transform: uppercase; }
code { color: #16e7cf; }
.dim { color: #aaa; }
</style>

<!--∫ slide title -->
<div class="dim">
Consortium Musica<sub>2</sub><br/>
Rencontres de la musicologie numérique, 1<sup>ère</sup> édition, 15/12/2022
</div>

<div style="
    border-bottom: 1px solid white;
    border-top: 1px solid white;
    font-family: FuturaPT;
    font-size: 111%;
    letter-spacing: 0.1em;
    padding: 0.5cm 0;
    text-transform: uppercase;
">
Quelle infrastructure pour l'annotation sémantique collaborative de partitions MEI ?
</div>

<div class="dim">
Thomas BOTTINI<br/>
IReMus — Institut de Recherche en Musicologie, UMR 8223
</div>

<div style="display: flex; justify-content: center; padding-top: 2cm;">
<img style="height: 2cm; margin: 0 0.2cm;" src="../../logos/cnrs.png" />
<img style="height: 2cm; margin: 0 0.2cm;" src="../../logos/su.jpg" />
<img style="height: 2cm; margin: 0 0.2cm;" src="../../logos/bnf.jpg" />
<img style="height: 2cm; margin: 0 0.2cm;" src="../../logos/mc.png" />
</div>

<!--∫ slide c -->
# Plan

1. Problématique musicologique
2. Réponse conceptuelle & technique
3. Pérennisation de l'infrastructure & réflexions sur le futur

<!--∫ slide title -->
# Problématique musicologique

<!--∫ slide -->
# Contexte

- 💶 Projet européen H2020 POLIFONIA (*« Playing the soundtrack of our history »*)
    - [https://polifonia-project.eu/](https://polifonia-project.eu/)
    - [https://polifonia-project.eu/pilots/tonalities/](https://polifonia-project.eu/pilots/tonalities/)
        - Annoter collaborativement de grands corpus de partitions avec des traités théoriques historiques (Prætorius, Zarlino…)
        - Comparer les interprétations
•••
- 🎼 Équipe 3.1 de l'IReMus, « Théorie musicale, méthodes et pratiques analytiques »
•••
- 🏫 Projet Émergence Sorbonne-Université SHERLOCK porté par l'IReMus : *‹S›ocial sciences & ‹H›umanities corpora ‹E›xploration and active ‹R›eading with ‹L›inked, ‹O›pen & ‹C›ontributive ‹K›nowledge organisation systems*
    - Mettre le Web sémantique en pratique pour la musicologie

<!--∫ slide -->
# Au-delà de l'encodage

- 🎵 Les analystes veulent pouvoir annoter des partitions encodées en MEI : identifications et qualifications des dissonances, identification de fondamentales sur des verticalités, identification de cadences, annotations libres… Pour pouvoir ainsi librement définir des observables, il faut pouvoir…
•••
- 👻 … adresser des entités qui ne sont pas matérialisées par des signes dans l'encodage MEI (telles que des verticalités ou une note à un moment/offset précis au sein du temps où elle se fait entendre) ;
•••
- 🧺 … adresser des ensemble arbitraires d'éléments MEI qui ne suivent pas nécessairement la structure logique du document XML.
•••
<img src="offsets.png" style="position: absolute; right: 0.3cm; height: 5.5cm; bottom: 0.3cm;"/>
•••
<div style="color: deeppink; position: absolute; bottom: 3.2cm; right: 4.6cm">!</div>
<div style="color: deeppink; position: absolute; bottom: 3.2cm; right: 3.7cm">!</div>
<div style="color: deeppink; position: absolute; bottom: 3.2cm; right: 2.7cm">!</div>
<div style="color: deeppink; position: absolute; bottom: 3.2cm; right: 1.8cm">!</div>
<div style="color: deeppink; position: absolute; bottom: 3.2cm; right: 0.9cm">!</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 5.4cm">•</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 4.5cm">•</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 3.6cm">•</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 2.6cm">•</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 1.7cm">•</div>
<div style="color: deeppink; position: absolute; bottom: 0; right: 0.8cm">•</div>
•••

<div style="border: 1px solid #16e7cf; padding: 0.5cm 1cm; width: 18cm;">
Il faudrait, sur ce fragment : 7 notes + 6 verticalités + 6 offsets possibles pour la blanche pointée = 19 éléments adressables comme cibles potentielles d'annotations.
</div>

<!--∫ slide -->
# Une infrastructure pour l'annotation collaborative

- 💾 Un système d'information supplémentant l'encodage MEI et reposant sur un système d'adressage sur le Web
    - de l'ensemble des éléments MEI et « MEI étendu » ;
    - de n'importe quel élément ou groupe d'éléments MEI et « MEI étendu ».
•••
- Au niveau de l'infrastructure :
    - 👩 Système d'authentification pour signer les annotations.
    - 🎼 Catalogue des partitions offertes à l'analyse avec des métadonnées sur leurs contextes de production.
    - 📚 Listes de concepts et propriétés analytiques formalisés ailleurs (thésauri, ontologies).
    - 🐁 Interface d'annotation ergonomique.

<!--∫ slide title -->
# 2. Réponse conceptuelle & technique

<!--∫ slide -->
# Quel paradigme informationnel ?

- 🎼 Nécessité d'être extérieur à l'encodage MEI (collaboration sur le Web + prise en compte d'éléments non MEI).
•••
- 🌍 Le milieu technique et conceptuel du Web sémantique semble évident :
    - adressabilité sur le Web
    - pérennité des données : encodage (RDF sérialisable en texte brut), logiciels (triple stores libres), requêtage (SPARQL).
•••
- 🌵 … mais vient avec problèmes épineux :
    - Le Web sémantique énonce des vérités et la structure même du triplet RDF rend difficile son commentaire.
    - Chaque projet peuplé par au moins un•e informaticien•ne tend à créer un nouveau standard sous la forme d'une ontologie.
    - Comment rendre adressable le contenu d'un fichier MEI sur le Web ?

<!--∫ slide -->
# MEI2RDF

- 🐍 Développement d'un préprocesseur de fichiers MEI.
•••
- 🕰️ Extraction des verticalités (avec Music21).
•••
- 🆔 Attribution d'un identifiant unique à chaque élément MEI + stratégie de génération d'IRI déterministe :
  - `base=http://data-iremus.huma-num.fr/sherlock/id/`
  - `base:ec531913-04ad-4fa7-bd96-9659a6eceed7`
  - `base:ec531913-04ad-4fa7-bd96-9659a6eceed7_d1e545`
  - `base:ec531913-04ad-4fa7-bd96-9659a6eceed7-beat-3-3.0`
•••
- 📜 Conversion de la totalité de la structure XML (éléments & attributs) en triplets RDF + mapping quasi-bijectif vers un namespace Web.
    - `@prefix sherlockmei: <http://data-iremus.huma-num.fr/ns/sherlockmei#> .`
•••
- 🎓 CIDOC-CRM/CRMdig pour les relations génériques (typage, nommage, inclusion).
•••
- 😱 MEI2RDF => 4951958 triplets pour ~ 377 partitions.

<!--∫ slide c -->
<img src="tonalities.png" style="width: 100vw;"/>

<div>
+ l'API d'annotation SHERLOCK délègue l'identification à ORCiD
</div>

<!--∫ slide -->
# Gestion du corpus

- 📚 Catalogage des partitions (œuvres, compositeurs, genres, MD analytiques générales…).
    - Édition des (méta)données avec Directus.
    - Export intégral en RDF/CIDOC-CRM/LRMoo (🎉 DOREMUS 🥳).

<!--∫ slide title -->
# 3. Pérennisation de l'infrastructure & réflexions sur le futur

<!--∫ slide -->
# Qu'avons nous généré ?

- Des programmes : script Python de conversion MEI->RDF ; script Python d'export du catalogue Directus->RDF/CIDOC-CRM/LRMoo (+ divers scripts Python utilitaires).
•••
- Des déploiements (avec Docker) : Directus, applications React, Apache, service REST Java, triple Store Apache Jena Fuseki, reverse Proxy Traefik.
•••
- Du libre à tous les niveaux !
•••
- Des données : données RDF issus des fichiers MEI, données RDF/CIDOC-CRM/LRMoo du catalogage, données RDF/CIDOC-CRM/SHERLOCK d'annotations, ontologies OWL modélisant des traités théoriques historiques, des pelletées de référentiels RDF/CIDOC-CRM/SKOS.
•••
- Des savoir-faire
    - Utiliser le CIDOC-CRM & ses ontologies dérivées pour des question musicologiques.
    - Réfléchir sur l'intérieur et l'extérieur de la partition dans une perspective analytique.

<!--∫ slide -->
# Avec quels moyens ?

- Un poste d'IE fonctionnaire CNRS.
- Trois ans de CDD (humanités numériques + développement).
- Un stage ingénieur (pour se concentrer sur le front TONALITIES).
- Du temps de chercheur (pour les ontologies Zarlino, Prætorius…).
•••
- Aujourd'hui, tout cela est trop lié à des approches, savoirs et savoir-faire personnels et à une alchimie difficilement transposable. Ici, conjonction d'une ligne scientifique (les questions musicologiques derrières TONALITIES) et d'une ligne technique (SHERLOCK) autonomes mais en harmonie.
•••
- Problème récurrent dans les humanités numériques. Et le mythe de la reproductibilité en sciences 😁.

<!--∫ slide -->
# Avec quels moyens ?
<div style="margin: 0 0 0 -1.5cm;">
```dot 62b29510-c64c-4e4f-b3cf-087ccf30c562 29.5
layout=sfdp
"http://T1" [color=orange,fontcolor=orange]
"http://C1" [color=green,fontcolor=green]
"http://C2" [color=green,fontcolor=green]
"http://T1" -> "skos:ConceptScheme" [label="rdf:type"]
"http://T1" -> "« Thésaurus des thématiques »" [label="dcterms:title"]
"http://T1" -> "« Anne »" [label="dcterms:creator"]
"http://T1" -> "« Rebecca »" [label="dcterms:creator"]
"http://T1" -> "http://C1" [label="skos:hasTopConcept"]
"http://C1" -> "« Arts, sciences et techniques »" [label="skos:prefLabel"]
"http://C1" -> "skos:Concept" [label="rdf:type"]
"http://C1" -> "http://C2" [label="skos:narrower"]
"http://C2" -> "http://C1" [label="skos:broader"]
"http://C2" -> "« Astronomie »" [label="skos:prefLabel"]
"http://C2" -> "skos:Concept" [label="rdf:type"]
```
</div>