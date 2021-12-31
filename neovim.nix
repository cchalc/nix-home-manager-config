{ vimPlugins }:

{
  enable = true;
  vimAlias = true;

  extraConfig = (builtins.readFile ./.vimrc);

  # Neovim plugins
  plugins = with vimPlugins; [
    ctrlp
    editorconfig-vim
    gruvbox
    nerdtree
    tabular
    vim-elixir
    vim-nix
    vim-markdown
    vim-go
    vim-scala
    vim-pandoc
    vim-pandoc-syntax
    vim-fugitive
    vim-airline
    rust-vim
    fzf-vim
    vim-abolish
    vim-surround # cs"'
    vim-repeat # cs"'...
    vim-commentary # gcap
    vim-indent-object # >aI
    vim-easy-align # vipga
    vim-eunuch # :Rename foo.rb
    vim-sneak
    supertab
    ale
  ];
}
