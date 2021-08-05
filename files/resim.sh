#!bin/bash
clear
bash banner.sh
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mTOKEN GİRİNİZ\e[31m ]───────►  \e[0m' token

curl -s https://api.telegram.org/bot$token/getUpdates | grep id |awk -F '"' '{print $9}' | tr -d : | tr -d , | jq >> idler3.txt

awk -F "[, ]" '{ for(i=1;i<=NF;i++) if (!a[$i]++ && $i != "") print $i }' idler3.txt >> idler4.txt
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mRESİM BAŞLIĞI (İSTEMİYORSAN BOŞ BIRAK)\e[31m ]───────►  \e[0m' basliq
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mRESİM KONUMU GİRİNİZ\e[31m ]───────►  \e[0m' konum

id=$(cat idler4.txt)
for i in $id ; do
	curl -s -X POST --silent -o /dev/null https://api.telegram.org/bot$token/sendphoto -F chat_id=$i -F caption=$basliq -F photo=@$konum
done
echo
echo
echo
printf "[!]\e[31mRESİM GÖNDERİLDİ"
echo
echo
echo
rm idler3.txt
rm idler4.txt

#https://api.telegram.org/<token>/sendphoto -F chat_id=11112222333 -F photo=@$konum
