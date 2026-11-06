# Última Fila
**Última Fila** ("the back row") is a classroom chat server based on [kChat](https://gitlab.com/kernal/kchat) (Kernal Chat). You can connect to it using netcat, telnet or any TCP client.

Joining the chat is as simple as running `nc server port`.

## Features
* Requires no external libraries
* Register/login (SHA-256)
* Rules (much like iptables, enables users to choose who to receive from and who to send to.)
* Direct messages
* MOTD
* Uses I/O multiplexing (no threads)
* IPv6 or binding to both IPv4 and IPv6 addresses
* Everything is configurable in `config.c`

However, not having a specific client comes with some limitations. Such as overlapping issues, no arrow history etc.\
To make your kernal-chat experience better, we recommend using [rlwrap](https://github.com/hanslub42/rlwrap) and connecting with the command below,

`rlwrap -S "> " nc server port`


---

## About this version

This is a modified version of [kChat](https://gitlab.com/kernal/kchat), created by Ismael Vázquez as a personal project for a class chat.

The original code was written by İrem Kuyucu and Laurynas Četyrkinas (Kernal Community) and is distributed under the **GNU GPL v3**. This version keeps the same license (see [COPYING](COPYING)) and the original copyright notices.

### Changes from the original

* Renamed to Última Fila; removed the reference to the original public instance.
* New MOTD.
