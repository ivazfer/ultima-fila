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

## Connecting

Anything that speaks TCP works (`nc`, `telnet`, PuTTY in *Raw* mode...). The nicest way is `rlwrap` + `nc`:

```sh
rlwrap -S "> " nc HOST 1337
```

Type `back-connect` to get in, then `/register nick password` (first time) or `/login nick password`.

`client/ultima-fila.sh` does the same but runs the chat in the terminal's alternate screen: when you leave with **Ctrl+C** the chat disappears and your terminal is exactly as it was before.

```sh
./client/ultima-fila.sh HOST          # port defaults to 1337
```

## Using the chat

* Anything you type that does not start with `/` is sent to everybody.
* `/dm nick "message"` sends a private message. DMs are never stored.
* `@nick` mentions a connected user: the mention is highlighted for everyone and the mentioned user's terminal bell rings.
* After `/login` or `/register` you see the last 10 public messages. They are kept in `history.txt` and survive restarts.
* `/help` lists every command.

## About this version

This is a modified version of [kChat](https://gitlab.com/kernal/kchat), created by Ismael Vázquez as a personal project for a class chat.

The original code was written by İrem Kuyucu and Laurynas Četyrkinas (Kernal Community) and is distributed under the **GNU GPL v3**. This version keeps the same license (see [COPYING](COPYING)) and the original copyright notices.

### Changes from the original

* Renamed to Última Fila; removed the reference to the original public instance.
* New welcome message.
* The last 10 public messages are stored (`history.txt`) and shown after `/login` and `/register`.
* `@nick` mentions, highlighted, with a terminal bell for the mentioned user.
* `client/ultima-fila.sh`: connects with `rlwrap` + `nc` in the alternate screen, so Ctrl+C leaves the terminal untouched.
* Fix: accented letters (UTF-8) at the start or end of a message were being cut (`está` arrived as `est`).
* Control characters in messages are replaced by spaces, so nobody can send terminal escape sequences to the others.
