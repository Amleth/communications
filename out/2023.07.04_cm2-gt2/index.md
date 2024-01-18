<style>
body { font-family: GoudyNoto; font-weight: 300; }
h1 { letter-spacing: 0.1em; font-family: "FuturaPT" !important; font-weight: 200; text-transform: uppercase; }
h2 { color: #FF0092; letter-spacing: 0.075em; font-weight: 180; text-transform: uppercase; }
code { color: #16e7cf; }
.dim { color: #aaa; }
.center { text-align: center; }
.spring { display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 3cm; }
</style>

<!--∫ slide title -->

<div class="dim">
Consortium MUSICA2
<br/>
GT2 — Ontologies, thésauri & catalogage
<br/>
4 juillet 2023, CESR, Université de Tours
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
Objectifs du GT2
<br/>
&
<br/>
Introduction à l'ontologie CIDOC-CRM
</div>

<div>

<div style="font-size: 69%;">
```{ thomas.bottini • augustin.braud • achille.davy-rigaux • marco.gurrieri } @cnrs.fr```
</div>
<br/>
*‹I›nstitut de ‹Re›cherche en ‹Mus›icologie — IReMus, UMR 8223 CNRS*

</div>

<pre style="color: #16e7cf; font-size: 50% !important;">
https://github.com/Amleth/consortium-musica2-gt2-ontologies/
</pre>

<!--∫ slide -->

# Plan

I) Énonciation des objectifs du GT2
    - Problèmes identifiés
    - Réponses visées
II) Généralités sur le Web sémantique
III) Introduction à l'ontologie CIDOC-CRM
IV) Deux mots sur LRMoo et Doremus
V) Une étude de cas : modélisation des partitions encodées
V) Cas concrets récurrents

<!--∫ slide title -->

# I. Énonciation des objectifs du GT2

## Problèmes identifiés

<!--∫ slide -->

## FAIR, recherche & ingénierie

- L'époque est au [FAIR](https://www.go-fair.org/fair-principles/) et au [LOD](https://fr.wikipedia.org/wiki/Linked_open_data). Afin que l'‹ouverture des données de la recherche›, leur ‹interopérabilité› et leur ‹mise en relation avec des sources de données tierces› soient correctement traitées, il faut que ces questions soient pensées très en ‹amont des projets de recherche›, et finement ‹articulées aux questions méthodologiques›, voire scientifique.
§§§
- Il faut alors des ingénieurs et ingénieures qui « pensent » les données conjointement avec les chercheurs et chercheuses, dans des situations de travail où la technique ne joue pas un rôle ancillaire :
    - Ces ingénieurs et ingénieures doivent jouer un rôle ‹maïeutique› (savoir poser les questions, confronter le chercheur ou la chercheuse à des cas limites pour l'amener à mieux comprendre ses objets d'étude).
    - Le travail d'explicitation, de modélisation, des données doit avoir une fonction ‹heuristique› : aider à révéler la structure interne des sources et des phénomènes étudiés.
§§§
- 🚨 Les ressources d'ingénierie sont trop maigres, ce niveau dialogue est rare.

<!--∫ slide -->

## Capitalisation des connaissances techno-méthodologiques

- La FAIRisation des données musicologiques suppose une ‹dynamique informationnelle intellectuelle et technique entre les projets de BDD›.
§§§
- Pour la bâtir, un réseau d'acteurs et d'actrices est nécessaire, mais :
    - Il faut une complémentarité recherche/ingénierie/SIB car ces ‹connaissances sont très abstraites› et difficiles à saisir.
    §§§
    - Les musicologues devant piloter de tels projet manquent d'informations claires sur les ‹enjeux scientifiques des méthodes et technologies disponibles› pour correctement modéliser les informations scientifiques. Ceci peut conduire à des choix techniques inadaptés qui obèrent les possibilités scientifiques.
    §§§
    - Les profils techniques sont recrutés sur des contrats courts.
    §§§
    - Les prestataires n'ont pas d'intérêt à s'inscrire dans les réseaux HN.
