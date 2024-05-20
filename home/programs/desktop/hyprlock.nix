{ user, ... }:

{
  programs.hyprlock = { 
    enable = true;
    settings = {
      source = [
        "/home/${user}/.cache/wal/colors-hyprland.conf"
      ];

      general = {
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "/home/${user}/.config/current-wallpaper";
          blur_size = 2;
          blur_passes = 2;
          noise = 0.0117;
          contrast = 1.3000;
          brightness = 0.8000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        }
      ];

      label = [
        {
          text = "cmd[update:1000] echo \"<b><big> $(date '+%H:%M') </big></b>\"";
          color = "$foreground";
          font_size = 64;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          text = "Hey <span text_transform=\"capitalize\">$USER</span>";
          color = "$foreground";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.2;
          dots_spacing = 0.64;
          dots_center = true;
          outer_color = "$primary";
          inner_color = "$background";
          font_color = "$foreground";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -75";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
