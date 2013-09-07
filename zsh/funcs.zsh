#Bioinformatics
splitfas() {
    entrynum=`nfas $1 | wc -m`
    let "entrynum = $entrynum -1"
    csplit -z -s -f $1 --digits=$entrynum $1 '/>/' '{*}'
}
