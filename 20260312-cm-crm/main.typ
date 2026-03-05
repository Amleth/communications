#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let C1 = rgb("#00eaff")
#let C2 = rgb("#ff00c8")
#let C3 = rgb("#39FF14")
#set page(
  fill: black,
  margin: 1cm,
  paper: "presentation-4-3",
)
#set text(
  white,
  size: 22pt,
)
#show heading.where(level: 1): it => {
  pagebreak()
  align(center + horizon)[
    #set text(C3, size: 36pt, font: "Audiowide", weight: "medium", tracking: 0.25em)
    #upper[#it]
  ]
  v(1em)
}
#show outline.entry: it => {
  align(center + horizon)[
    #text(C3, font: "Audiowide", tracking: 0.25em)[#upper(it.body())]
    #v(0.6cm)
  ]
}
#show heading.where(level: 2): it => {
  pagebreak()
  align(top + center)[
    #set text(C2, font: "Fira Code", size: 24pt, weight: "medium")
    #lower[#it]]
  v(1.5cm)
}
#set text(font: "ITC Goudy Sans Std")
#set par(justify: true)
#show emph: it => {
  text(C1, it.body)
}
#set list(marker: (
  text(15pt, white, [■], baseline: 0pt),
  text(20pt, white, [‣], baseline: 0pt),
  text(20pt, white, [–], baseline: 0pt),
))
#set par(leading: 10pt)
#set list(spacing: 18pt)
#let c(content) = text(C1, content)
#show link: set text(C1)
#show link: underline

////////////////////////////////////////////////////////////////////////////////////////////////////

#page(margin: 1cm)[
  #text(gray, size: 15pt, font: "Fira Code", weight: "light")[
    #grid(
      columns: (1.2fr, 2fr),
      inset: 0.5cm,
      rows: (auto, 1fr, auto),
      stroke: C3,
      grid.cell(align: horizon + left)[
        12 mars 2026
      ],
      grid.cell(align: horizon + right)[
        Journée d'étude du Consortium #c[Musica\*] \ IR\* Huma-Num
      ],
      grid.cell(colspan: 2, align: center + horizon)[
        #text(C2, size: 20pt, weight: "medium")[modéliser les données de la recherche avec le CIDOC CRM]
      ],
      grid.cell(align: horizon + left)[
        #text(C1)[📡 thomas.bottini\@cnrs.fr]
      ],
      grid.cell(align: horizon + right)[
        #c[I]nstitut de #c[Re]cherche en #c[Mus]icologie UMR 8223
      ],
    )
  ]
]

#page()[
  #align(center + horizon)[
    #text(gray, size: 16pt, font: "Fira Code")[[la question qui nous réunit]]
    #block(stroke: C3, inset: 1cm, width: 100%)[#text(C3)[
      Comment faire tenir les données de la recherche dans le temps ?
    ]]
    #v(2cm)
    #block[#align(left)[
      📜   Comment s'assurer qu'on puisse toujours les voir, les comprendre, les modifier ? \
      ⚗️   Comment capter et transmettre les « traditions interprétatives » sans les amoindrir ? \
      🎓   Comment fonctionner avec des moyens 👥/💻/💶 limités ? \
      🌐   Comment favoriser les liens avec d'autres systèmes d'information ? \
      💾   À quels 🧺 confier ses 🥚 ? \
    ]]
    #v(1cm)
  ]

]

== modéliser sous contraintes de ressources

- La modélisation des données nécessite une réflexion conjointe entre chercheurs et ingénieurs.
  - Ce dialogue a une fonction _maïeutique_, il doit confronter le chercheur ou la chercheuse à des cas limites pour l'amener à mieux comprendre ses objets d'étude.
  - Le travail d'explicitation, de modélisation, des données a une fonction _heuristique_ : aider à révéler la structure interne des sources et des phénomènes étudiés.
- Or, souvent, la modélisation est perçue comme une étape purement technique par le client et est renvoyée à la compétence du prestataire.
- Les ressources d'ingénierie sont trop maigres, ce niveau dialogue est rare.

De plus, l'époque est au #link("https://www.go-fair.org/fair-principles/", "FAIR") et au #link("https://5stardata.info/fr/", "LOD⭐⭐⭐⭐⭐") (des notions relativement spécifiques à notre contexte professionnel). L'ouverture des données de la recherche, leur interopérabilité et leur mise en relation avec des sources de données tierces nécessitent une réflexion technique, méthodologique et scientifique très en amont dans le projet. _Après, c'est souvent trop tard._

