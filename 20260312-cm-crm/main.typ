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
  align(top)[
    #set text(size: 22pt, weight: "medium")
    #it]
  v(1em)
}
#show heading.where(level: 2): it => {
  pagebreak()
  align(top + center)[
    #set text(rgb("FF0092"), font: "Fira Code", size: 20pt, weight: "medium")
    #lower[#it]]
  v(0.5cm)
}
#set text(font: "ITC Goudy Sans Std")
#set par(justify: true)
#show emph: it => {
  text(rgb("00FFFF"), it.body)
}

#let c(content) = text(rgb("00FFFF"), content)

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
    *Comment faire tenir les données de la recherche dans le temps ?*
    #v(2cm)
    #block[#align(left)[
      - À quels 🧺 confier ses 🥚 ?
      - Comment capter et transmettre les « traditions interprétatives » ?
      - Avec des moyens limités ?
    ]]
  ]
]

= Modéliser

== Quelques problèmes potentiels avec les SGBDR

- Un modèle relationnel est souvent conçu hic et nunc : il formalise et matérialise une tâche d'analyse d'une pratique de recherche spécifique. Le risque est de « réinventer » la roue, sur le plan conceptuel, à chaque réitération de cette démarche d'analyse.
  - Pourtant, il existe des similarités faciles à observer entre les pratiques de recherche en SHS liées aux données numériques.

Mais :
- Le panorama technologiques des outils permettant de construire rapidement des applications Web de saisie collaborative de données est dominé par les systèmes reposant sur les SGBDR :
  - CMS & assimilés (Wagtail, Drupal, Omeka, Heurist)
  - frameworks full-stack existants dans tous les langages populaires
- Les SGBDR sont enseignés partout, à tous les niveaux, les compétences d'ingénierie sont très disponibles.

== Le Web sémantique : milieu technique idéal pour BDD des SHS

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est un Web de _données liées_, chacune étant identifiée par une _URL_. Cela permet de toujours savoir de quoi on parle.
- Toute information s'exprime sous la forme d'un _triplet_ sujet/prédicat/objet dans un langage de description qui est le RDF.
- La connexion de ces triplets RDF forme un _graphe_.
- Chaque prédicat est également identifié par une _URL_.
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

- C'est le milieu technique idéal pour des données _FAIR_, pour l'expression et la diffusion des données de la recherche.

== Une ontologie : quoi, pourquoi ?

- Formalisation d'un modèle conceptuel pour un domaine donné, contenant des _classes_ et des _propriétés_.
- Utiliser les classes et les propriétés d'une ontologie confère ainsi une _sémantique partagée aux données_ (partage d'individus, partage de prédicats).
- Permet de capitaliser des connaissances de modélisation d'un projet à l'autre.

== Laquelle ? Le CIDOC CRM !

- Ontologie qui documente le patrimoine matériel et immatériel ainsi que les _processus de production de connaissances_ à son propos (sources, connaissances, faits sociaux, concepts, objets matériels, idées dénotées ou connotées, contexte de production des connaissances, etc.).
- _Communauté large et établie_. Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN
- Elle est extrêmement _abstraite et générique_.
- Ontologie centrée événement.
- _Informations bibliographiques_ avec LRMoo (œuvres, expressions, manifestation, item).

= Saisir

- Les problèmes posés par la structure du CIDOC CRM

= Explorer
