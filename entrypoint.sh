#!/usr/bin/bash

printf '4\n' | exec python pokebot.py -nv -na -hl -m "$BOT_MODE" "$BOT_PROFILE"
