#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let C1 = rgb("#00eaff")
#let C2 = rgb("#ff0092")
#let C3 = rgb("#39FF14")
#set page(
  fill: black,
  margin: 1cm,
  paper: "presentation-4-3",
)
#set text(
  white,
  lang: "fr",
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
#let f(content) = [#text(C3, font: "Fira Code", size: 18pt)[\[#content\]]]
#let sherlockuri(content) = [#text(C2, font: "Fira Code", size: 12pt)[#content]]
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
        #v(1cm)
        #text(gray, size: 15pt, weight: "regular")[pourquoi un standard + problèmes d'ingénierie logicielle]
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
    #text(gray, size: 15pt, font: "Fira Code")[[la question qui nous réunit]]
    #block(stroke: C3, inset: 1cm, width: 100%)[#text(C3)[
      #text(font: "Fira Code", size: 17pt)[Comment faire tenir les données de la recherche dans le temps ?]
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

== Modéliser sous contraintes de ressources

- La modélisation des données nécessite une réflexion conjointe entre chercheurs et ingénieurs.
  - Ce dialogue a une fonction _maïeutique_, il doit confronter le chercheur ou la chercheuse à des cas limites pour l'amener à mieux comprendre ses objets d'étude.
  - Le travail d'explicitation/modélisation des données a une fonction _heuristique_ : aider à révéler la structure interne des sources et des phénomènes étudiés.
- Or, souvent, la modélisation est perçue comme une étape purement technique par le client et est renvoyée à la compétence du prestataire.
- Les ressources d'ingénierie sont trop maigres, ce niveau de dialogue est rare.

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

= Encoder

== Quelques problèmes potentiels avec les SGBDR

- Un modèle relationnel est souvent conçu ici & maintenant : il formalise et matérialise une tâche d'analyse d'une pratique de recherche spécifique. Le risque est de « réinventer » la roue, sur le plan conceptuel, à chaque réitération de cette démarche d'analyse. Pourtant, il existe des similarités entre les pratiques de recherche en SHS liées aux données numériques.
- La sémantique d'un modèle relationnel ne peut être techniquement partagée, ce qui peut poser des problèmes de lecture et de compréhension plus tard.
- L'accès aux données par un système tiers peut être malaisé. Souvent, on doit développer une API, qui est déterminée par le cahier des charges du projet, alors qu'on sait qu'on ne peut anticiper tous les usages futurs des données (c'est l'idée même des LOD). C'est aussi un point de vigilance particulier dans le dialogue avec le prestataire : tout changement apporté au modèle vu comme minime par le client peut avoir d'importantes conséquences sur le développement.
- Tout ceci amène à parler d'architectures « en silo ».

== Pervasivité des SGBDR

- Le panorama technologique des outils permettant de construire rapidement des applications Web de saisie collaborative de données est dominé par les SGBDR :
  - CMS & assimilés (Wagtail, Drupal, Omeka, Heurist)
  - systèmes « no-code »
  - frameworks full-stack qui existent dans tous les langages de programmation
- Les SGBDR, et avec eux, la méthode Merise et le SQL, sont enseignés partout, à tous les niveaux. Les compétences d'ingénierie sont donc très répandues.

== Le Web sémantique

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
- Tout graphe RDF est interrogeable en SPARQL (+  standardisé que SQL).
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

== une ontologie unique : \ motivations sur le plan de l'ingénierie logicielle

- Le recours à un standard pour représenter les données permet mieux structurer le développement informatique.
- Par exemple, des _standards métier_ établis dans nos disciplines comme IIIF, MEI ou TEI rendent possible le fleurissement d'_initiatives logicielles indépendantes_.
- ⚙️ _MODULARISATION_
  - Des composants peuvent être développés en vue d'être réutilisés dans différents projets, ils savent toujours à quoi ressemblent leurs données.
- 🤝 _COMPRÉHENSION_
  - Un partage de la compréhension du modèle entre les acteurs participants au développement des différents composants d'un système d'information facilite leurs interactions, et limite les méprises sur les spécifications fonctionnelles.
  - Imaginons un monde où développeurs, utilisateurs et concepteurs graphiques partagent une compréhension profonde d'un modèle unique.
- Avantages méthodologiques, scientifiques, techniques, économiques.

