#!/bin/bash

# Find out the top 10 memory consuming process
function top10_mem {
  ps aux | sort -nr -k 4 | head -10 | cut -c -100
}

# Find out top 10 cpu consuming process
function top10_cpu {
  ps aux | sort -nr -k 3 | head -10 | cut -c -100
}

# Make files readable and directories executable
function chmod_fs {
  find . -type f -exec chmod a-x '{}' \;
  find . -exec chmod go-rwx '{}' \;
  chown -R `id -un`:`id -gn` .
}

# Prepare files for archiving
function chmod_archive {
  chmod_fs
  find . -type f -exec chmod a-w '{}' \;
}

# Copy dotfiles
function copy_dotfiles {
  base="${HOME}/repos/dotfiles"
  for object in `find ${base} -type f -not -path '*/\.*'`
  do
    ob="${object#${base}}"
    [ -r "${HOME}/${ob/\//.}" ] && {
      rm -vf "${HOME}/${ob/\//.}"
    }
    mkdir -p "$(dirname ${HOME}/${ob/\//.})"
    cp -vf $object "${HOME}/${ob/\//.}"
    chmod u=rw,g=,o= "${HOME}/${ob/\//.}"
  done
}

# Build mount structure
function mkdir_mount {
  mkdir sd{a..f}{1..4}
}

# Find expression in files
function rgrep {
  find -L . -type f -exec grep -Hin --color "${1}" {} \;
}

function qrand {
  which base91 &> /dev/null && base="base91" || base="base64"
  echo `cat /dev/urandom | $base | head -1`
}

function encrypt {

  usage="encrypt file"

  [ -z $1 ] && echo "Usage: ${usage}" && return 1
  [ ! -f $1 ] &&  echo "Usage: ${usage}" && return 1

  file=$(cd "$(dirname "${1}")"; pwd)/$(basename "${1}")

  /usr/bin/gpg -c -a \
    --s2k-mode 3 \
    --s2k-digest-algo sha512 \
    --s2k-count 65536 \
    --s2k-cipher-algo aes256 \
    -o "${file}.enc" "${file}"
}

function decrypt {

  usage="decrypt file.enc"

  [ -z $1 ] && echo "Usage: ${usage}" && return 1
  [ ! -f $1 ] &&  echo "Usage: ${usage}" && return 1

  file=$(cd "$(dirname "${1}")"; pwd)/$(basename "${1}")
  outfile=$(cd "$(dirname "${file}")"; pwd)/$(basename "${file}" ".enc")

  /usr/bin/gpg -o $outfile -d $file
}
