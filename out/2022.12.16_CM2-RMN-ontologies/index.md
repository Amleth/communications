<style>
body { font-family: GoudyNoto; font-weight: 300; }
h1 { letter-spacing: 0.1em; font-family: "FuturaPT" !important; font-weight: 200; text-transform: uppercase; }
code { color: #16e7cf; }
.dim { color: #aaa; }
</style>

<!--∫ slide title -->
<div class="dim">
Consortium Musica<sub>2</sub><br/>
Rencontres de la musicologie numérique, 1<sup>ère</sup> édition, 16/12/2022
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
Le CIDOC–CRM pour capter l'activité critique sur les sources en musicologie
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

<!--∫ slide -->
# Notes

<!--∫ slide c -->
# Plan

1. Contexte scientifique
2. Le CIDOC-CRM : apports & questions

<!--∫ slide title -->
# 1. Contexte scientifique

<!--∫ slide -->
# Le projet SHERLOCK

- Émergence Sorbonne Université 2019-2022. Projet d'ingénierie-recherche.
•••
- Objectif : développer un écosystème d'outils facilitant la production de savoirs sur des sources reposant sur CIDOC-CRM.
•••
- Aspects :
    - Modéliser la structure de sources textuelles, musicales et iconographiques complexes en vue de les rendre adressables sur le Web.
    - Mettre en œuvre des outils de saisie de l'information ergonomiques et écrire des scripts de conversion en données sémantiques.
    - Formaliser des patterns d'utilisation du CIDOC-CRM pour représenter l'activité critique sur des sources complexes (, modèle d'annotation).
    - Développer des outils Web pour annoter collaborativement les sources et publier les données.
•••
- *‹S›ocial sciences & ‹H›umanities corpora ‹E›xploration and active ‹R›eading with ‹L›inked, ‹O›pen & ‹C›ontributive ‹K›nowledge organisation systems*

<!--∫ slide -->
# Applications présentes et futures à l'IReMus

- modality-tonality (analyse musicale, cf. hier)
- référentiel des personnes, toponymes, congrégations et institutions de l'Ancien Régime
- édition critique TEI du Mercure Galant
- analyse des estampes du Mercure Galant (histoire de l'art)
- base Euterpe d'iconographie musicale
- bibliothèque de partitions
- catalogue de livrets de motets pour la Chapelle Royale (1666—1792)
- étudiant•e•s du conservatoire 1795-1914 (HEMEF)
- …

<!-- Étudier en profondeur l'ontologie CIDOC-CRM et ses dérivées (comme LRMoo) dans une perspective de recherche (exprimer une activité analytique/critique/herméneutique complexe et collaborative sur des sources textuelles, musicales et iconographiques complexes), au-delà du simple fichage d'entités patrimoniales qui constituait son contexte initial. Dégager des patterns d'utilisation de cette ontologie générique utiles aux différentes branches de la musicologie.
Modéliser avec le CIDOC-CRM plusieurs projets pilotes de l'IReMus. Convoquer cette ontologie dans chaque projet passé, présent et à venir pour faire du LOD de qualité pour la musicologie.
Construire une infrastructure de saisie, annotation et publication des données musicologiques reposant sur des données sémantiques. (TONALITIES est l'application des réflexions méthodologiques et techniques de SHERLOCK à la question de l'annotation sémantique collaborative de partitions MEI.) -->

<!--
Marottes :
- adressabilité des sources
- de quoi on parle
- comment on en parle
-->

<!--∫ slide c -->
<!-- ```dot 6cad9af2-47b9-4279-b567-de46c45f8884 26
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
``` -->