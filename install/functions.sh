INCLUDE_FUNCTIONS_SOURCE=true

brew_install_asdf_plugin_version() {
  local plugin=${1}
  local version=${2}

  asdf plugin-add ${plugin}
  asdf plugin-update ${plugin}
  asdf install ${plugin} ${version}
  asdf global ${plugin} ${version}
}

brew_install_asdf_node_fix_npm() {
  local curDir="${PWD}"

  for ver in ~/.asdf/installs/nodejs/*/bin; do
    cd $ver
    if [ -f ../.npm/bin/npm ]; then
      ln -nfs ../.npm/bin/npm npm
      ln -nfs ../.npm/bin/npx npx
    fi
  done

  cd "${curDir}"
}