§§§
- 🚨 Conséquemment, les ‹connaissances d'ingénierie spécifiques à la modélisation des données de la discipline sont peu capitalisées› ; chaque nouveau développement peine à bénéficier de l'expérience méthodologique et conceptuelle acquise informellement au fil des projets passés.

<!--∫ slide -->

## Technicité du Web sémantique & des ontologies

- Les questions techniques soulevées par le FAIRisation des données de la recherche sont non-triviales, les profils techniques compétents sont rares, et notre attractivité est parfois faible :
§§§
    - 🚨 Les ontologies ‹standards› dans les mondes de la recherche, des bibliothèques et des musées (CIDOC-CRM, LRMoo : nous allons y revenir) sont ‹expressives› (elles aident à ne pas réduire ni trahir les productions analytiques des chercheurs et des chercheuses) et sont maintenues par des communautés fortes, mais ‹complexes à comprendre et mettre en œuvre›, et manquent d'exemples concrets qui permettraient aux musicologues de mieux saisir leur intérêt.
§§§
    - 🚨 Le Web sémantique semble être ‹le meilleur milieu technique pour représenter des données scientifiques› (nous allons y revenir), mais il est difficile de construire des outils de saisie ergonomiques et génériques s'appuyant sur RDF et sur les ontologies citées infra.

<!--∫ slide title -->

# I. Énonciation des objectifs du GT2

## Réponses visées

<!--∫ slide -->

## Identifier et caractériser des situations de modélisation

