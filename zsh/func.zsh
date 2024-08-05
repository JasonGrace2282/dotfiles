battery () # in case have to check from terminal
{
  echo "Battery: "
  echo "$(cat /sys/class/power_supply/BAT0/capacity)%"
  echo "$(cat /sys/class/power_supply/BAT0/status)"
}

usbmount ()
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

gcampo ()
{
  git commit -a -m $@ && git push
}

gcmpo ()
{
  git commit -m $@ && git push
}

gcbm ()
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

copy()
{
  if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    wl-copy
  else
    xclip -sel clip
  fi
}

deitb ()
{
  docker exec -it $@ /bin/bash
}

gcb ()
{
  git checkout $(git branch --format "%(refname:lstrip=2)" | fzf)
}

gpum ()
{
  git pull upstream main $@ || git pull upstream master $@
}

gppum ()
{
  if ! git pull upstream main; then
    if ! git pull upstream master; then
      echo "Could not pull from upstream"
    fi
  fi
}

zfzf ()
{
  FILE="$(fzf)"
  if [[ $FILE ]]; then
    zathura "${FILE}" --fork
  fi
}
