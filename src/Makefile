LIB=-I/home/iceyrazor/stuff/scripts/c/my_utils

main: main.c
	gcc -o rss-manager main.c ${LIB}

debug: main.c
	gcc -o rss-manager main.c ${LIB} -g -fsanitize=address
