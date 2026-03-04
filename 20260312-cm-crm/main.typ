#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#set page(
  fill: black,
  margin: 1cm,
  paper: "presentation-16-9",
)
#set text(
  white,
  size: 22pt,
)
#show heading.where(level: 1): it => {
  pagebreak()
  align(center + horizon)[
    #set text(rgb("FF0092"), size: 36pt, font: "Special Elite", weight: "medium")
    #upper[#it]
  ]
  v(1em)
}
#show heading.where(level: 2): it => {
  pagebreak()
  align(top + center)[
    #set text(rgb("FF0092"), font: "Fira Code", size: 24pt, weight: "medium")
    #lower[#it]]
  v(1cm)
}
#set text(font: "ITC Goudy Sans Std")
#set par(justify: true)
#show emph: it => {
  text(rgb("00FFFF"), it.body)
}
#set list(marker: (
  text(15pt, rgb("fff"), [■], baseline: 0pt),
  text(20pt, rgb("fff"), [‣], baseline: 0pt),
  text(20pt, rgb("fff"), [–], baseline: 0pt),
))
#set par(leading: 10pt)
#set list(spacing: 20pt)
#let c(content) = text(rgb("00FFFF"), content)
#show link: set text(rgb("00FFFF"))
#show link: underline

#show outline.entry: it => {
  align(center + horizon)[
    #text(rgb("FF0092"), font: "Special Elite")[#upper(it.body())]
  ]
}

////////////////////////////////////////////////////////////////////////////////////////////////////

#page(margin: 1cm)[
  #text(gray, size: 15pt, font: "Fira Code", weight: "light")[
    #grid(
      columns: (1fr, 2fr),
      inset: 0.5cm,
      rows: (auto, 1fr, auto),
      stroke: green,
      grid.cell(align: horizon + left)[
        12 mars 2026
      ],
      grid.cell(align: horizon + right)[
        Journée d'études du Consortium #c[Musica\*] / IR\* Huma-Num
      ],
      grid.cell(colspan: 2, align: center + horizon)[
        #text(rgb("FF0092"), size: 20pt, weight: "medium")[modéliser les données de la recherche avec le CIDOC CRM]
      ],
      grid.cell(align: horizon + left)[
        #text(rgb("00FFFF"))[📡 thomas.bottini\@cnrs.fr]
      ],
      grid.cell(align: horizon + right)[
        #c[I]nstitut de #c[Re]cherche en #c[Mus]icologie UMR 8223
      ],
    )
  ]
]

#page()[
  #align(center + horizon)[
    #block(stroke: green, inset: 1cm, width: 100%)[*Comment faire tenir les données de la recherche dans le temps ?*]
    #block[#align(left)[
      📜  Comment s'assurer qu'on puisse toujours les voir, les comprendre et les modifier ? \
      💾  À quels 🧺 confier ses 🥚 ? \
      ⚗️  Comment capter et transmettre les « traditions interprétatives » sans les amoindrir ? \
      🎓  Comment fonctionner avec des moyens (humains + techniques) limités ? \
      🌐  Comment favoriser les liens avec d'autres systèmes d'information ? \
            Comment faire du LOD ⭐⭐⭐⭐⭐ ? → #link("https://5stardata.info/fr/")
    ]]
    #v(1cm)
    Essayons d'apporter les moins mauvaises réponses.
  ]
]

#page[
  #outline(depth: 1, title: none)
]

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

== Le Web sémantique :

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
      edge(<A>, <B>, text(fuchsia)[purl.org/dc/terms/creator], "->"),
    )
  ]
]

- Connectés, ces triplets RDF forment un _graphe_.
- Chaque prédicat est également identifié par une _URL_. Cela permet de toujours savoir de quoi on parle quand on dit, par exemple : « Titre ».
- Tout graph RDF est interrogeable en SPARQL (+  standardisé que SQL).
- C'est le milieu technique idéal pour nos préoccupations : LOD, FAIR, etc.

= Modéliser

== Une ontologie : quoi, pourquoi ?

- Formalisation d'un modèle conceptuel pour un domaine donné, contenant des _classes_ et des _propriétés_.
- Utiliser les classes et les propriétés d'une ontologie confère ainsi une _sémantique partagée aux données_ (partage d'individus, partage de prédicats).
- Permet de capitaliser des connaissances de modélisation d'un projet à l'autre.
- Le Web sémantique s'accompagne de standards utiles pour nos métiers : #link("https://www.w3.org/TR/skos-primer/")[SKOS] pour les thésaurus, #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/")[DCMI] pour les métadonnées basiques, #link("https://data.doremus.org/ontology/")[DOREMUS] pour la musique écrite/éditée/jouée/diffusée, #link("https://cidoc-crm.org/lrmoo")[LRMOO] pour l'information bibliographique, #link("https://www.w3.org/TR/prov-o/")[PROV-O] pour la provenance de l'information, et bien sûr le CIDOC CRM.
- 🚨 Bien des projets de recherche alliant informatique et SHS produisent une ontologie spécifique.

== Laquelle ? Le CIDOC CRM !

- Ontologie qui documente le patrimoine matériel et immatériel ainsi que les _processus de production de connaissances_ à son propos (sources, connaissances, faits sociaux, concepts, objets matériels, idées dénotées ou connotées, contexte de production des connaissances, etc.).
- _Communauté large et établie_. Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN
- Elle est extrêmement _abstraite et générique_.
- Ontologie centrée événement.
- _Informations bibliographiques_ avec LRMoo (œuvres, expressions, manifestation, item).

== Hiérarchie des classes du cidoc crm

#align(center + horizon)[
  #image("crm-class-hierarchy.jpg", height: 84%)
]

= Saisir

== Ça se complique

-

= Explorer

= Péreniser
