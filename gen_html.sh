content="$(./hoedown --hard-wrap $1 | sed -e 's/&/\\\\&/g')"
#content=$(printf "%q" $content)
title=$(cat $1 | head -n 1 | sed 's/# //' | sed -e 's/\r//g')
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')

config=$(cat ./config.txt)
url=$(printf "$config" | sed '/^url:/!d' | sed 's/^url://' );
prime_folder=$(printf "$config" | sed '/^prime_folder:/!d' | sed 's/^prime_folder://' );
post=$(printf "$config" | sed '/^post:/!d' | sed 's/^post://' );
ftp=$(printf "$config" | sed '/^ftp:/!d' | sed 's/^ftp://' );
user=$(printf "$config" | sed '/^user:/!d' | sed 's/^user://' );

#f_out=$(printf "<html>\n<head>\n<link rel=\"stylesheet\" href=\"/static/static-style.css?v=76\" />\n</body>\n<div align=\"center\" class=\"static-main\">\n$content\n<br><br><a href=\"$url/$prime_folder/$post\">$url/$prime_folder/$post</a>  <a href=\"../index.xml\" target=\"_blank\"><img src=\"/assets/img/RSS.png\" class=\"rss_img\"></a>\n</div></body>\n</html>")
f_out=$(cat ./template/page.html | awk -v chunk="$content" '{gsub("<PAGE_CONTENT>",chunk)}1' | awk -v chunk="$url/$prime_folder/$post" '{gsub("<PAGE_URL>",chunk)}1' | awk -v chunk="$(date '+%B %m/%d/%Y %I:%M%p')" '{gsub("<DATE_POST>",chunk)}1')

printf "$f_out"
mkdir $prime_folder/$post/list/$file
printf "$f_out" > $prime_folder/$post/list/$file/index.html