== Laquelle ? Le CIDOC CRM !

- Ontologie qui documente le patrimoine matériel et immatériel ainsi que les _processus de production de connaissances_ à son propos (sources, connaissances, faits sociaux, concepts, objets matériels, idées dénotées ou connotées, contexte de production des connaissances, etc.).
- _Communauté large et établie_. Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN.
- Ontologie centrée événement.
- _Informations bibliographiques_ avec LRMoo (œuvres, expressions, manifestation, item).

== Hiérarchie des classes du CIDOC CRM

#v(-1cm)
#align(center + horizon)[
  #image("crm-class-hierarchy.jpg", height: 90%)
]

== Opérations critiques & patterns de base

- Nommer
- Identifier
- Typer, catégoriser, indexer, classifier (avec des concepts métier)
- Dater
- Établir le fait qu'une information fait référence à une entité (dénotation/connotation)
- Contextualiser, caractériser le contexte de production d'une chose ou d'une idée
- Structurer (entités matérielles et informationnelles)
- Annoter (plus généralement : signer tout apport de connaissance sur une entité)
- Établir la participation d'un acteur à un phénomène temporel ou social
- Décrire l'évolution dans le temps et l'espace d'une entité
- Décrire l'influence d'une chose ou d'une expérience sur une activité

_=> Tous ces « patterns » de modélisation permettent de capter les spécificités de nos pratiques scientifiques._

== S'y plonger

- #link(
    "https://cidoc-crm.org/sites/default/files/cidoc_crm_version_7.3.1_1_0.pdf#page=35",
    "Introduction to the basic concepts",
  ) (une dizaine de pages)
- Modèle
  - #link("https://cidoc-crm.org/sites/default/files/cidoc_crm_version_7.3.1_1_0.pdf#page=38", "centré événements")
  - prenant en charge les #link("https://cidoc-crm.org/sites/default/files/cidoc_crm_version_7.3.1_1_0.pdf#page=39", "relations spatio-temporelles")
  - avec notation extensive du #link("https://cidoc-crm.org/sites/default/files/cidoc_crm_version_7.3.1_1_0.pdf#page=47", "temps")

⚠️ Le CRM n'est pas un système de classification. Le fait de dire qu'une entité de votre corpus relève d'une certain classe du CRM lui confère un statut structurel/fonctionnel, et ne dit rien de sa teneur scientifique.

Par exemple, si on veut dire qu'une source textuelle (instance de la classe `crm:E33_Linguistic_Object`) est un traité de théorie musicale, il faut créer un concept « Traité de théorie musicale » et l'utiliser pour typer la ressource.

Les concepts issus du métier sont des instances de la classe `crm:E55_Type`, qui est équivalente à `skos:Concept`. Le CRM s'utilise naturellement en conjonction avec vos thésaurus pour sémantiser vos entités. À nouveau, c'est une ontologie générique.

= Saisir

== Ça se complique, sur le plan technique

- Un _graphe ouvert_ est plus _difficile à éditer_ que des données relationnelles, qui s'éditent naturellement en série dans un tableau ou avec des formulaires contraints.
- Les patterns fondamentaux du CRM (pour nommer, typer, dater, annoter, contextualiser…) _induisent beaucoup de sous-entités_. Nous sommes loins du modèle ligne/colonne/cellule. Des vocabulaires de schémas comme `DCMI Metadata Terms` ou `schema.org` sont plus simples, mais leur expressivité est loin d'égaler celle du CRM.
- Rien ne peut battre un #link("https://musicodb.sorbonne-universite.fr/4NmEJA4z9EUB/SHERLOCK/p/6")[tableur] pour l'édition d'items similaires rassemblés dans une collection. Au sein de nos communautés, Excel n'est pas qu'un choix par défaut.