== Ce qu'on cherche à palier avec les consortiums

- La FAIRisation des données suppose une _dynamique informationnelle intellectuelle et technique entre les projets de BDD_.
- Pour la bâtir, un réseau d'acteurs et d'actrices est nécessaire, mais :
  - Il faut une complémentarité recherche⚗️/ingénierie⚙️/SIB📚 car _ces connaissances sont très abstraites_ et difficiles à saisir.
  - Les chercheurs et chercheuses devant piloter de tels projet manquent d'informations claires sur les conséquences scientifiques et méthodologiques des technologies disponibles pour modéliser les informations scientifiques.
  - Les profils techniques sont recrutés sur des _contrats courts_.
  - Les prestataires n'ont pas d'intérêt à s'inscrire dans les _réseaux HN_.
- Conséquemment, les connaissances d'ingénierie spécifiques à la modélisation des données de la discipline sont peu capitalisées ; chaque nouveau développement peine à bénéficier de l'expérience méthodologique et conceptuelle acquise informellement au fil des projets passés.

#page[#outline(depth: 1, title: none)]

= encoder

== Quelques problèmes potentiels avec les SGBDR

- Un modèle relationnel est souvent conçu ici & maintenant : il formalise et matérialise une tâche d'analyse d'une pratique de recherche spécifique. Le risque est de « réinventer » la roue, sur le plan conceptuel, à chaque réitération de cette démarche d'analyse. Pourtant, il existe des similarités entre les pratiques de recherche en SHS liées aux données numériques.
- La sémantique d'un modèle relationnel ne peut être techniquement partagée, ce qui peut poser des problèmes de lecture et de compréhension plus tard.
- L'accès aux données par un système tiers peut être malaisé. Souvent, on doit développer une API, qui est déterminée par le cahier des charges du projet, alors qu'on sait qu'on ne peut anticiper tous les usages futurs des données (c'est l'idée même des LOD). C'est aussi un point de tension dans le dialogue avec le prestataire : tout changement apporté au modèle vu comme minime par le client peut avoir d'importantes conséquences sur le développement.
- Tout ceci amène à parler d'architectures « en silo ».

== Pervasivité des SGBDR

- Le panorama technologiques des outils permettant de construire rapidement des applications Web de saisie collaborative de données est dominé par les systèmes reposant sur les SGBDR :
  - CMS & assimilés (Wagtail, Drupal, Omeka, Heurist)
  - systèmes « no-code »
  - frameworks full-stack qui existent dans tous les langages de programmation
- Les SGBDR, et avec eux, la méthode Merise et le SQL, sont enseignés partout, à tous les niveaux. Les compétences d'ingénierie sont donc très répandues.

== Le Web sémantique:

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est un Web de _données liées_, chacune étant identifiée par une _URL_.
- Toute information s'exprime sous la forme d'un _triplet_ sujet/prédicat/objet dans un langage de description qui est le #link("https://www.w3.org/TR/rdf12-primer/")[RDF].

#align(center)[
  #text(white, size: 12pt)[
    #diagram(
      node-fill: gradient.radial(fuchsia, white, radius: 150%),
      node-stroke: purple,
      node-shape: fletcher.shapes.hexagon,
      edge-stroke: purple + 1pt,
      node((0, 0), [data.bnf.fr/13962206/morton_feldman_for_philip_guston/], name: <A>),
      node((5, 0), [data.bnf.fr/fr/13928795/morton_feldman/], name: <B>),
      edge(<A>, <B>, text(fuchsia)[purl.org/dc/terms/creator], "-|>"),
    )
  ]
]

- Connectés, ces triplets RDF forment un _graphe_. Idée de modèle ouvert.
- Chaque prédicat est également identifié par une _URL_. Cela permet de toujours savoir de quoi on parle quand on dit, par exemple : « Titre ».
- Tout graph RDF est interrogeable en SPARQL (+  standardisé que SQL).
- C'est le milieu technique idéal pour nos préoccupations : LOD, FAIR, etc.

== Données relationnelles vs graphe RDF

#align(center + horizon)[
  #figure(
    image("corago.png", width: 80%),
    caption: [
      Corago in LOD - Seminar by Angelo Pompilio and Paolo Bonora, Digital Humanities and Digital Knowledge, Università di Bologna, 2017.
    ],
  )
]

