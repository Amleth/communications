for dir in */
do
    cd $dir
    pwd
    typst compile $dir/main.typ
    cd ..
done

plantuml **/*.puml

git add --all ; git commit -m "🌲" ; git push origin