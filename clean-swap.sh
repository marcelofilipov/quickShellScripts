#!/bin/bash
# Remove revisões antigas de snaps
# FECHE TODOS OS SNAPS ANTES DE RODAR ESSE SCRIPT
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
