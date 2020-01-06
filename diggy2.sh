
#unzip to find urls
filename=$(basename $1 .apk)
unzip=unzip
unzipdir=$unzip"-"$filename
unzip $1 -d $unzipdir
grep -ProI "[\"'\`](https?://|/)[\w\.-/]+[\"'\`]" ./$unzipdir | grep -Po "[\"'\`](https?://|/)[\w\.-/]+[\"'\`]" | sort -u | sed "s/\"//g;s/\'//g">${unzipdir}.txt

#apktool decode to find urls
decode=decode
decodedir=$decode"-"$filename
apktool d $1 -o $decodedir
grep -ProI "[\"'\`](https?://|/)[\w\.-/]+[\"'\`]" ./$decodedir | grep -Po "[\"'\`](https?://|/)[\w\.-/]+[\"'\`]" | sort -u | sed "s/\"//g;s/\'//g">${decodedir}.txt
