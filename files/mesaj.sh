#!/bin/bash
clear
bash banner.sh
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mToken\e[31m ]───────►  \e[0m' token
curl -s https://api.telegram.org/bot$token/getUpdates | grep id |awk -F '"' '{print $9}' | tr -d : | tr -d , | jq >> idler.txt

awk -F "[, ]" '{ for(i=1;i<=NF;i++) if (!a[$i]++ && $i != "") print $i }' idler.txt >> idler2.txt

#read -e -p $'\e[31m───────[ \e[97mToken\e[31m ]───────►  \e[0m' token
echo
id=$(cat idler2.txt)
printf "
\e[31m1) Kalın
\e[31m2) Kod
\e[31m3) Normal
"
read -e -p $'\e[31m───────[ \e[97mSeç\e[31m ]───────►  \e[0m' secim
if [[ $secim == 1 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesaj\e[31m ]───────►  \e[0m' mesaj1
	for i in $id ;do
		
		curl -d chat_id=$i -d  parse_mode=HTML -d text="<b>$mesaj1</b>" https://api.telegram.org/bot$token/sendMessage
	done

	rm idler.txt
	rm idler2.txt
elif [[ $secim == 2 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesajın\e[31m ]───────►  \e[0m' mesaj2
	for i in $id ;do

		curl -d chat_id=$i -d  parse_mode=HTML -d text="<code>$mesaj2</code>" https://api.telegram.org/bot$token/sendMessage
	done
	rm idler.txt
	rm idler2.txt

elif [[ $secim == 3 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesajın\e[31m ]───────►  \e[0m' mesaj3
	for i in $id ;do
		curl -d chat_id=$i -d text="$mesaj3" https://api.telegram.org/bot$token/sendMessage
	done
	rm idler.txt
	rm idler2.txt

else
	exit
fi	


#for i in $id ;do


#	curl -d chat_id=$i -d text="$mesaj" https://api.telegram.org/bot$token/sendMessage
#done

#rm idler.txt
#rm idler2.txt
