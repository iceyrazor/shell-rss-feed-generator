content="$(cat $1 | head -n 20 | sed -z 's/\n/\\\\n/g' | sed 's/\"/\\\\"/g' | sed -e 's/\r//g')"
#content=$(printf "%q" $content)
title=$(cat $1 | head -n 1 | sed 's/# //' | sed -e 's/\r//g')
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')

config=$(cat ./config.txt)
url=$(printf "$config" | sed '/^url:/!d' | sed 's/^url://' );
prime_folder=$(printf "$config" | sed '/^prime_folder:/!d' | sed 's/^prime_folder://' );
post=$(printf "$config" | sed '/^post:/!d' | sed 's/^post://' );
ftp=$(printf "$config" | sed '/^ftp:/!d' | sed 's/^ftp://' );
user=$(printf "$config" | sed '/^user:/!d' | sed 's/^user://' );
discord_webhook=$(printf "$config" | sed '/^discord_webhook:/!d' | sed 's/^discord_webhook://' );

f_out=$(cat ./template/webhook.json | awk -v chunk="$content" '{gsub("<PAGE_CONTENT>",chunk)}1' | awk -v chunk="$url/$prime_folder/$post/list/$file" '{gsub("<PAGE_URL>",chunk)}1' | awk -v chunk="$post" '{gsub("<POST_NAME>",chunk)}1' | awk -v chunk="$url/$prime_folder/$post" '{gsub("<PAGE_PAGE>",chunk)}1' | awk -v chunk="$(date '+%B %m/%d/%Y %I:%M%p')" '{gsub("<DATE_POST>",chunk)}1')

printf "$f_out\n\n"
curl -X POST -H "Content-Type: application/json" -d "$f_out" "$discord_webhook"
