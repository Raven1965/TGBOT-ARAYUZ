#!/bin/bash
clear
bash banner.sh
echo
echo
echo
#read -e -p $'\e[31m───────[ \e[97mToken\e[31m ]───────►  \e[0m' token
token1=$(cat config.txt)
curl -s https://api.telegram.org/bot$token1/getUpdates | grep id |awk -F '"' '{print $9}' | tr -d : | tr -d , | jq >> idler.txt

awk -F "[, ]" '{ for(i=1;i<=NF;i++) if (!a[$i]++ && $i != "") print $i }' idler.txt >> idler2.txt


echo
id=$(cat idler2.txt)
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mKALIN\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mKOD\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[32mNORMAL\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSeç\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesaj\e[31m ]───────►  \e[0m' mesaj1
	for i in $id ;do
		
		curl  -d chat_id=$i -d  parse_mode=HTML -d text="<b>$mesaj1</b>" https://api.telegram.org/bot$token1/sendMessage
	done

	rm idler.txt
	rm idler2.txt
elif [[ $secim == 2 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesajın\e[31m ]───────►  \e[0m' mesaj2
	for i in $id ;do

		curl -d chat_id=$i -d  parse_mode=HTML -d text="<code>$mesaj2</code>" https://api.telegram.org/bot$token1/sendMessage
	done
	rm idler.txt
	rm idler2.txt

elif [[ $secim == 3 ]];then
	read -e -p $'\e[31m───────[ \e[97mMesajın\e[31m ]───────►  \e[0m' mesaj3
	for i in $id ;do
		curl -d chat_id=$i -d text="$mesaj3" https://api.telegram.org/bot$token1/sendMessage
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
