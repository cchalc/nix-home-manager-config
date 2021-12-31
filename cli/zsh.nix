{ fetchFromGitHub }:

{
  enable = true;
  shellAliases = {
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    dc = "docker compose";
    iq = "instruqt";
    szsh = "source ~/.zshrc";
    cat = "bat";
    switch = "home-manager switch && source ~/.zshrc";
    garbage = "nix-collect-garbage";
    reload = "switch && garbage";
    we = "watchexec";
    ll = "ls -lrat";

  # Navigation;
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  "....." = "cd ../../../..";

  };
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  history.extended = true;
  initExtra = (builtins.readFile ./init.sh);
  plugins = [
        {
      name = "zsh-autosuggestions";
      src = fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.6.4";
        sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "v0.7.1";
        sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
      };
    }
  ];

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "vi-mode" ];
  };

  initExtraBeforeCompInit = ''
    eval "$(direnv hook zsh)"
    eval "$(zoxide init zsh)"
    eval "$(starship init zsh)"
  '';
}
