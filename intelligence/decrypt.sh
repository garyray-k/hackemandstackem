ciphers=( aes-128-cbc aes-128-ecb aes-192-cbc aes-192-ecb aes-256-cbc aes-256-ecb )

for cipher in "${ciphers[@]}"; do
    openssl enc -$cipher -d -in looks.ciphertext -k "Looks" >> filedecrypt.txt 2> /dev/null
done 