== Exemple : conférer un identifiant à une ressource

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
      edge(<E42i>, <E42c>, [#text(eastern)[rdf:type]], "-|>", stroke: eastern),
      edge(<E42i>, <L>, [crm:P190_has_symbolic_content], "-|>"),
      edge(<E55i>, <E55c>, [#text(eastern)[rdf:type]], "-|>", stroke: eastern),
      edge(<E42i>, <E55i>, [crm:P2_has_type], "-|>"),
    )
  ]
]

== Ça se complique, sur le plan conceptuel

- Le CRM est _très expressif_ : il aide à _ne pas réduire ni trahir les productions analytiques_ des chercheurs et des chercheuses. _`[A]`_
- Son double caractère abstrait & générique le rend apte à modéliser _un large éventail de données convenant à un large éventail de pratiques_. Certes, le CRM n'est pas optimal pour chaque scénario, mais on peut se demander ce qu'il n'est pas capable de modéliser.
- Mais le CRM est complexe à comprendre et à mettre en œuvre…
  - Il existe parfois _plusieurs manières de modéliser_ une situation avec les classes de base.
  - En tant qu'ontologie _abstraite et générique_, sa structure représentée par ses classes et propriétés _fait écran avec la compréhension spontanée_ que l'on pourrait avoir de nos données. Certains chemins, quoique très précis sur le plan de la modélisation, sont alambiqués. (opinion : c'est le prix de la proposition _`[A]`_)
- De ce fait, chaque collectif s'approprie l'ontologie selon ses pratiques, en ne retenant que certaines classes et propriétés et en favorisant certains patterns de modélisation.
- => _Une interface d'édition générique de données CRM n'a pas vraiment de sens_. L'ontologie est peut-être trop large, trop peu focalisée… Des solutions ayant une approche plus « locale » seraient-elles à privilégier ?

== Notre objectif

#v(-1cm)
#align(center)[
  #text(gray, font: "Fira Code", size: 15pt)[
    \[nous = le consortium Musica\*\]
  ]
]

💡 Nous aimerions un système d'information générant des données CRM :

#f(1) qui s'adapte aux _conditions de saisie spécifiques à chaque pratique scientifique_

#f(2) qui n'ajoute pas de charge mentale aux chercheurs et aux chercheuses, ni n'impose de maîtriser une complexité formelle trop éloignée des objets de la recherche

#f(3) mais qui tire parti des _vertus heuristiques du CRM_ (on est là pour ça après tout !)

#f(4) et qui n'impose pas, sur le plan de la gestion de projet et de la gestion de nos ressources de développement, de développer un outil de saisie générique de données CRM (car c'est _coûteux_ et surtout _inadéquat_, comme on l'a vu)

#f(5) qui facilite les tâches techniques : déploiement, maintenance, _extraction_ des données structurées, paramétrage des règles de _mapping_, _génération_ des données RDF-CRM

#f(6) et en plus qui ajoute une couche de _structure_ et de _normalisation_ par rapport aux pratiques de _mapping_ avec des outils dédiés

== Les SGBDR à leur juste place

- Pour être au plus proche des pratiques de saisie #f[1]#f[2] et de la culture technique dominante #f[5], nous préconisons le recours à un outil de saisie de données _existant_ reposant sur un SGBDR, _libre_ et _ergonomique_.
- Par exemple, un candidat de la constellation « No-code ». Un SGBDR permet d'aller bien plus loin qu'une feuille Excel. Les outils « No-code » contemporains se rapprochent de cette ergonomie « tabulaire ». Avec la généralisation de ces outils, il y a moins de raisons de recourir à un tableur offline. #f[4]
- Dans cette perspective, le modèle relationnel devrait être créé pour répondre aux attendus ergonomiques d'un projet de recherche spécifique. Sa structure devrait permettre de générer des données CRM par la suite, mais il ne serait ici qu'un _modèle de saisie_, et non un modèle destiné à l'échange ou à la tenue dans le temps des données. #f[1]#f[5]

== Vers un mapping normalisé

- Lors, par exemple, d'une reprise de l'existant en vue d'une conversion en données CRM, on définit des règles de mapping spécifiques.
- Nous aimerions réduire au minimum les ajustements ad-hoc pour chaque nouveau projet.
- Nous aimerions ainsi définir un _standard de mapping_ entre données relationnelles et données RDF/CIDOC CRM. Ce serait une manière _normalisée & reproductible_ de faire correspondre une structure relationnelle/tabulaire à un graphe RDF/CIDOC CRM. #f[6]
- Ceci pourrait être simplement réalisé en _normalisant l'implémentation des structures relationnelles_ (nom des tables, convention de nommage des colonnes, clefs primaires, clefs étrangères, contraintes d'intégrité référentielles) et en s'appuyant sur des _conventions de représentation des patterns de modélisation du CRM_.
- Il faut identifier ces patterns, et pour chacun d'entre eux, imaginer une implémentation relationnelle réalisant le compromis optimum entre ergonomie de saisie et expressivité permise par le CRM (cf. exemple des rôles & événements de création pour une œuvre). #f[3]

