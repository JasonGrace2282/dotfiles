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
    pp "$1"
  fi
  if [[ "$1" != *".tjhsst.edu" ]]; then
    set -- "$1.csl.tjhsst.edu"
  fi
  ssh "root@$1"
}
