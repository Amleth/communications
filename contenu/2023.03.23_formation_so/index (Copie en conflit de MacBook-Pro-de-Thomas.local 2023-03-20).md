<style>
body { font-family: GoudyNoto; font-weight: 300; }
h1 { letter-spacing: 0.1em; font-family: "FuturaPT" !important; font-weight: 200; text-transform: uppercase; }
code { color: #16e7cf; }
.dim { color: #aaa; }
</style>

<!--∫ slide title -->

<div class="dim">
Formations autour de la diffusion de la recherche et de la science ouverte
<br/>
Les humanités numériques en pratique
<br/>
23 mars 2023
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

<!--∫ slide -->

# Plan

<dl>
<dt>✏️</dt>
<dd>Le rôle du modélisateur/de la modélisatrice dans un projet de SHS</dd>
<dt>📚</dt>
<dd>Les fondements de l'ontologie CIDOC-CRM</dd>
<dt>🖼️</dt>
<dd>Étude de cas de modélisation récurrents</dd>
<dt>🌐</dt>
<dd>Quelques mots sur le Web sémantique comme milieu technique adapté à l'expression et à la diffusion des données de la recherche</dd>
</dl>

<!--∫ slide -->

# Modéliser ?

- Modèle conceptuel vs. ontologie ?
- Entités + propriétés.

<!--∫ slide title -->

# De l'activité de recherche à la donnée

Comment « l'ingénierie des données » intervient-elle aux différentes étapes d'un projet de recherche en SHS :

<!--∫ slide -->

# Écouter

- Les chercheur·se·s en situation de production de connaissances susceptibles d'êtres traduites en données informatiques structurées ont sur ce point des degrés de réflexivité différents. Le premier rôle de l'ingénieur est d'ordre maïeutique.
- En SHS, ces connaissances peuvent résulter d'une activité descriptive (sources) ou interprétative (choses dites à propos des sources).
- Dès lors, avoir un modèle conceptuel de type ontologique permet d'organiser l'écoute et l'analyse des pratiques de production de connaissances.

<!--∫ slide -->

# Accompagner

- L'ingénieur devient de facto un collaborateur méthodologique :
- Il aide à révéler la structure interne des sources et des phénomènes par lesquels est appréhendé l'objet de recherche (dimension maïeutique + heuristique).
- L'idéal est de mettre en place des interfaces de saisie ergonomiques, mais c'est là où « le bât blesse » : les ontologies sont souples, riches, expressives, mais pas instrumentées pour les humains (formulaires...) par rapport aux données relationnelles SQL.
- Dans l'expression des objectifs scientifiques. Révéler la structure des observables et des connaissances produites à leur endroit permet de repenser les finalités scientifiques.
- C'est une situation de travail typique des HN dans laquelle la technique n'a pas un rôle ancillaire.

<!--∫ slide -->

# Modéliser

- Les connaissances nouvelles s'incarnant dans des « données scientifiques ».
- Les sources auxquelles elles se rapportent.
- Les faits sociaux, conceptuels, matériels & sémiotiques dénotés ou conotés par les sources et/ou observables sur le terrain.
- Le contexte de production des connaissances (qu'est ce qui fait qu'une donnée est « scientifique » ?).
- C'est l'objet de cette formation !

<!--∫ slide -->

# Générer, gérer & diffuser

- Reprendre les données existantes, les rendre conformes à l'ontologie retenue.
- Accès par les machines (API, SPARQL Endpoint).
- Consultation par les humains (sites Web).

<!--∫ slide title -->

# Étude de cas de modélisation récurrents

<!--∫ slide -->

# Nommer des choses

