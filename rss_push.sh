config=$(cat ./config.txt)
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')
url=$(printf "$config" | sed '/^url:/!d' | sed 's/^url://' );
prime_folder=$(printf "$config" | sed '/^prime_folder:/!d' | sed 's/^prime_folder://' );
post=$(printf "$config" | sed '/^post:/!d' | sed 's/^post://' );
ftp=$(printf "$config" | sed '/^ftp:/!d' | sed 's/^ftp://' );
user=$(printf "$config" | sed '/^user:/!d' | sed 's/^user://' );


if [ "$1" == "" ]; then
    echo file not defined.
fi

read -s -p "ftp_password: " pass
printf "\n\n"

ftp -n <<EOF
open $ftp
user $user $pass 

cd public_html
mkdir $prime_folder
cd $prime_folder
lcd $prime_folder

put static-style.css

mkdir $post
cd $post
lcd $post
put index.xml
put index.html

mkdir list
cd list

mkdir $file
cd $file
lcd list/$file
put index.html
EOF