= Modéliser

== Une ontologie : quoi, pourquoi ?

- Formalisation d'un modèle conceptuel pour un domaine donné, contenant des _classes_ et des _propriétés_.
- Utiliser les classes et les propriétés d'une ontologie confère ainsi une _sémantique partagée aux données_.
- Permet de capitaliser des connaissances de modélisation d'un projet à l'autre.
- Le Web sémantique s'accompagne de standards utiles pour nos métiers : #link("https://www.w3.org/TR/skos-primer/")[SKOS] pour les thésaurus, #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/")[DCMI] pour les métadonnées basiques, #link("https://data.doremus.org/ontology/")[DOREMUS] pour la musique écrite/éditée/jouée/diffusée, #link("https://cidoc-crm.org/lrmoo")[LRMOO] pour l'information bibliographique, #link("https://www.w3.org/TR/prov-o/")[PROV-O] pour la provenance de l'information, et bien sûr le CIDOC CRM.
- Bien des projets de recherche alliant informatique et SHS se donnent pour mission de produire une nouvelle ontologie pour couvrir un besoin spécifique. Nous défendons la thèse opposée : tenter de tout modéliser avec le CIDOC CRM.

== motivations sur le plan de l'ingénierie logicielle

//TODO
Le recours à un standard pour représenter les données permet mieux structurer le développement informatique :

- Meilleure compréhension entre les acteurs participants au développement des différents maillons de la chaîne car ils partagent une compréhension du modèle.
- Ces composants savent toujours à quoi ressemblent les données, ceci limite les risques de méprise sur les spécifications fonctionnelles.
- Exemples des standards métier établis dans nos disciplines (IIIF, MEI, TEI…), qui permettent le fleurissement d'initiatives logicielles indépendantes.
- Des composants peuvent être développés en vue d'être réutilisés dans différents projets.

== Laquelle ? Le CIDOC CRM !

- Ontologie qui documente le patrimoine matériel et immatériel ainsi que les _processus de production de connaissances_ à son propos (sources, connaissances, faits sociaux, concepts, objets matériels, idées dénotées ou connotées, contexte de production des connaissances, etc.).
- _Communauté large et établie_. Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN
- Ontologie centrée événement.
- _Informations bibliographiques_ avec LRMoo (œuvres, expressions, manifestation, item).

== Hiérarchie des classes du cidoc crm

#v(-1cm)
#align(center + horizon)[
  #image("crm-class-hierarchy.jpg", height: 90%)
]

== Opérations critiques & patterns de base

- Nommer
- Identifier
- Typer (avec un concept métier)
- Dater
- Contextualiser
- Établir le fait qu'une information fait référence à une entité
- Structurer
- Indexer
- Annoter (plus généralement : signer tout apport de connaissance sur une entité)
- Établir la participation d'un acteur à un phénomène temporel
- Décrire l'évolution dans le temps et l'espace d'une entité
- Décrire l'influence d'une chose ou d'une expérience sur une activité.

== S'y plonger

// TODO
- #link(
    "https://cidoc-crm.org/sites/default/files/cidoc_crm_version_7.3.1_1_0.pdf#page=35",
    "Introduction to the basic concepts",
  ) (une dizaine de pages)
- Modèle centré événements.
- Le CRM fournit des
The key to the proper understanding of CIDOC CRM comes through the appropriation of its basic divisions and the logic these represent. It is important to underline that the CIDOC CRM is not intended to function as a classification system or vocabulary tool. The basic class divisions in CIDOC CRM are declared in order to be able to apply distinct properties to these classes and, in so doing, formulate precise, analytic propositions that represent historical realities. The expressive power of CIDOC CRM comes not from the application of classes to classify entities but in the documenting the interrelation of individual historical items through well-defined properties.

Note : certaines de ces opérations ont recours à des concepts métier. On peut considérer que la classe `crm:E55_Type` est équivalente à `skos:Concept`.




= Saisir

== Ça se complique

- Sur le plan conceptuel, le CRM est _expressif_ (il aide à ne pas réduire ni trahir les productions analytiques des chercheurs et des chercheuses), est maintenu par une communauté forte, mais est _complexe à comprendre et à mettre en œuvre_ :
  - Il existe parfois _plusieurs manières de modéliser_ une situation avec les classes de base.
  - C'est une ontologie extrêmement _abstraite et générique_.

