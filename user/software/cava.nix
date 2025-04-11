{...}:

{
  programs.cava.enable = true;
  programs.cava.settings = {
    general = {
      framerate = 60;
      autosens = 0;
      bar_width = 1;
      bar_spacing = 0;
      sensitivity = 100;
      lower_cutoff_freq = 10;
#     higher_cutoff_freq = 10000;
    };

    input = {
      method = "pipewire";
#     source = "@DEFAULT_AUDIO_SINK@";
    };

    output = {
      method = "noncurses";
      channels = "mono";
      mono_option = "average";
      show_idle_bar_heads = 1;
    };

    color = {
      gradient = 1;
      gradient_color_1 = "'#94e2d5'";
      gradient_color_2 = "'#89dceb'";
      gradient_color_3 = "'#74c7ec'";
      gradient_color_4 = "'#89b4fa'";
      gradient_color_5 = "'#cba6f7'";
      gradient_color_6 = "'#f5c2e7'";
      gradient_color_7 = "'#eba0ac'";
      gradient_color_8 = "'#f38ba8'";
    };

    smoothing.noise_reduction = 0;
  };
}
