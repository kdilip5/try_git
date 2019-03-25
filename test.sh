#!/bin/bash
#To get the certificate file
find . -name "*.cert" -o -name '*.pki' -o -name '*.jks' >> cert_file_path.txt
filename="cert_file_path.txt"
#While loop to read line by line
while read -r line
do
readLine=$line
#If the line starts with ST then echo the line
if [[ $readLine == .cert* ]] ; then
echo "$readLine"
read line
readLine=$line
openssl x509 -enddate -noout -in $readLine
if [[ $readLine = ubuntu* ]] ; then
echo "$readLine"
fi
fi
done < "$filename"




#!/bin/bash 
gracedays=14
    data= openssl x509 -noout -enddate -in /etc/ssl/59441238_www.example.com.cert | sed -e 's#notAfter=##'
    echo "$data"
    ssldate= date -d "${data}" '+%s'
    echo "$ssldate"
    nowdate= date '+%s'
    echo "$nowdate"
    diff= [ "$ssldate"-"$nowdate" ]
    echo $diff
    if test ${diff} -lt $((${gracedays}*24*3600));
    then
        if test ${diff} -lt 0;
        then
            echo The certificate for ${server} has already expired
        else
            echo The certificate for ${server} will expire in $((${diff}/3600/24)) days
        fi
    fi


