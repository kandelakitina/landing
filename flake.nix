{
  inputs = {
    flakelight.url = "github:nix-community/flakelight";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = {
        packages = pkgs:
          with pkgs;
          with nodePackages; [
            nodejs
            live-server
            # pm2
          ];
        shellHook = ''
          live-server &
          # unset name
          # pm2 start live-server
        '';
      };
    };
}
