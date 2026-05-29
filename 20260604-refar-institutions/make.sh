rm refar-institutions.svg
rm refar-institutions.png

d2 --layout tala \
   refar-institutions.d2 refar-institutions.svg

sed -i '' 's/UNLICENSED COPY//g' refar-institutions.svg

rsvg-convert refar-institutions.svg > refar-institutions.png