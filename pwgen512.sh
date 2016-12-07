#!/bin/bash

# Was working on formatting
# Don't use this as it is, currently just calculates the checksum of the password, not a valid SHA-512 pw hash.

while read pw hostname; do
#  echo $pw
  hierakey=$(echo "rootpw::"$hostname": >")
  sha512hashed="$(echo -n $pw | sha512sum | cut -d " " -f 1)"
  echo $sha512hashed
  eyamlencrypt=$(eyaml encrypt -s $sha512hashed | awk '{print $2}')
  eyamlencrypt=$(echo $eyamlencrypt | sed -e 's/==] >/==]/g' | sed -e 's/ENC/  ENC/g')
  echo "------ placeholder  ---------"
  echo $hierakey
  echo " "$eyamlencrypt

done < pws.txt

