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
  git checkout main &> /dev/null || git checkout master &> /dev/null || echo "Could not find main branch"
}

copy()
{
  if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    wl-copy
  else
    xclip -sel clip
  fi
}

_deit () {
  cmd="$1"
  shift
  docker exec -it $@ $cmd
}

deitb ()
{
  _deit /bin/bash $@
}

deitsh ()
{
  _deit /bin/sh $@
}

gcbs ()
{
  git checkout "$(git branch --format "%(refname:lstrip=2)" | fzf)"
}

gpum ()
{
  git pull upstream main $@ || git pull upstream master $@
}

zfzf ()
{
  FILE="$(fd -e pdf | fzf)"
  if [ -n "$FILE" ]; then
    zathura --fork "${FILE}"
  fi
}

afk () {
  [ -e "$HOME/.config/.venv" ] && source "$HOME/.config/.venv/bin/activate"
  "$HOME/.config/scripts/afk.py" $@
}
