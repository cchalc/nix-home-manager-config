{ config, ... }:

let
  nigpkgsRev = "21.11-pre";
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") {};

  externalPackages = import ./packages.nix { inherit pkgs; };
  customScripts = import ./scripts.nix { writeScriptBin = pkgs.writeScriptBin; };

  allPackages = externalPackages ++ customScripts;
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
    };
    
    home-manager = {
      enable = true;
      path = "…";
    };

    neovim = import ./neovim.nix { vimPlugins = pkgs.vimPlugins; };

    starship = import ./starship.nix;

    gpg = {
      enable = true;
    };

    alacritty = import ./alacritty.nix;

    git = import ./git.nix { inherit pkgs; };

    tmux = import ./tmux.nix;

    zsh = import ./zsh.nix { fetchFromGitHub = pkgs.fetchFromGitHub; };
  };

  home = {
    username = "cchalc";
    homeDirectory = "/Users/christopher.chalcraft";
    packages = allPackages;
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  home.stateVersion = "21.03";
}
