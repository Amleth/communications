<style>
.context {
    border: 1px solid gray;
    color: gray;
    font-family: FiraCode;
    font-size: 18px;
}
.context > div { margin: 1em; }
</style>

<!--📜-->
<!--∫ slide cover -->

<div class="context">
<div style="display: flex; justify-content: space-between;">
<div>‹Les Humanités numériques pour la recherche et la formation›</div>
<div>17 janvier 2025</div>
</div>
<div style="text-align: right;">Journée d'études organisée par l'UFR LAM, IDHES Evry,<br/>les départements d'Histoire, de LEA et de Musicologie</div>
</div>

<div style="
    align-items: center;
    display: flex;
    flex-direction: column;
    font-family: FiraCode;
    justify-content: center;
    text-transform: lowercase;
">
<div style="color: #FF0092">modéliser, saisir, publier, exploiter</div>
<br/>
<div style="font-size: 75%;">retour sur la mise en œuvre du CIDOC CRM dans<br/>un système d'information pour la recherche</div>
</div>

<div>
<pre style="color: gray; font-size: 50%;">
https://github.com/Amleth/communications/tree/main/out/2025.01.17_evry_hn
</pre>
</div>

<div class="context">
<div style="display: flex; justify-content: space-between;">
<div>‹thomas.bottini@cnrs.fr›</div>
<div>‹I›nstitut de ‹Re›cherche en ‹Mus›icologie — ‹IReMus›, UMR 8223 CNRS</div>
</div>
<div style="display: flex; justify-content: space-between;">
<div></div>
<div>Consortium ‹Musica2› IR* Huma-Num</div>
</div>
</div>

<!-- ############################################################################################################### -->
<!-- ############################################################################################################### -->

<!-- ############################################################################################################### -->
<!-- ############################################################################################################### -->

<!--📜-->
<!--∫ slide title -->

# Saisir les données

<!--📜-->
<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :
  - Il existe parfois plusieurs manières de modéliser une situation avec les classes de base.


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :
  - Il existe parfois plusieurs manières de modéliser une situation avec les classes de base.
  - Ses *patterns* fondamentaux (pour nommer, type, dater, annoter…) induisent beaucoup de des sous-entités.


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :
  - Il existe parfois plusieurs manières de modéliser une situation avec les classes de base.
  - Ses *patterns* fondamentaux (pour nommer, type, dater, annoter…) induisent beaucoup de des sous-entités.
  - Son caractère ‹abstrait et générique› fait écran avec la compréhension naturelle que le chercheur pourrait avoir de ses données.


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :
  - Il existe parfois plusieurs manières de modéliser une situation avec les classes de base.
  - Ses *patterns* fondamentaux (pour nommer, type, dater, annoter…) induisent beaucoup de des sous-entités.
  - Son caractère ‹abstrait et générique› fait écran avec la compréhension naturelle que le chercheur pourrait avoir de ses données.
- En conséquence, ‹une interface d'édition générique de données CRM n'a pas de sens›, car chaque collectif construit sa manière d'utiliser l'ontologie.


<!--∫ slide -->

## Les problèmes émanant du RDF/CIDOC CRM

- Un graphe de données ouvert est plus difficile à éditer que des données relationnelles (tabulaires et contraintes).
- Le CRM est expressif, mais :
  - Il existe parfois plusieurs manières de modéliser une situation avec les classes de base.
  - Ses *patterns* fondamentaux (pour nommer, type, dater, annoter…) induisent beaucoup de des sous-entités.
  - Son caractère ‹abstrait et générique› fait écran avec la compréhension naturelle que le chercheur pourrait avoir de ses données.
- En conséquence, ‹une interface d'édition générique de données CRM n'a pas de sens›, car chaque collectif construit sa manière d'utiliser l'ontologie.
- Je préconise le recours à un outil de saisie de données ‹existant›, libre et ergonomique. Par exemple, un candidat de la constellation *« No-code »*.

<!--📜-->
<!--∫ slide ch cv -->

## NocoDB

<img src="nocodb.png" style="width: 28cm;"/>

<!--📜-->
<!--∫ slide -->

## Du relationnel au RDF

- Le modèle relationnel doit être créé pour répondre aux attendus ergonomiques du projet. Sa structure doit permettre de générer des données CIDOC CRM par la suite, mais il n'est qu'un ‹modèle de saisie›. Il représente la manière dont un collectif se saisit du CRM dans un contexte précis (classes et propriétés utilisées, idiomes de modélisation).


<!--∫ slide -->

## Du relationnel au RDF

- Le modèle relationnel doit être créé pour répondre aux attendus ergonomiques du projet. Sa structure doit permettre de générer des données CIDOC CRM par la suite, mais il n'est qu'un ‹modèle de saisie›. Il représente la manière dont un collectif se saisit du CRM dans un contexte précis (classes et propriétés utilisées, idiomes de modélisation).
- Des scripts doivent être écrits pour récupérer les données via l'‹API› offerte par le système et les ‹convertir› en données RDF modélisées avec le CIDOC CRM (un couple efficace pour ce genre de tâches : python/rdflib).


<!--∫ slide -->

## Du relationnel au RDF

- Le modèle relationnel doit être créé pour répondre aux attendus ergonomiques du projet. Sa structure doit permettre de générer des données CIDOC CRM par la suite, mais il n'est qu'un ‹modèle de saisie›. Il représente la manière dont un collectif se saisit du CRM dans un contexte précis (classes et propriétés utilisées, idiomes de modélisation).
- Des scripts doivent être écrits pour récupérer les données via l'‹API› offerte par le système et les ‹convertir› en données RDF modélisées avec le CIDOC CRM (un couple efficace pour ce genre de tâches : python/rdflib).
- Tous les moyens sont bons pour obtenir des données en CRM.

