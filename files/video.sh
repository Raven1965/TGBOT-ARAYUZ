#!bin/bash
clear
bash banner.sh
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mTOKEN GİRİNİZ\e[31m ]───────►  \e[0m' token

curl -s https://api.telegram.org/bot$token/getUpdates | grep id |awk -F '"' '{print $9}' | tr -d : | tr -d , | jq >> idler5.txt

awk -F "[, ]" '{ for(i=1;i<=NF;i++) if (!a[$i]++ && $i != "") print $i }' idler5.txt >> idler6.txt
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mVİDEO BAŞLIĞI (İSTEMİYORSAN BOŞ BIRAK)\e[31m ]───────►  \e[0m' basliq
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mVİDEO KONUMU GİRİNİZ\e[31m ]───────►  \e[0m' konum

id=$(cat idler6.txt)
for i in $id ; do
	curl -s -X POST --silent -o /dev/null https://api.telegram.org/bot$token/sendvideo -F chat_id=$i -F caption=$basliq -F video=@$konum
done
echo
echo
echo
printf "[!]\e[31mVİDEO GÖNDERİLDİ"
echo
echo
echo
rm idler5.txt
rm idler6.txt