- Sur le plan ergonomique :
  - Un graphe ouvert est plus difficile à éditer que des données relationnelles (données tabulaires s'éditant naturellement avec des formulaires contraints).
  - Les patterns fondamentaux du CRM (pour nommer, typer, dater, annoter, contextualiser…) _induisent beaucoup de sous-entités_. Nous sommes loins du modèle ligne/colonne/cellule.
  - Rien ne peut battre un #link("https://musicodb.sorbonne-universite.fr/4NmEJA4z9EUB/SHERLOCK/p/6")[tableur] pour l'édition d'items similaires rassemblés dans une collection.

== Conférer un identifiant à une ressource

#v(-1cm)
#align(center)[#image("e42.png", width: 20cm)]
#align(center)[vs]

#block(stroke: gray, inset: 6pt, width: 100%)[
  #text(gray, size: 15pt)[
    ```
    @base <http://data-iremus.huma-num.fr/id/> .
    @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
    @prefix crm: <http://www.cidoc-crm.org/cidoc-crm/> .
    @prefix nakala: <https://nakala.fr/> .
    ```
  ]
]

#align(center + horizon)[
  #text(white, font: "Fira Code", size: 12pt)[
    #diagram(
      node-fill: gradient.radial(fuchsia, white, radius: 300%),
      node-inset: 0.5em,
      node-shape: fletcher.shapes.rect,
      node-stroke: fuchsia,
      edge-stroke: fuchsia + 1pt,
      node((0, 0), [crm:E55_Type], name: <E55c>, fill: eastern, stroke: blue),
      node((4, 0), [:9cf03b38-703d-4432-a023-d4c4c709226b], name: <E1i>),
      node((4, 3), [:whatever], name: <E42i>),
      node((6, 3), [crm:E42_Identifier], name: <E42c>, fill: eastern, stroke: blue),
      node((0, 3), [:NAKALA_DOI], name: <E55i>),
      node((4, 5), [nakala:10.34847/nkl.ffaad476], name: <L>),
      edge(<E1i>, <E42i>, [crm:P1_is_identified_by], "-|>"),
      edge(<E42i>, <E42c>, [rdf:type], "-|>"),
      edge(<E42i>, <L>, [crm:P190_has_symbolic_content], "-|>"),
      edge(<E55i>, <E55c>, [rdf:type], "-|>"),
      edge(<E42i>, <E55i>, [crm:P2_has_type], "-|>"),
    )
  ]
]

== Du relationnel au RDF

//TODO
- Mapping
- Le modèle relationnel doit être créé pour répondre aux attendus ergonomiques du projet. Sa structure doit permettre de générer des données CIDOC CRM par la suite, mais il n'est qu'un _modèle de saisie_. Il représente la manière dont un collectif se saisit du CRM dans un contexte précis (classes et propriétés utilisées + idiomes de modélisation.
- Du code doit être écrit pour récupérer les données via l'API offerte par le système et les convertir en données RDF modélisées avec le CIDOC CRM (des couples efficace pour ce genre de tâches : python/rdflib, deno/https://rdf.js.org/)

== un pipeline data/software avec le CRM comme pivot

//TODO
#align(center + horizon)[
  #text(white, font: "Fira Code", size: 15pt)[
    #diagram(
      node-fill: gradient.radial(purple, white, radius: 300%),
      node-inset: 0.75em,
      node-shape: fletcher.shapes.rect,
      node-stroke: purple,
      edge-stroke: purple + 1pt,
      node((0, 1), [Modèle relationnel « de saisie »], name: <A>),
      node(
        (0, 2),
        [IHM de SGBDR / outil No-code / tableur \ + \ conventions de nommage des colonnes → mapping CRM],
        name: <B>,
      ),
      node((0, 3), [données structurées], name: <C>),
      node((0, 4), [Jeu de données RDF / CIDOC CRM], name: <D>),
      node((0, 5), [Application Web « CRM aware »], name: <E>),
      edge(<A>, <B>, text(gray, size: 12pt)[], "->"),
      edge(<B>, <C>, text(gray, size: 12pt)[api / lecture directe], "->"),
      edge(<C>, <D>, text(gray, size: 12pt)[scripts interprétant le mapping et réalisant la conversion], "->"),
      edge(<D>, <E>, text(gray, size: 12pt)[SPARQL endpoint], "->"),
    )
  ]
]

= Explorer

//TODO

= Pérenniser

//TODO
