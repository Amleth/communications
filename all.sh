for dir in */
do
    cd $dir
    typst compile main.typ
    cd ..
done

plantuml **/*.puml

git add --all ; git commit -m "🌲" ; git push origin