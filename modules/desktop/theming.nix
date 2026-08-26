{ pkgs, user, ... }:
{

  services.dbus.enable = true;
  programs.dconf.enable = true;
  hm.gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-dark";
    };
  };

  hm.home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  hm.qt = {
    enable = true;
    style = {
      package = pkgs.kdePackages.breeze;
      name = "Breeze";
    };
    qt6ctSettings = {
      Appearance = {
        color_scheme_path = "/home/${user}/.config/qt6ct/colors/noctalia.conf";
        custom_palette = true;
      };
    };
    qt5ctSettings = {
      Appearance = {
        color_scheme_path = "/home/${user}/.config/qt5ct/colors/noctalia.conf";
        custom_palette = true;
      };
    };
  };

}
