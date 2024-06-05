#  " --> &quot;
#  & --> &amp;
#  ' --> &#39;
#  < --> &lt;
#  > --> &gt;
content="$(./hoedown $1 | tail -n +2 | sed 's/</\&lt\;/g' | sed 's/>/\&gt\;/g')"
title=$(cat $1 | head -n 1 | sed 's/# //' | sed -e 's/\r//g')
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')

config=$(cat ./config.txt)
url=$(printf "$config" | sed '/^url:/!d' | sed 's/^url://' );
prime_folder=$(printf "$config" | sed '/^prime_folder:/!d' | sed 's/^prime_folder://' );
post=$(printf "$config" | sed '/^post:/!d' | sed 's/^post://' );
ftp=$(printf "$config" | sed '/^ftp:/!d' | sed 's/^ftp://' );
user=$(printf "$config" | sed '/^user:/!d' | sed 's/^user://' );

f_end="$(cat ./$prime_folder/$post/index.xml | tail -n 2)"
f_start=$(cat ./$prime_folder/$post/index.xml | awk -v RS="$f_end" 'NR==1{printf $0} NR!=1{printf "%s", $0}')

pub_date=$(date '+%a, %d %b %Y %H:%M:%S %z')
f_out=$(printf "$f_start\n<item>\n\t<title>$title</title>\n\t<pubDate>$pub_date</pubDate>\n\t<link>$url/$prime_folder/$post/list/$file/</link>\n\t<guid>$url/$prime_folder/$post/list/$file/</guid>\n\t<description>$content</description>\n</item>\n$f_end" | awk -v chunk="$(date '+%B %d/%d/%Y %I:%M%p')" '{gsub("&lt;DATE_POST&gt;",chunk)}1')

printf "$f_out"
printf "$f_out" > $prime_folder/$post/index.xml
