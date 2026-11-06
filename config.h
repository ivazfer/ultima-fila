#include <stdbool.h>

#ifndef CONFIG_H
#define CONFIG_H

/* Define if you want to bind to IPv4 */
#define IPV4_ADDR "0.0.0.0"
#define IPV4_PORT 1337

/* Define if you want to bind to IPv6 */
#define IPV6_ADDR "::1"
#define IPV6_PORT 1337

#define BACKLOG 10 /* Pending connections in queue. */
#define BUF_SIZE 512
#define MAX_CLIENTS 1024
#define AUTH_FILE "auth.txt"
#define AUTH_FILE_TMP "."AUTH_FILE".tmp"

#define MOTD  "\r\e[1;34m" \
"Silencio, esto no está bien, pero suspender es peor" \
"\e[0m\n"

#define CONNECT_LINE_ENABLED
#define CONNECT_LINE_INFORM_STRING
#define CONNECT_LINE "kchat-connect"

#endif
