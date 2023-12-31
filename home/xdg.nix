let
  browser = [ "firefox.desktop" ];
  media = [ "mpv.desktop" ];
  image = [ "feh.desktop" ];
  torrent = [ "transmission-gtk.desktop" ];
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    "audio/*" = media;
    "video/*" = media;
    "image/*" = image;
    "application/json" = browser;
    "application/pdf" = [ "zathura.desktop" ];
    "application/x-bittorrent" = torrent;
    "application/x-bittorrent;x-scheme-handler/magnet" = torrent;
    "x-scheme-handler/discord" = [ "discord.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
  };
in
{
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        default = browser;
        associations = associations;
      };
    };
  };
}