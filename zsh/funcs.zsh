#Bioinformatics
splitfas() {
    entrynum=`nfas $1 | wc -m`
    let "entrynum = $entrynum -1"
    csplit -z -s -f $1 --digits=$entrynum $1 '/>/' '{*}'
}
singfas() {
    tr -d "\15\32" < $1 | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' | tail -n +2
}