== Synthèse

#align(center + horizon)[
  #text(white, font: "Fira Code", size: 15pt)[
    #diagram(
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
      node((0, 3), [données structurées avec mapping CRM normalisé], name: <C>),
      node((0, 5), [Jeu de données RDF / CIDOC CRM], name: <D>, fill: purple),
      node((0, 6), [Application Web « CRM-aware » / autre usage des données], name: <E>),
      edge(<A>, <B>, text(gray, size: 12pt)[implémentation/paramétrage], "->"),
      edge(<B>, <C>, text(gray, size: 12pt)[api], "->"),
      edge(
        <C>,
        <D>,
        text(gray, size: 12pt)[programme interprétant les \ informations de mapping et \ réalisant la conversion],
        "->",
      ),
      edge(<D>, <E>, text(gray, size: 12pt)[SPARQL endpoint], "->"),
    )
  ]
]

==

#align(center + horizon)[🖖]

== Grist

- Pourquoi Grist ?
  - https://lasuite.numerique.gouv.fr/produits/grist
  - facile à déployer/dockeriser
  - ergonomie excellente (tableur + fiches/formulaires personnalisables)
  - format SQLite
  - dimension collaborative
  - extensible via des plugins JavaScipt (en cours de développement chez nous : un plug-in pour indexer des données Grist avec Opentheso)
  - possibilité de conférer deux noms aux colonnes : un pour les yeux de l'utilisateur, un autre pour l'API, qui sert naturellement de lieu où réaliser le mapping
  - API REST complète (mais documentation sommaire)
- Des couples efficaces pour transformer les données :
  Python + #link("https://github.com/RDFLib/rdflib", "RDFLib"),
  Deno + #link("https://rdf.js.org/", "rdf.js"),
  Rust + #link("https://github.com/rust-rdf/rdf.rs", "rdf.rs").

= Explorer

#align(horizon + center)[#text(gray, font: "Fira Code", size: 20pt)[\[l'exemple de l'application web sherlock\]]]

== Le programme de recherche-ingénierie SHERLOCK

- Programme de recherche-ingénierie SHERLOCK à l'IReMus/CM\* :
  - « Comment et pourquoi modéliser les données musicologiques avec le CIDOC CRM ?»
  - « Comment faire interagir les données sémantiques et les sources ? »
  - « Comment publier et manipuler les données sémantiques ? »
- Pas ou peu d'apport financier.
- Développeur (presque) unique.
- _Recourir à un modèle unique dans les différents projets permet de ne concevoir développer et maintenir qu'une unique application pour présenter et exploiter les données._
- Technologies :
  - Front : TypeScript, React, Hero UI, Tailwind CSS
  - Back : Apache Jena Fuseki, Docker, Traefik

== SHERLOCK : objectifs fonctionnels

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un triplestore accessible via un SPARQL endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure et l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des patterns spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques.
- Démarche d'ingénierie : rendre techniquement indépendants les phases de _modélisation_, _saisie_ et _exploration_ (il manque un quatrième volet fonctionnel : l'exploitation). Le CRM comme ciment permettant cette indépendance.

== Les patterns CRM dans l'interface SHERLOCK

Identité d'une ressource \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/projects/mercure-galant/livraisons/1672-01]

Structure d'une œuvre + recherche plein-texte dans les composants \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/projects/mercure-galant/livraisons/1672-01]

Contenu d'un périodique \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/projects/mercure-galant/livraisons]

Annotations (E13) sur une ressource \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/id/355f3c4d-7b7c-472f-9b66-974a819f9eaf]

Ressources liées \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/id/355f3c4d-7b7c-472f-9b66-974a819f9eaf]

Rendu TEI, MEI, image \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/projects/mercure-galant/articles/1677-05_211] \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/?resource=https://www.nakala.fr/10.34847/nkl.48576349] \
#sherlockuri[https://data-iremus.huma-num.fr/sherlock/id/f28b62fc-d686-4c78-a205-015e5d7dc4b6]

= Pérenniser