- Il existe des ‹situations récurrentes de modélisation›, se présentant quels que soient les objets de recherche et quelles que soient les périodes étudiées.
§§§
- Dans le GT2, nous ambitionnons d'‹identifier› ces situations, de les ‹décrire›, et de les ‹formaliser› sous la forme de ‹fragments de graphes CIDOC-CRM›, afin d'aider les concepteurs et conceptrices bases de données musicologiques à prendre les bonnes décisions lors de l'établissement des modèles conceptuels et relationnels de leurs bases.
§§§
- Chaque situation sera publiée sur le [dépôt Github du GT2 ](https://github.com/Amleth/consortium-musica2-gt2-ontologies/tree/main/modules), et proposera :
    - une problématisation scientifique ;
    - un recensement des usages connus ;
    - un fragment de graphe CIDOC-CRM illustrant concrètement la proposition de modélisation ;
    - une explicitation de l'usage qui est fait des classes et propriétés du CIDOC-CRM mises en jeu ;
    - une description des verrous et des limites éventuelles rencontrées.

<!--∫ slide -->

## Thématiques potentielles pour les ateliers

- analyse — cadences
- concerts
- dates
- indexation conceptuelle
- musique contemporaine (GT4)
- prosopographie
- sources — iconographiques
- sources — partitions & métadonnées (GT1)
- sources — textuelles
- thésauri
- …

<!--∫ slide -->

## Constituer une communauté de travail autour de ces situations de modélisation

- À court terme :
    - Organiser entre six et huit ateliers thématiques de modélisation collective en septembre, octobre, novembre et décembre 2023.
    - Chaque atelier sera consacré à l'exploration à fond d'une situation de modélisation, et convoquera des « experts » de cette question.
§§§
- À long terme, nous maintiendrons ces ateliers de modélisation avec des séances tenues régulièrement, appuyés par des référents et référentes musicologues pour chaque situation de modélisation.
§§§
- Ces exemples d'utilisation du CIDOC-CRM autour de cas concrets immédiatement pertinents pour la musicologie constitueront une ressource de référence pédagogique, méthodologique, pratique et scientifique de premier plan, qu'il faudra maintenir.
§§§
- Les caractérisations de ces situations formeront une partie du guide de bonnes pratiques du GT2. qui contiendra également un guide introductif à la modélisation des données musicologiques avec le CIDOC-CRM.

<!--∫ slide -->

## Identifier des solutions techniques pour la manipulation des données sémantiques

- Recenser l'ensembles des problèmes techniques et méthodologiques soulevés par la manipulation de données sémantiques :
    - Ergonomie de la saisie.
    - Conformation des données existantes au CIDOC-CRM.
    - Alignement avec des données tierces.
    - Création de points d'accès (SPARQL endpoint).
    - Définition d'une politique pour la publication des données représentant des concepts ou des termes dans des vocabulaires contrôlés/thésauri.
    - Création d'interfaces de consultation génériques.
§§§
- Là aussi, nous formerons un groupe de réflexion technique pérenne.

<!--∫ slide title -->

# II. Généralités sur le Web sémantique

<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est un Web de données liées.
§§§
- Chaque donnée est identifiée par une URL.
§§§
- Toute information s'exprime sous la forme d'un triplet (sujet/prédicat/objet) dans un langage de description, le RDF.
§§§
- La connexion de ces triplets RDF forme un graphe.
§§§
- Chaque prédicat est également identifié par une URL.

```dot fd6722af-2ae4-4abf-a011-883dbe4b30db 26
layout=dot
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"https://data.bnf.fr/13962206/morton_feldman_for_philip_guston/" -> "https://data.bnf.fr/fr/13928795/morton_feldman/" [label="http://purl.org/dc/terms/creator"]
```

§§§
- C'est le milieu technique idéal pour des données FAIR, pour l'expression et à la diffusion des données de la recherche.

<!--∫ slide center -->

# Données relationnelles vs graphe RDF

<img src="corago.png"/>

*Corago in LOD - Seminar by Angelo Pompilio and Paolo Bonora, Digital Humanities and Digital Knowledge, Università di Bologna, 2017.*

<!--∫ slide -->

# Qu'est ce qu'une ontologie ?

- Formalisation d'un modèle conceptuel pour un domaine identifié proposant des :
    - ‹Classes :› types d'entités peuplant le domaine, possiblement organisées selon des relations d'héritage (spécificité). On appelle ‹individu› une ressource qui est du type d'une classe.
    - ‹Propriétés :› aspects, caractéristiques, attributs possibles de ces classes, qui peuvent soit pointer vers une valeur, soit vers un individu.
- Utiliser les classes et les propriétés d'une ontologie confère ainsi une sémantique partagée aux données RDF (les individus identifiés par des URL seront des sujets ou des objets, les propriétés des classes seront des prédicats).
- Vous connaissez peut-être déjà une ontologie : SKOS (pour construire des thésauri).

<!--∫ slide title -->

# III. Introduction à l'ontologie CIDOC-CRM

<!--∫ slide -->

# Le CIDOC-CRM en bref

- Le CIDOC-CRM est une ontologie qui documente le patrimoine matériel et immatériel ainsi que les processus de production de connaissances à son propos.
- [https://www.cidoc-crm.org/](https://www.cidoc-crm.org/)
- Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN.
- Elle est extrêmement abstraite et générique.
- Ontologie centrée événement (nous y reviendrons dans les exemples…)
- Classes et propriétés : [https://cidoc-crm.org/html/cidoc_crm_v7.1.2.html](https://cidoc-crm.org/html/cidoc_crm_v7.1.2.html)

<!--∫ slide center -->

# Hiérarchie des classes

<img src="cidoc-crm.jpg" style="margin-top: -1cm; width: 26cm;"/>

<!--∫ slide -->

Opinion : En dépit du nombre de classes centrées sur les usages de musées, le CIDOC-CRM propose des classes génériques permettant de rendre compte de l'ensemble des problématiques de modélisation de la structure et du contenu des sources, ainsi que des processus analytiques qui les prennent pour cible.

<!--∫ slide center -->

# Le temps dans le CRM

<img src="time.png" style="width: 26cm;"/>

<!--∫ slide title -->

# IV. Deux mots sur LRMoo et Doremus

<!--∫ slide -->

# LRMoo

- Basé sur l'[IFLA LRM](https://www.transition-bibliographique.fr/enjeux/definition-ifla-lrm/) (auparavant FRBR).
- Convergence du monde des musées (CIDOC-CRM) et du monde des bibliothèques (IFLA LRM) : l'ontologie LRMoo spécialise certaines classes du CIDOC-CRM (qui sert donc d'ontologie de base).
- Quatre entités fondamentales — Work, Expression, Manifestation, Item (WEMI) — représentant les quatre modes d'existence des sources (conceptuel, sémiotique, éditorial, matériel).
- [Documentation](https://www.cidoc-crm.org/frbroo/fm_releases)

<!--∫ slide -->

<img src="wemi.jpg" style="width: 26cm;"/>

<!--∫ slide center -->

## Des relations riches entre les entités

<img src="F1-F2-F3.png" style="height: 15cm;"/>

<!--∫ slide -->

# DOREMUS : points saillants

- Des vocabulaires utiles pour la musique : [data.doremus.org/vocabularies](https://data.doremus.org/vocabularies) + [github.com/DOREMUS-ANR/knowledge-base/tree/master/vocabularies](https://github.com/DOREMUS-ANR/knowledge-base/tree/master/vocabularies)
§§§
- Une ontologie sans équivalent pour la modélisation des effectifs prévus dans l'œuvre, des concerts, et des effectifs réalisés durant les performances : [https://data.doremus.org/ontology/](data.doremus.org/ontology)
§§§
- Un parti prix (désormais techniquement obsolète) sur la manière dont on peut modéliser une situation de composition : [data.doremus.org/ontology](https://data.doremus.org/ontology/)
§§§
- Un énorme dataset (BNF + Radio France + Philharmonie) d'œuvres, partitions, concerts… [data.doremus.org](https://data.doremus.org/)

<!--∫ slide title -->

# V. Une étude de cas : modélisation des partitions encodées

<!--∫ slide title -->

[🔗](https://lucid.app/lucidchart/c64a5745-23c5-4510-a750-9bdc769faa10/edit?viewport_loc=1141%2C384%2C1687%2C748%2C0_0&invitationId=inv_f25ce332-989a-40e0-be9e-7b3249b4d51c)

<!--∫ slide title -->

# VI. Cas concrets récurrents

<!--∫ slide -->

# Conventions

Dans les exemples, on utilisera les préfixes suivants pour les URL :

```
PREFIX crm: <http://www.cidoc-crm.org/cidoc-crm/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX m2:  <http://musica2.huma-num.fr/id/>
```

Ainsi, l'URL :

```
http://musica2.huma-num.fr/id/tralala
```

sera notée :

```
cm2:tralala
```

…ce qui évitera d'avoir des exemples illisibles, mais il ne faudra pas perdre de vue que toute ressource (en incluant les classes et les propriétés du CRM) est identifiée par une URI sur le Web.

<!--∫ slide spring -->

- ‹Typer une personne :›

```dot c41adbad-b0e3-435b-87fc-a896101ee1c0 11
layout=dot
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:x" -> "crm:E21_Person" [label="rdf:type"]
```
<hr/>
- ‹Nommer une personne avec une simple chaîne de caractère :›

```dot 885a06dd-c214-440d-a160-f8989633c7ac 18
layout=dot
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:x" -> "crm:E21_Person" [label="rdf:type"]
"m2:x" -> "« Morton Feldman »" [label="crm:P1_is_identified_by"]
```

<!--∫ slide -->

- ‹Typer quelque chose :›

```dot 97bb6c65-2967-4d6b-a88f-967676758661 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:x" -> "crm:E28_Conceptual_Object" [label="rdf:type"]
"m2:x" -> "m2:t" [label="crm:P2_has_type"]
"m2:t" -> "crm:E55_Type" [label="rdf:type"]
"m2:t" -> "« Cadence Phrygienne »" [label="crm:P1_is_identified_by"]
```
§§§
<div style="position: absolute ; bottom: 1cm; left: 1cm; z-index: 999; width: 18cm;">
💡
<br/>

- `rdf:type` : pour donner à votre entité un type technique au sein de l'ontologie CRM.
- `crm:P2_has_type` : pour donner à votre entité un type métier (défini par vous et en rapport avec les catégories convoquées par l'activité de recherche).
</div>

<!--∫ slide -->

- ‹Nommer une personne avec une entité appellation :›

```dot b6e43a33-4848-4b9b-9787-821f92367822 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:x" -> "crm:E21_Person" [label="rdf:type"]
"m2:x" -> "m2:a" [label="crm:P1_is_identified_by"]
"m2:a" -> "crm:E41_Appellation" [label="rdf:type"]
"m2:a" -> "« Morton Feldman »" [label="crm:P190_has_symbolic_content"]
```

<!--∫ slide -->

- ‹Typer un identifiant :›

```dot 34018359-12a6-4285-ab69-4605efba25bd 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:x" -> "crm:E36_Visual_Item" [label="rdf:type"]
"m2:x" -> "m2:id" [label="crm:P1_is_identified_by"]
"m2:id" -> "crm:E42_Identifier" [label="rdf:type"]
"m2:t" -> "« Identifiant IIIF v3 »" [label="crm:P1_is_identified_by"]
"m2:id" -> "http://gallica.bnf.fr/iiif/ark:/12148/btv1b10025411c/f7/full/full/0/native.jpg" [label="crm:P190_has_symbolic_content"]
"m2:id" -> "m2:t" [label="crm:P2_has_type"]
"m2:t" -> "crm:E55_Type" [label="rdf:type"]
```

<!--∫ slide -->

- ‹Organisation interne d'un contenu (ici, d'une image) :›

```dot c7806580-5e89-40cf-a19c-c5d231e92a5a 26
layout=neato
overlap=scale
splines=true
sep=.1
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:i1" -> "crm:E36_Visual_Item" [label="rdf:type",$RC$]
"m2:t" -> "crm:E55_Type" [label="rdf:type",$RC$]
"m2:i1" -> "m2:id1" [label="crm:P1_is_identified_by",$RC$]
"m2:id2" -> "m2:t" [label="crm:P2_has_type",$RC$]
"m2:t" -> "« Identifiant IIIF v3 »" [label="crm:P1_is_identified_by",$RC$]
"m2:id1" -> "https://gallica.bnf.fr/iiif/ark:/12148/btv1b10025411c/f7/full/full/0/native.jpg" [label="crm:P190_has_symbolic_content",$RC$]
"m2:id2" -> "https://gallica.bnf.fr/iiif/ark:/12148/btv1b10025411c/f7/1000,1000,2000,1000/full/0/native.jpg" [label="crm:P190_has_symbolic_content",$RC$]
"m2:i2" -> "crm:E36_Visual_Item" [label="rdf:type",$RC$]
"m2:id1" -> "m2:t" [label="crm:P2_has_type",$RC$]
"m2:i1" -> "m2:i2" [label="crm:P106_is_composed_of",$RC$]
"m2:i2" -> "m2:id2" [label="crm:P1_is_identified_by",$RC$]
"m2:id1" -> "crm:E42_Identifier" [label="rdf:type",$RC$]
"m2:id2" -> "crm:E42_Identifier" [label="rdf:type",$RC$]
```

<!--∫ slide -->

- ‹Dater un événement :›
```dot 58d222c0-1d75-4048-9eba-436938714889 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:t" -> "crm:E52_Time-Span" [label="rdf:type"]
"m2:t" -> "« début du début possible »" [label="crm:P82a_begin_of_the_begin",$RC$]
"m2:t" -> "« fin du début possible »" [label="crm:P81a_end_of_the_begin",$RC$]
"m2:t" -> "« début de la fin possible »" [label="crm:P81b_begin_of_the_end",$RC$]
"m2:t" -> "« fin de la fin possible »" [label="crm:P82b_end_of_the_end",$RC$]
"m2:e" -> "m2:t" [label="crm:P4_has_time-span"]
"m2:e" -> "crm:E7_Activity" [label="rdf:type"]
```

On retrouve la possibilité de définir des incertitudes aux bornes.

<!--∫ slide -->

- ‹Exprimer un événement de création simple :›

```dot 5b5cd603-3239-44be-b1a4-af2ac7a6eca8 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:g" -> "crm:E74_Group" [label="rdf:type"]
"m2:g" -> "« North Mississipi Allstars »" [label="crm:P1_is_identified_by"]
"m2:e" -> "crm:E65_Creation" [label="rdf:type"]
"m2:e" -> "m2:a" [label="crm:P94_has_created"]
"m2:a" -> "« Set Sail »" [label="crm:P1_is_identified_by"]
"m2:a" -> "crm:E73_Information_Object" [label="rdf:type"]
"m2:e" -> "m2:g" [label="crm:P14_carried_out_by"]
```

<!--∫ slide -->

- ‹Exprimer un événement de création complexe :›

```dot 6e389e22-9194-42fd-8f68-a1fe21551a7d 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
P2[label="m2:p2\n« Cody »\ncrm:E21_Person"]
P1[label="m2:p1\n« Luther »\ncrm:E21_Person"]
T0[label="m2:t0\n« Performance live »\ncrm:E55_Type"]
T1[label="m2:t1\n« Guitare 🎸 »\ncrm:E55_Type"]
T2[label="m2:t2\n« Batterie 🥁 »\ncrm:E55_Type"]
E0[label="m2:e0\ncrm:E7_Activity"]
E1[label="m2:e1\ncrm:E7_Activity"]
E2[label="m2:e2\ncrm:E7_Activity"]
L[label="m2:l\n« La Rochelle »\ncrm:E53_Place"]
E0 -> E1 [label="crm:P9_consists_of"]
E0 -> E2 [label="crm:P9_consists_of"]
E0 -> T0 [label="crm:P2_has_type"]
E1 -> T0 [label="crm:P2_has_type"]
E2 -> T0 [label="crm:P2_has_type"]
E1 -> P1 [label="crm:P14_carried_out_by"]
E2 -> P2 [label="crm:P14_carried_out_by"]
E0 -> L [label="crm:P7_took_place_at"]
E1 -> T1 [label="crm:P2_has_type"]
E2 -> T2 [label="crm:P2_has_type"]
```
§§§
<div style="position: absolute; bottom: 2cm; right: 1cm; width: 9cm; z-index: 666;">
Remarquez la finesse de l'adressage…<br/>Chaque élément constituant le phénomène a son URL et son identité.
</div>

<!--∫ slide -->

- ‹Exprimer une annotation :›

```dot 0fec83fd-be27-4620-baca-b35ac7b14dfc 26
layout=sfdp
node [color=cyan,fontcolor=white]
edge [color=cyan,fontcolor=white]
"m2:e" -> "m2:p" [label="crm:P14_carried_out_by"]
"m2:p" -> "crm:E21_Person" [label="rdf:type"]
"m2:e" -> "crm:E13_Attribute_Assignment" [label="rdf:type"]
"m2:e" -> "m2:a" [label="crm:P140_assigned_attribute_to"]
"m2:e" -> "« Quel bel album ! »" [label="crm:P141_assigned"]
"m2:e" -> "crm:P3_has_note" [label="crm:P177_assigned_property_of_type"]
"m2:a" -> "« Set Sail »" [label="crm:P1_is_identified_by"]
"m2:a" -> "crm:E73_Information_Object" [label="rdf:type"]
```