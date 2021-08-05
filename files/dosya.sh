#!bin/bash
clear
bash banner.sh
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mTOKEN GİRİNİZ\e[31m ]───────►  \e[0m' token

curl -s https://api.telegram.org/bot$token/getUpdates | grep id |awk -F '"' '{print $9}' | tr -d : | tr -d , | jq >> idler8.txt

awk -F "[, ]" '{ for(i=1;i<=NF;i++) if (!a[$i]++ && $i != "") print $i }' idler8.txt >> idler9.txt
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mDOSYA BAŞLIĞI (İSTEMİYORSAN BOŞ BIRAK)\e[31m ]───────►  \e[0m' basliq
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mDOSYA KONUMU GİRİNİZ\e[31m ]───────►  \e[0m' konum

id=$(cat idler9.txt)
for i in $id ; do
	curl -s -X POST --silent -o /dev/null https://api.telegram.org/bot$token/senddocument -F chat_id=$i -F caption=$basliq -F document=@$konum
done
echo
echo
echo
printf "[!]\e[31mDOSYA GÖNDERİLDİ"
echo
echo
echo
rm idler8.txt
rm idler9.txt

