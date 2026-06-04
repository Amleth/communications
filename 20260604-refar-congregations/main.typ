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
      columns: (auto, auto),
      inset: 0.5cm,
      rows: (auto, 1fr, auto),
      stroke: C3,
      grid.cell(align: horizon + left)[
        4 juin 2026
      ],
      grid.cell(align: horizon + right)[
        Tours
      ],
      grid.cell(colspan: 2, align: center + horizon)[
        #text(C2, size: 19pt, weight: "medium")[modéliser les congrégations de l'Ancien Régime avec le CRM]
        #v(3cm)
        #align(center + horizon)[
          #figure(
            image("logo.png", width: 50%),
          )
        ]
      ],
      grid.cell(align: horizon + left)[
        #text(C1)[📡 thomas.bottini\@cnrs.fr] \
        #text(C1)[📡 nathalie.berton-blivet\@cnrs.fr]
      ],
      grid.cell(align: horizon + right)[
        #c[I]nstitut de #c[Re]cherche en #c[Mus]icologie\ #c[IReMus] — UMR 8223
      ],
    )
  ]
]
