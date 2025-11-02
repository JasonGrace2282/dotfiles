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
  FILE="$(ag -g .pdf$ | fzf)"
  if [ -n "$FILE" ]; then
    zathura --fork "${FILE}"
  fi
}

afk () {
  [ -e "$HOME/.config/.venv" ] && source "$HOME/.config/.venv/bin/activate"
  "$HOME/.config/scripts/afk.py" $@
}

raw-passcard() {
    gpg -d ~/repos/sysadmin/keybase-passcard/passwords/"$1".txt.gpg 2>/dev/null
}

# Run a tjCSL ansible playbook intelligently (using ssh passcards, vault password files, etc.)
tjans() {
    ANSIBLE_DIR="/home/jasongrace2282/repos/sysadmin/ansible"
    TEMP_FILE="/home/jasongrace2282/.ansible-playbook-runner.sh"

    NUM_FORKS="100"
    CONNECT_USER="root"
    PLAY="$1"
    SSH_PASS_NAME=""
    VAULT_PASS_NAME="ansible"

    if [[ "$PLAY" == "" ]]
    then
        echo "usage: tjans (playbook) [options]..."
        return
    fi

    if [[ "$PLAY" != "-h" ]] && [[ "$PLAY" != "--help" ]]
    then
        shift
    fi

    other_args=()

    while [[ $# -gt 0 ]]
    do
        case $1 in
            -h | --help)
                echo "usage: tjans (playbook) [options]..."
                echo Run a tjCSL ansible play intelligently
                echo
                echo "  -p, --pass PASS                 Specify the name of the passcard file to use when connecting"
                echo "  -v, --vault, --vault-pass PASS  Specify the name of the vault passcard file (excluding \"_vault\") to use"
                echo "  -u, --user USERNAME             Specify the username to connect with"
                echo "  -f, --forks N                   Set the number of concurrent processes to use at once"
                echo
                echo "  ...any other valid ansible-playbook options are also permitted and will be passed to ansible"
                return
                ;;
            -p | --pass)
                SSH_PASS_NAME="$2"
                shift
                shift
                ;;
            -v | --vault | --vault-pass)
                VAULT_PASS_NAME="$2"
                shift
                shift
                ;;
            -u | --user)
                CONNECT_USER="$2"
                shift
                shift
                ;;
            -f | --forks)
                NUM_FORKS="$2"
                shift
                shift
                ;;
            -* | --*)
                other_args+=("$1")
                shift
                ;;
            *)
                other_args+=("$1")
                shift
                ;;
        esac
    done

    set -- "${other_args[@]}"

    pp "$SSH_PASS_NAME" || true
    export SSHPASS=$(raw-passcard "$SSH_PASS_NAME")
    echo "$SSHPASS"

    export VAULTPASS=$(raw-passcard "$VAULT_PASS_NAME"_vault)
    echo "#!/bin/bash" > "$TEMP_FILE"
    echo 'echo $VAULTPASS' >> "$TEMP_FILE"
    chmod +x "$TEMP_FILE"

    echo RUNNING COMMAND: "\n"    ansible-playbook "$ANSIBLE_DIR"/"$PLAY".yml -i "$ANSIBLE_DIR"/hosts -f "$NUM_FORKS" -u "$CONNECT_USER" "$@"
    git -C "$ANSIBLE_DIR" pull
    ansible-playbook "$ANSIBLE_DIR"/"$PLAY".yml -i "$ANSIBLE_DIR"/hosts --ask-pass --vault-password-file "$TEMP_FILE" -f "$NUM_FORKS" -u "$CONNECT_USER" "$@"
}

source $ZSHCONFIG/tjcsl.zsh
