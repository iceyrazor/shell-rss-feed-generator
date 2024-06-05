#include <stdio.h>
#include <string.h>
#include <threads.h>
#include <unistd.h>
#include <stdlib.h>
#include "Server.h"
#include "launch-web.c"
#include <pthread.h>


void check_port(int code){
    if(code!=1){
        if(code==-1){
            printf("you must supply a port\n");
        } else {
            printf("port must be a number\n");
        }
        exit(-1);
    }
}


int main(int argc, char *argv[]){

    //check_port(is_number(argv[1]));

    //start webserver
    /*int port=atoi(argv[1]);
    struct Server *server = (struct Server *)MALLOC(sizeof(struct Server));
    *server = server_constructor(AF_INET, SOCK_STREAM, 0, INADDR_ANY, port, 10, launch_socket);
    server->launch(server);
    */


    //while(running){}

    usleep(1);
    //server_close(server);

    return 0;
}
