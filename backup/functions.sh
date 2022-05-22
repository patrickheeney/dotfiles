
check_sudo () {
  if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
  fi
}

has_mount () {
  if [ -z "$1" ]; then
    echo "No argument supplied"
  fi

  CHECK=${1%/}
  if mount | grep "on $CHECK " > /dev/null; then
    return 0
  else
    # echo "$CHECK MOUNT FAIL"
    return 1
  fi

  return 0
}

has_drive () {
  if [ -z "$1" ]; then
    echo "No argument supplied"
  fi

  CHECK=${1}
  if lsblk -ido MODEL | grep "$CHECK" > /dev/null; then
    return 0
  else
    return 1
  fi

  return 0
}

check_drive () {
  if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
  fi

  if has_drive "$1"; then
    echo "$1 DRIVE: PASS"
  else
    echo "$1 DRIVE: FAIL"
    exit 1
  fi
}

check_mount () {
  if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
  fi

  CHECK=${1%/}
  if mount | grep "on $CHECK " > /dev/null; then
    echo "$CHECK MOUNT: PASS"
  else
    echo "$CHECK MOUNT: FAIL"
    exit 1
  fi
}

check_directory () {
  if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
  fi

  CHECK=${1%/}
  if [ -d "$CHECK" ]; then
    echo "$CHECK DIR: PASS"
  else
    echo "$CHECK DIR: FAIL"
    exit 1
  fi
}
