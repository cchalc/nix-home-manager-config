{pkgs, config, lib, ... }:

let

  dusk-vim = pkgs.vimUtils.buildVimPlugin {
      name = "dusk-vim";
      src = pkgs.fetchFromGitHub {
          owner = "notusknot";
          repo = "dusk-vim";
          rev = "8eb71f092ebfa173a6568befbe522a56e8382756";
          sha256 = "09l4hda5jnyigc2hhlirv1rc8hsnsc4zgcv4sa4br8fryi73nf4g";
      };
  };
  
in
{
  enable = true;
  vimAlias = true;

  # Neovim plugins
  plugins = with pkgs.vimPlugins; [
    #coc-nvim
    editorconfig-vim
    fzf-vim
    fzfWrapper
    LanguageClient-neovim
    lightline-vim
    nerdtree
    supertab
    tabular
    vim-better-whitespace
    vim-multiple-cursors
    vim-surround
    nvim-lspconfig
    nvim-compe
    telescope-nvim

    # Eyecandy 
    nvim-web-devicons
    nvim-tree-lua
    nvim-treesitter
    # bufferline-nvim-lua # throwing an error
    galaxyline-nvim
    nvim-colorizer-lua
    dusk-vim
    pears-nvim

    # extra movement
    ctrlp

    # specific languages
    vim-elixir
    vim-nix
    vim-markdown
    vim-go
    vim-scala
    vim-pandoc
    vim-pandoc-syntax
    rust-vim
    vim-hcl
    vim-cue

    # Haskell
    vim-hoogle
    neco-ghc
    haskell-vim
    hlint-refactor-vim
    ghc-mod-vim

    # rust
    coc-rust-analyzer
    YouCompleteMe
    vim-toml

    # config
    vim-fugitive
    vim-airline
    vim-airline-themes

    # from burke
    vim-abolish
    vim-repeat # cs"'...
    vim-commentary # gcap
    vim-indent-object # >aI
    vim-indent-guides
    vim-easy-align # vipga
    vim-eunuch # :Rename foo.rb
    vim-sneak
    ale

    # themes
    wombat256
    gruvbox
    vim-colors-solarized
  ];

  extraPackages = with pkgs; [
    rust-analyzer
  ];

  extraConfig = (builtins.readFile ./neovimrc);
  
  #extraConfig = ''
  #  set runtimepath^=${./lua}
  #  set termguicolors
  #  luafile ${./lua}/settings.lua
  #'';

}