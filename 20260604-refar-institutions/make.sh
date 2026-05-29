rm refar-institutions.svg
rm refar-institutions.png

d2 --layout tala \
    --font-regular=../fonts/jetbrainsmono/JetBrainsMono-ExtraLight.ttf \
    --font-italic=../fonts/jetbrainsmono/JetBrainsMono-ExtraLight.ttf \
    --font-bold=../fonts/jetbrainsmono/JetBrainsMono-ExtraLight.ttf \
    --font-semibold=../fonts/jetbrainsmono/JetBrainsMono-ExtraLight.ttf \
   refar-institutions.d2 refar-institutions.svg

sed -i '' 's/UNLICENSED COPY//g' refar-institutions.svg

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --screenshot=refar-institutions.png --force-device-scale-factor=20 refar-institutions.svg