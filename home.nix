{ config, lib, pkgs, ... }:

let
  nigpkgsRev = "21.11-pre";
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") {};

  vimsettings = import ./neovim.nix;

  externalPackages = import ./packages.nix { inherit pkgs; };
  customScripts = import ./scripts.nix { writeScriptBin = pkgs.writeScriptBin; };

  allPackages = externalPackages ++ customScripts;
in {

  xdg.configFile."nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';

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

    #neovim = import ./neovim.nix { vimPlugins = pkgs.vimPlugins; };
    neovim = vimsettings pkgs;

    starship = import ./starship.nix;

    gpg = {
      enable = true;
    };

    alacritty = import ./alacritty.nix;

    git = import ./git.nix { inherit pkgs; };

    tmux = import ./tmux.nix;

    zsh = import ./cli/zsh.nix { fetchFromGitHub = pkgs.fetchFromGitHub; };
  };

  home = {
    username = "christopher.chalcraft";
    homeDirectory = "/Users/christopher.chalcraft";
    packages = allPackages;
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  home.stateVersion = "21.03";

  home.file.".config/nvim/coc-settings.json".source = ./coc-settings.json;

}
