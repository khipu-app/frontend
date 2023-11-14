# Основной скрипт для генерации файлов шрифтов
GENERATE_FONT() {
  if $FIRST; then
    rm -f "$OUTPUTPATH/../index.css"
    FIRST=false
  fi
  for i in "${!SUBSETNAMES[@]}"; do
    for j in "${!FORMATS[@]}"; do
      for k in "${!FILENAMES[@]}"; do
        INPUT="$INPUTPATH/${FILENAMES[k]}-subset.${FORMATS[j]}"
        OUTPUT="$OUTPUTPATH/${FILENAMES[k]}-${SUBSETNAMES[i]}.${FORMATS[j]}"
        FONT_FAMILY="s/src/font\-family:\ ${FILENAMES[k]//\-*/};\n\ \ src/"
        FONT_STYLE="s/}/\ \ font-style: Regular;\n\ \ font-weight: ${FILENAMES[k]//*\-/};\n\ \ font-display: fallback;\n}/"
        REPLACE="s!${INPUT//\.\/service/service}!${OUTPUT//\.\/src\/assets/\/assets}!"
        echo "----------------\n$INPUT -> $OUTPUT\n----------------\n"
        docker run --rm -v "$(pwd):/app" raeffs/glyphhanger --whitelist="${SUBSETCODES[i]}" --formats="${FORMATS[j]}" --subset="$INPUTPATH/${FILENAMES[k]}.$EXTENSION" --css
        mkdir -p "$OUTPUTPATH"
        mv $INPUT $OUTPUT
        echo $REPLACE
        cat "${INPUTPATH//\.\//}/${FILENAMES[k]}.css" | sed "$REPLACE" | sed s/file/record/ | sed "$FONT_FAMILY" | sed -e "${FONT_STYLE//\:\ Regular/\:\ normal}" | sed s/\:\ Bold/\:\ bold/ | sed s/\:\ Medium/\:\ medium/ >> "$OUTPUTPATH/../index.css"
        echo "\n\n" >> "$OUTPUTPATH/../index.css"
        rm "$INPUTPATH/${FILENAMES[k]}.css"
      done
    done
  done
}

FIRST=true

# Глобальные переменные
# Набор названий для сабсетов
SUBSETNAMES=("Latin" "LatinSupplement" "LatinExtendedA" "LatinExtendedB" "GreekCoptic" "Cyrilic" "CyrilicSupplement")

# Набор диапазонов кодов глифов для каждого из сабсетов
SUBSETCODES=("0000−007F" "0080−00FF" "0100−017F" "0180−024F" "0370−03FF" "0400−04FF" "0500−052F")
FORMATS=("woff" "woff2")

# Набор значений переменных для шрифта FiraSans
FILENAMES=("FiraSans-Bold" "FiraSans-Medium" "FiraSans-Regular")
EXTENSION="ttf"
INPUTPATH="./service/fonts/Fira_Sans"
OUTPUTPATH="./src/assets/fonts/Fira-Sans"
GENERATE_FONT

# Набор значений переменных для шрифта FiraMono
FILENAMES=("FiraMono-Medium" "FiraMono-Regular")
EXTENSION="ttf"
INPUTPATH="./service/fonts/Fira_Mono"
OUTPUTPATH="./src/assets/fonts/Fira-Mono"
GENERATE_FONT