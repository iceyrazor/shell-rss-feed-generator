content="$(./hoedown --hard-wrap $1 | sed -e 's/&/\\\\&/g')"
#content=$(printf "%q" $content)
title=$(cat $1 | head -n 1 | sed 's/# //' | sed -e 's/\r//g')
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')

config=$(cat ./config.txt)
url=$(printf "$config" | awk 'gsub(/^url:/,"")');
prime_folder=$(printf "$config" | awk 'gsub(/^prime_folder:/,"")');
post=$(printf "$config" | awk 'gsub(/^post:/,"")');
ftp=$(printf "$config" | awk 'gsub(/^ftp:/,"")');
user=$(printf "$config" | awk 'gsub(/^user:/,"")');

#f_out=$(printf "<html>\n<head>\n<link rel=\"stylesheet\" href=\"/static/static-style.css?v=76\" />\n</body>\n<div align=\"center\" class=\"static-main\">\n$content\n<br><br><a href=\"$url/$prime_folder/$post\">$url/$prime_folder/$post</a>  <a href=\"../index.xml\" target=\"_blank\"><img src=\"/assets/img/RSS.png\" class=\"rss_img\"></a>\n</div></body>\n</html>")

#f_out=$(cat ./template/page.html | awk -v chunk="$content" '{gsub("<PAGE_CONTENT>",chunk)}1' | awk -v chunk="$url/$prime_folder/$post" '{gsub("<PAGE_URL>",chunk)}1' | awk -v chunk="$(date '+%B %m/%d/%Y %I:%M%p')" '{gsub("<DATE_POST>",chunk)}1')

f_out=$(awk -v content="$content" -v post="$url/$prime_folder/$post" -v date="$(date '+%B %m/%d/%Y %I:%M%p')" '{gsub("<PAGE_CONTENT>",content); gsub("<PAGE_URL>",post); gsub("<DATE_POST>",date); print}' ./template/page.html)

printf "$f_out"
printf "\n----\n\n\nDEBUG: $url\n$post\n$prime_folder\n$ftp\n$user\n\n"
mkdir $prime_folder/$post/list/$file
printf "$f_out" > $prime_folder/$post/list/$file/index.html
