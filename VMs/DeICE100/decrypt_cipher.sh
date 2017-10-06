#/bin/bash

CIPHER_LIST=openssl list-cipher-commands

for cipher in $CIPHER_LIST; do
openssl end -d -${cipher} -in $1 -pass pass:$2 > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
echo "Cipher used was $cipher. unencrypting $1"
openssl enc -d -${cipher} -in $1 -out $3 -pass pass:$2
exit
fi
done
