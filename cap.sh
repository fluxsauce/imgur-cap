#!/bin/bash

function camtoimgur() {
  # Thanks to https://github.com/mattgrill/dotfiles/blob/master/.functions
  fn=`uuidgen`
  rm -rf /tmp/.camtoimgur
  if [ $# -eq 0 ]; then
    echo "Specify the number of frames, like 5"
  else
    mkdir /tmp/.camtoimgur
    for i in `seq 1 $1`;
    do
      imagesnap -q /tmp/.camtoimgur/$i.jpg
    done
    mogrify -resize 320x240 /tmp/.camtoimgur/*.jpg
    convert -delay 12 -loop 0 /tmp/.camtoimgur/*.jpg $HOME/Desktop/$fn.gif
    uptoimgur $fn
  fi
}

function uptoimgur() {
  # Thanks to https://github.com/Ceryn/img/blob/master/img.sh
  res=$(curl -sH "Authorization: Client-ID eb0e76968ade2ba" -F "image=@$HOME/Desktop/$fn.gif" "https://api.imgur.com/3/upload")
  echo $res | grep -qo '"status":200' && link=$(echo $res | sed -e 's/.*"link":"\([^"]*\).*/\1/' -e 's/\\//g')
  test -n "$link" && (printf $link; printf "\a"; echo -e)|| echo "$res" > "$img.error"
}
