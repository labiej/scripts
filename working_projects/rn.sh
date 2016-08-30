# Rename all *.txt to *.text
for f in *.JPG; do 
mv -- "$f" "${f%.JPG}.jpg"
done
