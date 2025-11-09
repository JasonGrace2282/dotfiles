j() {
  if [[ -z "$1" ]]; then
    echo "Usage: j <hostname>"
    return 0
  fi
  base="${1%.csl.tjhsst.edu}"
  base="${base%.tjhsst.edu}"
  if [[ "$base" == "borg"* || "$base" == "hpc"* ]]; then
    pp cluster
  else
    pp "$base"
  fi
  if [[ "$1" != *".tjhsst.edu" ]]; then
    if [[ "$base" =~ ^(www|ipa) ]]; then
      set -- "$1.tjhsst.edu"
    else
      set -- "$1.csl.tjhsst.edu"
    fi
  fi
  url="$1"
  shift
  ssh "root@$url" $@
}
