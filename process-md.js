const fs = require('fs')
const _ = require('lodash')
const readline = require('readline')
const colorbrewer = require('colorbrewer');

const VARIABLE_DECLARATION_PATTERN = /(<!--∫ (\$[a-zA-Z0-9_-]+)=(.*) -->)/
const VARIABLE_USE_PATTERN = /(<!--∫ (\$[a-zA-Z0-9_-]+) -->)/
const NEW_SLIDE_PATTERN = /<!--∫ slide (.*)-->/
const SLIDEOVERLAY_PATTERN = /∫[🦔🐌🐢]|•••|§§§/
const DOT = /```dot ([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12})\s*([0-9]{0,3})/

const IN_FILE = process.argv[2]
const OUT_FILE = process.argv[3]

const VARIABLES = {}

function makeGraph(dotContent, id, width) {
  if (!width) width = 29.7
  dotContent = `digraph {
    graph [bgcolor=black]
    rankdir=LR
    node [color=white,fontcolor=white,fontname="FiraCode Nerd Font Mono Regular",shape=box]
    edge [color=white,fontcolor=white,fontname="FiraCode Nerd Font Mono Regular"]
    \n
    ` + dotContent + '\n}\n'
  const dotFile = `dotfile_${id}.dot`
  const pngFile = dotFile.replace('.dot', '') + '.png'
  fs.writeFileSync(dotFile, dotContent, 'utf8')

  return `<img style="display: block; margin: 0 auto; width: ${width}cm;" src="` + pngFile + `" />`
}

const rl = readline.createInterface({
  input: fs.createReadStream(IN_FILE),
  crlfDelay: Infinity
})

const lines = []
let currentSlideLines = []

let slideNumber = 0
let pageNumber = 0

let currentDot = []
let currentDotId = -1
let inDot = false

rl.on('line', line => {
  if (/^ +\</.test(line)) {
    line = line.trim()
  }

  const variableDeclaration = line.match(VARIABLE_DECLARATION_PATTERN)
  if (variableDeclaration) {
    VARIABLES[variableDeclaration[2]] = variableDeclaration[3]
    return
  }

  const variableUse = line.match(VARIABLE_USE_PATTERN)
  if (variableUse) {
    line = line.replace(variableUse[1], VARIABLES[variableUse[2]])
    lines.push(line)
    return
  }

  const newSlideMatch = line.match(NEW_SLIDE_PATTERN)
  if (newSlideMatch) {
    slideNumber++
    pageNumber++
    lines.push('<!--📜-->')
    lines.push(line)
    currentSlideLines = []
    currentSlideLines.push(line)

    return
  }

  const overlaySlideMatch = line.match(SLIDEOVERLAY_PATTERN)
  if (overlaySlideMatch) {
    pageNumber++
    lines.push('\n')
    currentSlideLines.map(_ => lines.push(_))
    return
  }

  const dotMatch = line.match(DOT)
  if (dotMatch) {
    currentDotId = dotMatch[1]
    currentDotWidth = parseInt(dotMatch[2])
    inDot = true
    return
  }

  if (inDot && line === '```') {
    inDot = false
    const g = makeGraph(currentDot.join('\n'), currentDotId, currentDotWidth)
    lines.push(g)
    currentDot = []
    currentDotId = -1
    currentSlideLines.push(g)
    return
  }

  if (inDot) {
    if (line.match(/\$RC\$/)) {
      const randomColor = _.sample(_.sample(Object.values(colorbrewer[_.sample(colorbrewer.schemeGroups.qualitative)])))
      line = line.replace('$RC$', `color="${randomColor}",fontcolor="${randomColor}"`)
    }
    currentDot.push(line)
  }
  else {
    lines.push(line)
    currentSlideLines.push(line)
  }
})

rl.on('close', () => {
  fs.writeFileSync(OUT_FILE, lines.join('\n'), 'utf8')
})
