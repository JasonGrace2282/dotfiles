function battery () # in case have to check from terminal
{
  echo "Battery: "
  echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
  echo "$(cat /sys/class/power_supply/BAT0/status)"
}

function usbmount ()
{
  if [ -z "$1" ]
  then
      echo "Expected argument \"partition\""
      exit 1
  fi
  if [ -n "$(findmnt /mnt/usb)" ]
  then
      echo "Must create new directory, /mnt/usb in use."
  else
      sudo mount /dev/$1 /mnt/usb
  fi
}

function gcampo ()
{
  git commit -a -m $1 && shift && git push $@
}

function gcmpo ()
{
  git commit -m $1 && shift && git push $@
}

function gcbm ()
{
  if [[ "$(git branch -vv | grep "main" > /dev/null; echo $?)" == "0" ]]
  then
    git checkout main
  elif [[ "$(git branch -vv | grep "master" > /dev/null; echo $?)" == "0" ]]
  then
    git checkout master
  else
    echo "Could not find main branch"
  fi
}

function grrhh ()
{
  BACK=$1
  shift
  git reset --hard "HEAD~${BACK}" $@
}

function grrsh ()
{
  BACK=$1
  shift
  git reset --soft "HEAD~${BACK}" $@
}

function copy()
{
  if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    wl-copy
  else
    xclip -sel clip
  fi
}

function deitb ()
{
  docker exec -it $@ /bin/bash
}
