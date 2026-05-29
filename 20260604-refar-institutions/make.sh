rm refar-institutions.svg

d2 --layout tala \
   refar-institutions.d2 refar-institutions.svg

sed -i '' 's/UNLICENSED COPY//g' refar-institutions.svg

open refar-institutions.svg