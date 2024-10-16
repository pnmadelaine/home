{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
      };
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '0xf9f5d7'
          background = "0xfbf1c7";
          # soft contrast: background = '0xf2e5bc'
          foreground = "0x3c3836";
        };
        normal = {
          black = "0xfbf1c7";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0x7c6f64";
        };
        bright = {
          black = "0x928374";
          red = "0x9d0006";
          green = "0x79740e";
          yellow = "0xb57614";
          blue = "0x076678";
          magenta = "0x8f3f71";
          cyan = "0x427b58";
          white = "0x3c3836";
        };
      };
    };
  };
}
