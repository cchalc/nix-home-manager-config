{ pkgs }:

let
  gitTools = with pkgs.gitAndTools; [
    delta
    diff-so-fancy
    git-codeowners
    gitflow
    gh
  ];

  nixTools = with pkgs; [
    cachix
    lorri
    niv
  ];

  homePackages = with pkgs; [
    packer
    vagrant
    nodejs_latest
    age
    elixir
    jq
    terraform
    doctl
    yarn
    hugo
    bat
    httpie
    dhall
    rustup
    cargo-make
    wasmer
    cue
    go
    exa
    python38Full
  ];
in homePackages ++ gitTools ++ nixTools
