config=$(cat ./config.txt)
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')
url=$(printf "$config" | awk 'gsub(/^url:/,"")');
prime_folder=$(printf "$config" | awk 'gsub(/^prime_folder:/,"")');
post=$(printf "$config" | awk 'gsub(/^post:/,"")');
ftp=$(printf "$config" | awk 'gsub(/^ftp:/,"")');
user=$(printf "$config" | awk 'gsub(/^user:/,"")');


read -s -p "ftp_password: " pass
printf "\n\n"

if [ "$1" == "" ]; then

#upload only index.xml/html listing and other assets
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
EOF

else

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

fi
