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
cp "$PREZDIR"/*.{jpeg,jpg,png} "$OUTDIR" 2>/dev/null

# Go (MD -> MD processé -> HTML -> XML -> PDF)
cd "$OUTDIR"
node "$HOMEDIR"/process-md.js index.md index.temp.md
pandoc -c ../../style.css -s index.temp.md -o index.temp.html --metadata pagetitle="$PREZID" --wrap=none
node "$HOMEDIR"/process-xml.js index.temp.html index.xml $1 $2
node "$HOMEDIR"/process-xml.js index.temp.html index.html $1 $2

for i in *.dot; do
    [ -f "$i" ] || break
    dot -Tpng -Gdpi=300 $i -o "${i%.*}".png
    dot -Tsvg $i -o "${i%.*}".svg
done

xmllint --format index.xml > index_f.xml
mv index_f.xml index.xml
prince -s ../../style.css index.xml

# Qu'avons-nous produit ?
cp "$OUTDIR/index.pdf" "$OUTDIR/$PREZID.pdf"
open "$OUTDIR/index.pdf"