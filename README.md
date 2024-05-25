# nixos-t2-flake
Template repository for a NixOS setup on a Mac device with a T2 chip

See the [Installation Guide](https://wiki.t2linux.org/distributions/nixos/installation) for more information.

## Usage
```shell
# This assumes that you are root and that you have followed previous steps on the wiki.
# Make a directory to store your flake. Ensure you still have access after a reboot.
$ mkdir /mnt/flake # makes a directory to store the flake as nix flake init does not make a subdir.
$ cd /mnt/flake
$ nix flake init -t github:soopyc/nixos-t2-flake # creates a flake based on this template.
$ rm configuration.nix # delete the stub configuration file.
$ nixos-generate-config --dir $PWD --root /mnt # generate configuration files.
# Carry on installing.
```
