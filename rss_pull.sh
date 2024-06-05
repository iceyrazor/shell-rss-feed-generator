config=$(cat ./config.txt)
url=$(printf "$config" | sed '/^url:/!d' | sed 's/^url://' );
prime_folder=$(printf "$config" | sed '/^prime_folder:/!d' | sed 's/^prime_folder://' );
post=$(printf "$config" | sed '/^post:/!d' | sed 's/^post://' );
ftp=$(printf "$config" | sed '/^ftp:/!d' | sed 's/^ftp://' );
user=$(printf "$config" | sed '/^user:/!d' | sed 's/^user://' );

cd static
rm static-style.css
wget $url/$prime_folder/static-style.css

cd updates
rm index.html
wget $url/$prime_folder/$post/

rm index.xml
wget $url/$prime_folder/$post/index.xml
