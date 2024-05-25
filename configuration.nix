throw ''
  This flake cannot be used verbatim and is available as a starting point only. You will have to configure the system yourself.

  Do not attempt to build your system directly via this flake, as this error will be shown. Instead, initialize a local flake from this template:
    nix flake init -t github:soopyc/nixos-t2-flake

  Delete this file and run the following command:
    sudo nixos-generate-config --dir $PWD --root /mnt

  You can then configure your system to your liking.
''
