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

    smoothing.noise_reduction = 0;
  };
}
