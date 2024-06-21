config=$(cat ./config.txt)
url=$(printf "$config" | awk 'gsub(/^url:/,"")');
prime_folder=$(printf "$config" | awk 'gsub(/^prime_folder:/,"")');
post=$(printf "$config" | awk 'gsub(/^post:/,"")');
ftp=$(printf "$config" | awk 'gsub(/^ftp:/,"")');
user=$(printf "$config" | awk 'gsub(/^user:/,"")');

cd $prime_folder
rm static-style.css
wget $url/$prime_folder/static-style.css

cd $post
rm index.html
wget $url/$prime_folder/$post/

rm index.xml
wget $url/$prime_folder/$post/index.xml
