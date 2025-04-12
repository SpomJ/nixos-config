{config, ...}:

{
  # Misused ~/.config -> ~/.local/share
  xdg.configFile = {
    "unity3d".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.dataHome}/unity3d";
    "vesktop".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.dataHome}/vesktop";
  };
}
