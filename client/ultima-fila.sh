#!/usr/bin/env bash
#
# Connect to an Última Fila server with rlwrap + nc.
#
# The chat runs in the terminal's alternate screen (like vim or less): when you
# leave with Ctrl+C the chat disappears and your terminal comes back exactly as
# it was before.
#
# Usage: ultima-fila.sh HOST [PORT]      (PORT defaults to 1337)

HOST="${1:?Usage: $0 HOST [PORT]}"
PORT="${2:-1337}"

# Leave the alternate screen no matter how we exit.
trap 'printf "\e[?1049l"' EXIT
# Ctrl+C is delivered to rlwrap/nc too. Catching it here (instead of dying) makes
# the script wait until they are gone, so the cleanup above runs afterwards.
# (A handler, not "ignore": ignored signals would also be ignored by rlwrap/nc.)
trap : INT

# Enter the alternate screen and clear it.
printf '\e[?1049h\e[2J\e[H'

if command -v rlwrap >/dev/null 2>&1; then
	rlwrap -S "> " nc "$HOST" "$PORT"
else
	nc "$HOST" "$PORT"
fi
