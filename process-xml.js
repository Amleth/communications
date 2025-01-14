const IN_FILE = process.argv[2]
const OUT_FILE = process.argv[3]
const CURRENT_PAGE_SYMBOL = process.argv[4]
const PAGE_SYMBOL = process.argv[5]

////////////////////////////////////////////////////////////////////////////////

const fs = require('fs')
const readline = require('readline')

const content = fs.readFileSync(IN_FILE, 'utf8')
const numberOfPages = (content.match(/<!--📜-->/g) || []).length

const lines = []

const rl = readline.createInterface({
  input: fs.createReadStream(IN_FILE),
  crlfDelay: Infinity
})

let page = 0
let sameSlide = false
let weHaveASlideContentToClose = false

const makePagination = (p) => {
  if (p == 1) return ""
  return `<div class="pagination">${PAGE_SYMBOL.repeat(p - 1)}${CURRENT_PAGE_SYMBOL}${PAGE_SYMBOL.repeat(numberOfPages - p)}</div>`
}

rl.on('line', line => {
  // Page number
  if (line.match(/<!--📜-->/)) {
    page++
    sameSlide = false
    return
  }

  // Replacements
  line = line.replace(/‹‹/g, '<span class="bibref">')
  line = line.replace(/››/g, '</span>')
  line = line.replace(/‹/g, '<span class="colour">')
  line = line.replace(/›/g, '</span>')

  // <!--∫ … -->
  const newSlideMatch = line.match(/<!--∫(.*)-->/)
  if (newSlideMatch) {
    line = ''

    if (page != 1) {
      line += makePagination(sameSlide ? page : page - 1)
      line += '</div>'
      if (weHaveASlideContentToClose) {
        lines.push('</div>')
        weHaveASlideContentToClose = false
      }
    }

    sameSlide = true

    const classes = newSlideMatch[1]
      .trim()
      .split(' ')
      .map(_ => (_ === 's' ? 'slide' : _))

    line += `<div class="${classes.join(' ')}">`

    lines.push(line)
    return
  }

  // </body>
  if (line == '</body>') {
    if (weHaveASlideContentToClose) {
      lines.push('</div>')
    }
    lines.push(makePagination(page) + '</div>' + line)
    return
  }

  lines.push(line)

  // heading
  if (/^<h1/.test(line) || /^<h2/.test(line)) {
    lines.push('<div class="content">')
    weHaveASlideContentToClose = true
  }
})

rl.on('close', () => {
  fs.writeFileSync(OUT_FILE, lines.join('\n'), 'utf8')
})
