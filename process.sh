# Présentation
PREZDIR=$(pwd)
PREZID=$(basename "$PREZDIR")
PREZFILE="$PREZDIR"/index.md

# Dossier de sortie
cd ../..
HOMEDIR=$(pwd)
OUTDIR="$HOMEDIR/out/$PREZID"
rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"
cp "$PREZFILE" "$OUTDIR"

# Go (MD -> MD processé -> HTML -> XML -> PDF)
cd "$OUTDIR"
node "$HOMEDIR"/process-md.js index.md index.temp.md
pandoc -c ../../pandoc.css -s index.temp.md -o index.temp.html --metadata pagetitle="$PREZID"
node "$HOMEDIR"/process-xml.js index.temp.html index.xml $1 $2
for i in *.dot; do
    [ -f "$i" ] || break
    dot -Tpng -Gdpi=300 $i -o "${i%.*}".png
done
prince -s ../../style.css index.xml

# Qu'avons-nous produit ?
# PDF="$OUTDIR"/"$PREZID".pdf
# cp "$OUTDIR"/index.pdf "$PDF"
exa -lHa "$OUTDIR"
open "$OUTDIR"/index.pdf