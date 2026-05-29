for dir in */
do
    cd $dir
    pwd
    rm main.pdf
    typst compile main.typ
    plantuml *.puml
    cd ..
done

git add --all ; git commit -m "🌲" ; git push origin