<!-- ############################################################################################################### -->
<!-- ############################################################################################################### -->

<!--📜-->
<!--∫ slide cv -->

# Explorer des données RDF/CRM :<br/>la « SHERLOCK APP »

<div>
<h3>Motivation</h3>
<div style="color: gray; font-style: italic;">
Recourir à un modèle unique dans les différents projets permet de ne concevoir, développer et maintenir qu'une unique application pour présenter et exploiter les données.
</div>
<br/>
<h3>Contexte</h3>
<div style="color: gray; font-style: italic;">
Pas ou peu d'apport financier. Programme de recherche SHERLOCK à l'IReMus :
<br/>
« Comment et pourquoi modéliser les données musicologiques avec le CIDOC CRM ?»
<br/>
« Comment les publier et les manipuler ? »
</div>
<br/>
<h3>Technologies</h3>
<div style="color: gray; font-style: italic; text-align: center;">
front : TypeScript, React, Next UI, Tailwind CSS
<br/>
(back : Apache Jena Fuseki)
</div>
</div>

<!--📜-->
<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des *patterns* spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques :
    - Triplets décrivant l'[identité d'une ressource](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/82a7b7d8-394a-4e47-a83e-ce34b5640b68)


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des *patterns* spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques :
    - Triplets décrivant l'[identité d'une ressource](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/82a7b7d8-394a-4e47-a83e-ce34b5640b68)
    - Dates


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des *patterns* spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques :
    - Triplets décrivant l'[identité d'une ressource](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/82a7b7d8-394a-4e47-a83e-ce34b5640b68)
    - Dates
    - Place dans une structure : sociale, bibliographique ([lrmoo:F18](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/336f0cc6-8eb0-4d5d-b1eb-c27674f8e479)), logique, matérielle…


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des *patterns* spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques :
    - Triplets décrivant l'[identité d'une ressource](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/82a7b7d8-394a-4e47-a83e-ce34b5640b68)
    - Dates
    - Place dans une structure : sociale, bibliographique ([lrmoo:F18](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/336f0cc6-8eb0-4d5d-b1eb-c27674f8e479)), logique, matérielle…
    - Annotations (qui ? qui ? quand ? pourquoi ?)


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (1/2)

- Une interface de navigation hypertexte générique portant sur la totalité des graphes RDF d'un Triplestore accessible via un SPARQL Endpoint.
- L'utilisateur devrait avoir le sentiment de naviguer dans des fiches, dont la structure l'affichage des métadonnées seraient clairs, sans être exposé à la technicité inhérente aux triplets RDF et aux noms abstraits des classes et des propriétés des ontologies convoquées…
- … mais la teneur des sujets/prédicats/objets RDF devrait toujours être clairement indiquée, pour raisons pédagogique et technique. Toutes les requêtes SPARQL utilisées devraient être exposées.
- Exploitation des *patterns* spécifiques du CRM ou de LRMoo pour proposer des interfaces spécifiques :
    - Triplets décrivant l'[identité d'une ressource](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/82a7b7d8-394a-4e47-a83e-ce34b5640b68)
    - Dates
    - Place dans une structure : sociale, bibliographique ([lrmoo:F18](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/336f0cc6-8eb0-4d5d-b1eb-c27674f8e479)), logique, matérielle…
    - Annotations (qui ? qui ? quand ? pourquoi ?)
    - Annotations (multiplicité des points de vue)

<!--📜-->
<!--∫ slide ch cv -->

## Identité d'une ressource

<img src="sherlock-app-id.png"/>

<!--📜-->
<!--∫ slide ch cv -->

## Liste des articles d'un périodique

<img src="sherlock-app-f18.png"/>

<!--📜-->
<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (2/2)

- Proposer l'éventuel contenu associé à la ressource en cours de consultation ([rendu HTML d'un fragment TEI](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/2d300dd8-7e10-4de1-ac12-95602a0e78fe), image IIIF, fichier MEI s'ouvrant dans l'interface d'annotation collaborative [Tonalities…](https://polifonia-project.eu/pilots/tonalities/)).


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (2/2)

- Proposer l'éventuel contenu associé à la ressource en cours de consultation ([rendu HTML d'un fragment TEI](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/2d300dd8-7e10-4de1-ac12-95602a0e78fe), image IIIF, fichier MEI s'ouvrant dans l'interface d'annotation collaborative [Tonalities…](https://polifonia-project.eu/pilots/tonalities/)).
- Moteur de recherche plein texte dans l'ensemble des valeurs littérales textuelles.


<!--∫ slide -->

## Objectifs fonctionnels de la « SHERLOCK app » (2/2)

- Proposer l'éventuel contenu associé à la ressource en cours de consultation ([rendu HTML d'un fragment TEI](https://data-iremus.huma-num.fr/sherlock/?resource=http://data-iremus.huma-num.fr/id/2d300dd8-7e10-4de1-ac12-95602a0e78fe), image IIIF, fichier MEI s'ouvrant dans l'interface d'annotation collaborative [Tonalities…](https://polifonia-project.eu/pilots/tonalities/)).
- Moteur de recherche plein texte dans l'ensemble des valeurs littérales textuelles.
- Moteur de recherche par concepts issus de thésaurus.

<!--📜-->
<!--∫ slide ch cv -->

## Rendu html d'un fragment TEI associé à la ressource

<img src="sherlock-app-tei.png"/>

<!-- ############################################################################################################### -->
<!-- ############################################################################################################### -->

<!--📜-->
<!--∫ slide ch cv -->

# Conclusion

🌴 merci 🌴