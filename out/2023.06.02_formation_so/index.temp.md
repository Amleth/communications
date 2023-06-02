<style>
body { font-family: GoudyNoto; font-weight: 300; }
h1 { letter-spacing: 0.1em; font-family: "FuturaPT" !important; font-weight: 200; text-transform: uppercase; }
code { color: #16e7cf; }
.dim { color: #aaa; }
.center { text-align: center; }
.spring { display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 3cm; }
</style>

<!--📜-->
<!--∫ slide title -->

<div class="dim">
Formations autour de la diffusion de la recherche et de la science ouverte
<br/>
Les humanités numériques en pratique
<br/>
2 juin 2023
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
Modéliser les connaissances en SHS :
<br/>
pourquoi, comment, jusqu'où ?
<br/>
<br/>
<em style="color: gray; text-transform: lowercase;">… avec l'ontologie CIDOC-CRM !</em>
</div>

<div>

Thomas Bottini

`thomas.bottini@cnrs.fr`

*‹I›nstitut de ‹Re›cherche en ‹Mus›icologie — IReMus, UMR 8223 CNRS*

</div>

<pre style="color: #16e7cf; font-size: 50% !important;">
https://github.com/Amleth/communications/raw/main/out/2023.02.16_formation_so/index.pdf
</pre>

<!--📜-->
<!--∫ slide -->

# Plan

<dl>
<dt>✏️</dt>
<dd>La figure du modélisateur/de la modélisatrice dans un projet de SHS « FAIR »</dd>
<dt>🌐</dt>
<dd>Quelques mots sur le Web sémantique comme milieu technique adapté à l'expression et à la diffusion des données de la recherche</dd>
<dt>📚</dt>
<dd>Les fondements de l'ontologie CIDOC-CRM</dd>
<dt>🖼️</dt>
<dd>Cas concrets récurrents</dd>
</dl>

<!--📜-->
<!--∫ slide title -->

# De l'activité de recherche à la donnée

*Comment « l'ingénierie des données » intervient-elle aux différentes étapes d'un projet de recherche en SHS ?*

*Comment bien faire du FAIR ?*

<!--📜-->
<!--∫ slide -->

# Analyser

- Les chercheurs et chercheuses en situation de production de connaissances ont des degrés de réflexivité différents sur leurs pratiques de génération de données informatiques structurées. Le premier rôle de l'ingénieur est alors d'ordre maïeutique :
    - Il faut poser des questions (entretiens d'explicitation), confronter le chercheur ou la chercheuse à des cas limites pour l'amener à mieux comprendre ses objets d'étude, et parfois même ses manières de les questionner.
    - L'ingénieur aide donc à révéler la structure interne des sources et des phénomènes étudiés : une dimension heuristique s'ajoute.


<!--∫ slide -->

# Analyser

- Les chercheurs et chercheuses en situation de production de connaissances ont des degrés de réflexivité différents sur leurs pratiques de génération de données informatiques structurées. Le premier rôle de l'ingénieur est alors d'ordre maïeutique :
    - Il faut poser des questions (entretiens d'explicitation), confronter le chercheur ou la chercheuse à des cas limites pour l'amener à mieux comprendre ses objets d'étude, et parfois même ses manières de les questionner.
    - L'ingénieur aide donc à révéler la structure interne des sources et des phénomènes étudiés : une dimension heuristique s'ajoute.
- En SHS, ces connaissances peuvent résulter d'une activité descriptive (sources) ou interprétative (choses dites à propos des sources).
- Il faut analyser à la fois les objets et les produits de l'activité analytique (quoi ?), ainsi que la situation de cette activité, son contexte socio-technico-épistémologique (qui ? comment ? pourquoi ?).

<!--📜-->
<!--∫ slide -->

# Modéliser

- Quoi ?
    - Les connaissances nouvelles s'incarnant dans des « données scientifiques ».
    - Les sources auxquelles elles se rapportent.
    - Les faits sociaux, les concepts, les objets matériels, les objets sémiotiques… dénotés ou connotés par les sources et/ou observables sur le terrain.
    - Le contexte de production des connaissances (qu'est ce qui fait qu'une donnée est « scientifique » ?).


<!--∫ slide -->

# Modéliser

- Quoi ?
    - Les connaissances nouvelles s'incarnant dans des « données scientifiques ».
    - Les sources auxquelles elles se rapportent.
    - Les faits sociaux, les concepts, les objets matériels, les objets sémiotiques… dénotés ou connotés par les sources et/ou observables sur le terrain.
    - Le contexte de production des connaissances (qu'est ce qui fait qu'une donnée est « scientifique » ?).
- Dès lors, avoir un modèle conceptuel de type ontologique en tête en amont de la phase d'analyse permet d'organiser l'écoute et l'analyse des pratiques de production de connaissances.


<!--∫ slide -->

# Modéliser

- Quoi ?
    - Les connaissances nouvelles s'incarnant dans des « données scientifiques ».
    - Les sources auxquelles elles se rapportent.
    - Les faits sociaux, les concepts, les objets matériels, les objets sémiotiques… dénotés ou connotés par les sources et/ou observables sur le terrain.
    - Le contexte de production des connaissances (qu'est ce qui fait qu'une donnée est « scientifique » ?).
- Dès lors, avoir un modèle conceptuel de type ontologique en tête en amont de la phase d'analyse permet d'organiser l'écoute et l'analyse des pratiques de production de connaissances.
- Modéliser est une situation de travail typique des HN dans laquelle l'ingénierie n'a pas un rôle ancillaire (cf. *supra* fonction heuristique/épistémologique). En définissant formellement les objets convoqués par la recherche, l'ingénieur•e participe à leur constitution.

<!--📜-->
<!--∫ slide -->

# Générer, gérer & diffuser

Les challenges techniques sont de taille :

- Pour la saisie, l'idéal est de mettre en place des interfaces de saisie ergonomiques…
- …mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives (les données qu'elles modélisent se donnent sous la forme de graphes ouverts), mais pas instrumentées pour l'édition directe par des humains par rapport aux données relationnelles SQL, de nature plus « tabulaire » et qui s'éditent naturellement avec des formulaires.


<!--∫ slide -->

# Générer, gérer & diffuser

Les challenges techniques sont de taille :

- Pour la saisie, l'idéal est de mettre en place des interfaces de saisie ergonomiques…
- …mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives (les données qu'elles modélisent se donnent sous la forme de graphes ouverts), mais pas instrumentées pour l'édition directe par des humains par rapport aux données relationnelles SQL, de nature plus « tabulaire » et qui s'éditent naturellement avec des formulaires.
- Reprendre les données existantes, les rendre conformes à l'ontologie retenue.


<!--∫ slide -->

# Générer, gérer & diffuser

Les challenges techniques sont de taille :

- Pour la saisie, l'idéal est de mettre en place des interfaces de saisie ergonomiques…
- …mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives (les données qu'elles modélisent se donnent sous la forme de graphes ouverts), mais pas instrumentées pour l'édition directe par des humains par rapport aux données relationnelles SQL, de nature plus « tabulaire » et qui s'éditent naturellement avec des formulaires.
- Reprendre les données existantes, les rendre conformes à l'ontologie retenue.
- Créer un accès pour les machines (API, SPARQL endpoint).


<!--∫ slide -->

# Générer, gérer & diffuser

Les challenges techniques sont de taille :

- Pour la saisie, l'idéal est de mettre en place des interfaces de saisie ergonomiques…
- …mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives (les données qu'elles modélisent se donnent sous la forme de graphes ouverts), mais pas instrumentées pour l'édition directe par des humains par rapport aux données relationnelles SQL, de nature plus « tabulaire » et qui s'éditent naturellement avec des formulaires.
- Reprendre les données existantes, les rendre conformes à l'ontologie retenue.
- Créer un accès pour les machines (API, SPARQL endpoint).
- Définir une politique pour la publication des données représentant des concepts ou des termes dans des vocabulaires contrôlés/thésauri et des données représentant des entités.


<!--∫ slide -->

# Générer, gérer & diffuser

Les challenges techniques sont de taille :

- Pour la saisie, l'idéal est de mettre en place des interfaces de saisie ergonomiques…
- …mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives (les données qu'elles modélisent se donnent sous la forme de graphes ouverts), mais pas instrumentées pour l'édition directe par des humains par rapport aux données relationnelles SQL, de nature plus « tabulaire » et qui s'éditent naturellement avec des formulaires.
- Reprendre les données existantes, les rendre conformes à l'ontologie retenue.
- Créer un accès pour les machines (API, SPARQL endpoint).
- Définir une politique pour la publication des données représentant des concepts ou des termes dans des vocabulaires contrôlés/thésauri et des données représentant des entités.
- Créer des interfaces de consultation pour les humains (sites Web).

<!--📜-->
<!--∫ slide title -->

# Vocabulaire de base

<!--📜-->
<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.


<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.
- Chaque donnée est identifiée par une URL.


<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.
- Chaque donnée est identifiée par une URL.
- Toute information s'exprime sous la forme d'un triplet (sujet/prédicat/objet) dans un langage de description, le RDF.


<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.
- Chaque donnée est identifiée par une URL.
- Toute information s'exprime sous la forme d'un triplet (sujet/prédicat/objet) dans un langage de description, le RDF.
- La connexion de ces triplets RDF forme un graphe.


<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.
- Chaque donnée est identifiée par une URL.
- Toute information s'exprime sous la forme d'un triplet (sujet/prédicat/objet) dans un langage de description, le RDF.
- La connexion de ces triplets RDF forme un graphe.
- Chaque prédicat est également identifié par une URL.

<img style="display: block; margin: 0 auto; width: 15cm;" src="dotfile_fd6722af-2ae4-4abf-a011-883dbe4b30db.png" />



<!--∫ slide -->

# Le Web sémantique, en une slide

- Promesse d'une base de données à l'échelle du Web. Le Web initial (Tim Berners Lee, 1991) était un Web de documents liés (hypertexte), le Web sémantique est une Web de données liées.
- Chaque donnée est identifiée par une URL.
- Toute information s'exprime sous la forme d'un triplet (sujet/prédicat/objet) dans un langage de description, le RDF.
- La connexion de ces triplets RDF forme un graphe.
- Chaque prédicat est également identifié par une URL.

<img style="display: block; margin: 0 auto; width: 15cm;" src="dotfile_fd6722af-2ae4-4abf-a011-883dbe4b30db.png" />

- C'est le milieu technique idéal pour des données FAIR.

<!--📜-->
<!--∫ slide center -->

# Données relationnelles vs graphe RDF

<img src="corago.png"/>

*Corago in LOD - Seminar by Angelo Pompilio and Paolo Bonora, Digital Humanities and Digital Knowledge, Università di Bologna, 2017.*

<!--📜-->
<!--∫ slide -->

# Qu'est ce qu'une ontologie ?

- Formalisation d'un modèle conceptuel pour un domaine identifié proposant des :
    - ‹Classes :› types d'entités peuplant le domaine, possiblement organisées selon des relations d'héritage (spécificité). On appelle ‹individu› une ressource qui est du type d'une classe.
    - ‹Propriétés :› aspects, caractéristiques, attributs possibles de ces classes, qui peuvent soit pointer vers une valeur, soit vers un individu.
- Utiliser les classes et les propriétés d'une ontologie confère ainsi une sémantique partagée aux données RDF (les individus identifiés par des URL seront des sujets ou des objets, les propriétés des classes seront des prédicats).
- Vous connaissez peut-être déjà une ontologie : SKOS (pour construire des thésauri).

<!--📜-->
<!--∫ slide title -->

# Le CIDOC-CRM

<!--📜-->
<!--∫ slide -->

# Le CIDOC-CRM en bref

- Le CIDOC-CRM est une ontologie qui documente le patrimoine matériel et immatériel ainsi que les processus de production de connaissances à son propos.
- [https://www.cidoc-crm.org/](https://www.cidoc-crm.org/)
- Venant du monde des musées, elle est désormais utilisée dans tous les domaines des HN.
- Elle est extrêmement abstraite et générique.
- Ontologie centrée événement (nous y reviendrons dans les exemples…)
- Classes et propriétés : [https://cidoc-crm.org/html/cidoc_crm_v7.1.2.html](https://cidoc-crm.org/html/cidoc_crm_v7.1.2.html)

<!--📜-->
<!--∫ slide center -->

# Hiérarchie des classes

<img src="cidoc-crm.jpg" style="margin-top: -1cm; width: 26cm;"/>

<!--📜-->
<!--∫ slide center -->

# Le temps dans le CRM

<img src="time.png" style="width: 26cm;"/>

<!--📜-->
<!--∫ slide title -->

# Cas concrets récurrents

<!--📜-->
<!--∫ slide -->

# Conventions

Dans les exemples, on utilisera les préfixes suivants pour les URL :

```
PREFIX crm: <http://www.cidoc-crm.org/cidoc-crm/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX su:  <http://www.sorbonne-universite.fr/id/>
```

Ainsi, l'URL :

```
http://www.sorbonne-universite.fr/id/tralala
```

sera notée :

```
su:tralala
```

…ce qui évitera d'avoir des exemples illisibles, mais il ne faudra pas perdre de vue que toute ressource (en incluant les classes et les propriétés du CRM) est identifiée par une URI sur le Web.

<!--📜-->
<!--∫ slide spring -->

- ‹Typer une personne :›

<img style="display: block; margin: 0 auto; width: 11cm;" src="dotfile_c41adbad-b0e3-435b-87fc-a896101ee1c0.png" />
<hr/>
- ‹Nommer une personne avec une simple chaîne de caractère :›

<img style="display: block; margin: 0 auto; width: 18cm;" src="dotfile_885a06dd-c214-440d-a160-f8989633c7ac.png" />

<!--📜-->
<!--∫ slide -->

- ‹Nommer une personne avec une entité appellation :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_b6e43a33-4848-4b9b-9787-821f92367822.png" />

<!--📜-->
<!--∫ slide -->

- ‹Typer quelque chose :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_97bb6c65-2967-4d6b-a88f-967676758661.png" />


<!--∫ slide -->

- ‹Typer quelque chose :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_97bb6c65-2967-4d6b-a88f-967676758661.png" />
<div style="position: absolute ; bottom: 1cm; left: 1cm; z-index: 999; width: 18cm;">
💡
<br/>

- `rdf:type` : pour donner à votre entité un type technique au sein de l'ontologie CRM.
- `crm:P2_has_type` : pour donner à votre entité un type métier (défini par vous et en rapport avec les catégories convoquées par l'activité de recherche).
</div>

<!--📜-->
<!--∫ slide -->

- ‹Typer un identifiant :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_34018359-12a6-4285-ab69-4605efba25bd.png" />

<!--📜-->
<!--∫ slide -->

- ‹Organisation interne d'un contenu (ici, d'une image) :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_c7806580-5e89-40cf-a19c-c5d231e92a5a.png" />

<!--📜-->
<!--∫ slide -->

- ‹Dater un événement :›
<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_58d222c0-1d75-4048-9eba-436938714889.png" />

On retrouve la possibilité de définir des incertitudes aux bornes.

<!--📜-->
<!--∫ slide -->

- ‹Exprimer un événement de création simple :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_5b5cd603-3239-44be-b1a4-af2ac7a6eca8.png" />

<!--📜-->
<!--∫ slide -->

- ‹Exprimer un événement de création complexe :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_6e389e22-9194-42fd-8f68-a1fe21551a7d.png" />


<!--∫ slide -->

- ‹Exprimer un événement de création complexe :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_6e389e22-9194-42fd-8f68-a1fe21551a7d.png" />
<div style="position: absolute; bottom: 2cm; right: 1cm; width: 9cm; z-index: 666;">
Remarquez la finesse de l'adressage…<br/>Chaque élément constituant le phénomène a son URL et son identité.
</div>

<!--📜-->
<!--∫ slide -->

- ‹Exprimer une annotation :›

<img style="display: block; margin: 0 auto; width: 26cm;" src="dotfile_0fec83fd-be27-4620-baca-b35ac7b14dfc.png" />