function battery () # in case have to check from terminal
{
  echo "Battery: "
  echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
  echo "$(cat /sys/class/power_supply/BAT0/status)"
}

function brightness ()
{
  if [ -z $1 ]; then
      echo "Usage: brighntess BRIGHTNESS"
      echo "BRIGHTNESS is a float (0.0-1.0)"
  else
      xrandr --listmonitors | grep "^ " | cut -f 6 -d' ' | \
      xargs --replace=0 xrandr --output 0 --brightness $1
  fi
}

function usbmount ()
{
  if [[ "$1" == "" ]]
  then
      echo "Expected argument \"partition\""
      exit 1
  fi
  if [[ ! "$(findmnt /mnt/usb)" == "" ]]
  then
      echo "Must create new directory, /mnt/usb in use."
  else
      sudo mount /dev/$1 /mnt/usb
  fi
}

function spotify ()
{
  if [[ "$(command -v spotify)" != "" ]]
  then
    spotify-launcher
  else
    spotify
  fi
}

function man ()
{
  \man $1 | $EDITOR
}

function gcampo ()
{
  git commit -a -m $1;git push
}

function gcmpo ()
{
  git commit -m $1; git push
}

function gcbm ()
{
  if [[ "$(git branch -vv | grep "main" > /dev/null && echo $?)" == "0" ]]
  then
    git checkout main
  elif [[ "$(git branch -vv | grep "master" > /dev/null && echo $?)" == "0" ]]
  then
    git checkout master
  else
    echo "Could not find main branch"
  fi
}
