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
    nix-index
    nix-template
    nix-update
    nixpkgs-review
  ];

  homePackages = with pkgs; [
    packer
    vagrant
    nodejs # for coc vim plugin
    age
    elixir
    terraform
    doctl
    yarn
    hugo
    httpie
    dhall
    rustup
    cargo-make
    wasmer
    cue
    go
    exa
    python38Full
    perl # for fzf history

    # cli tools
    zoxide
    fzf
    ripgrep
    universal-ctags
    jq
    bat

    # coc lanaguages
    rnix-lsp

    #haskell dependencies
    cabal-install
    ghc
    haskellPackages.hlint
  ];
in homePackages ++ gitTools ++ nixTools
