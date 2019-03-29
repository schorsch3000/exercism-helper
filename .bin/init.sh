#!/usr/bin/env bash
BASE_DIR="$(< ~/.config/exercism/user.json jq -r .workspace)/"

[ "${PWD##$BASE_DIR}" != "${PWD}" ] || { echo not in an exercise dir; exit 1; }

[ "$(echo "${PWD##$BASE_DIR}" | tr -dc /)" == "///" ] && {
    TRACK="$(basename "$(dirname "${PWD##$BASE_DIR}")")"
    EXERCISE="$(basename "${PWD##$BASE_DIR}")"
    return
}
[ "$(echo "${PWD##$BASE_DIR}" | tr -dc /)" == "/////" ] && {
    TRACK="$(basename "$(dirname "${PWD##$BASE_DIR}")")"
    EXERCISE="$(basename "${PWD##$BASE_DIR}")"
    return
}

echo not in an exercise dir
exit 1
