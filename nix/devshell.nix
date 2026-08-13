{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    fennel-ls
    fnlfmt
  ];
}
