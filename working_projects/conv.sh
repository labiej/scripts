# Rename all *.txt to *.text
for f in *.jpg; do 
convert ./"$f" ./"${f%.jpg}.png"
done
