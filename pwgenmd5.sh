#!/bin/bash

while read pw hostname; do
#  echo $pw
  hierakey=$(echo "rootpw::"$hostname": >")
#  sha512hashed="$(echo -n $pw | sha512sum | cut -d " " -f 1)"
#  echo $sha512hashed
#  eyamlencrypt=$(eyaml encrypt -s $sha512hashed | awk '{print $2}')

  md5hashed="$(openssl passwd -1 -salt b9490e92cb2c65d5f890a20a47f2bbd7 $pw)"    #I do not use this salt in real life, or md5
#  echo "View your md5 hash:"
#  echo $md5hashed
  eyamlencrypt=$(eyaml encrypt -s $md5hashed | awk '{print $2}')
  eyamlencrypt=$(echo $eyamlencrypt | sed -e 's/==] >/==]/g' | sed -e 's/ENC/  ENC/g')
#  echo "------ placeholder  ---------"
  echo $hierakey
  echo " "$eyamlencrypt

done < pws.txt
