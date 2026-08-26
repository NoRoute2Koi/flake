{ ... }:
let
  rgb = ''openrgb --color $(noctalia theme $(noctalia msg wallpaper-get) | grep "primary" | cut -d '#' -f 2 | c
ut -b 1-6 | sed -n "1p")'';
in
{
  hm = {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      settings = {
        shell = {
          corner_radius_scale = 0;
          setup_wizard_enabled = false;
          polkit_agent = true;
          launch_apps_as_systemd_services = true;
          launcher = {
            categories = false;
            compact = true;
          };
        };
        bar.default = {
          position = "left";
          radius = 0;
          margin_ends = 0;
          start  = ["launcher" "wallpaper" "workspaces"];
          center = ["clock"];
          end    = ["media" "tray" "notifications" "clipboard" "network" "volume" "session"];
        };
        widget = {
          media = {
            hide_artist = true;
            art_size = 20;
            title_scroll = "on_hover";
          };
          network.show_label = false;
          workspaces.hide_when_empty = true;
        };
        contrul_center.hidden_tabs = [ "monitor" "bluetooth" "screen-time" "power" ];
        theme = {
          mode = "dark";
          source = "wallpaper";
          templates = {
            builtin_ids = [ "niri" "helix" "gtk3" "gtk4" "qt" "kitty" ];
            community_ids = [ "discord" ];
          };
          audio.enable_overdrive = true;
          location.adress = "Moscow, Russia";
          weathet.effects = false;
          hooks = {
            wallpaper_changed = rgb;
            colors_changed = rgb;
            started = rgb;
          };
        };
        wallpaper = {
          enabled = true;
          directory = "~/wallpapers";
        };
      };
    };
  };
}
