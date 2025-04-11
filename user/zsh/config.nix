{pkgs, config, ...}:

{
  home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = ["history"];
    };
    dotDir = ".config/zsh";
    history = {
      append = true;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true;
    };
    plugins = [];
    syntaxHighlighting = {
      enable = true;
      highlighters = ["brackets"];
    };
    zsh-abbr = {
      enable = true;
      abbreviations = {
        g = "git";
        gca = "git commit -a";
      };
      globalAbbreviations = {};
    };
  };
}
      
