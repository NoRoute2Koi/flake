{ pkgs, ... }:
{

  services.displayManager.ly.enable = true;
  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland-satellite;
  };
  programs.niri.enable = true;
  hm.xdg.configFile."niri/config.kdl" = {
    force = true;
    text = ''
      include "~/.config/niri/noctalia.kdl"
      environment {
        QT_QPA_PLATFORMTHEME "qt6ct"
      }
        input {
          keyboard {
            xkb {
              layout "us,ru"
              options "grp:win_space_toggle"
            }
          numlock
          }
          mouse {
            accel-speed 0.0
            accel-profile "flat"
          }
        }
        output "HDMI-A-1" {
          mode "1920x1080@60"
          scale 1
        }
        layout {
          gaps 16
          center-focused-column "never"
          default-column-width { proportion 0.5; }
          focus-ring {
            off
          }
          border {
            width 4
          }
          shadow {
            softness 30
            spread 5
            offset x=0 y=5
          }
        }
        spawn-at-startup "noctalia"
        hotkey-overlay {
          skip-at-startup
        }
        screenshot-path "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png"
        window-rule {
          match app-id=r#"firefox$"# title="^Picture-in-Picture$"
          open-floating true
        }
        window-rule {
          match app-id=r#"^org\.keepassxc\.KeePassXC$"#
          block-out-from "screen-capture"
        }

        window-rule {
          match app-id="dev.noctalia.Noctalia"
          open-floating true
          default-column-width { fixed 1080; }
          default-window-height { fixed 920; }
        }

        window-rule {
          background-effect {
            blur true
            xray false
          }
        }

        debug {
          honor-xdg-activation-with-invalid-serial
        }

        prefer-no-csd

        binds {
          Mod+T { spawn "kitty"; }
          Mod+R { spawn-sh "noctalia msg panel-toggle launcher"; }
          Mod+A { spawn-sh "octalia msg panel-toggle control-center"; }
          Mod+L/ { spawn-sh "noctalia msg session lock"; }

          Mod+Shift+Slash { show-hotkey-overlay; }
          Mod+Q repeat=false { close-window; }
          Mod+C { center-column; }
          Mod+Tab repeat=false { toggle-overview; }

          Mod+F { maximize-column; }
          Mod+Shift+F { fullscreen-window; }
          Mod+M { maximize-window-to-edges; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }
          Mod+Shift+Minus { set-window-height "-10%"; }
          Mod+Shift+Equal { set-window-height "+10%"; }

          Mod+V       { toggle-window-floating; }
          Mod+Shift+V { switch-focus-between-floating-and-tiling; }
          Mod+W { toggle-column-tabbed-display; }

          Print { screenshot; }
          Ctrl+Print { screenshot-screen; }
          Alt+Print { screenshot-window; }

          Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
          Ctrl+Alt+Delete { quit; }
          Mod+Shift+P { power-off-monitors; }

          Mod+WheelScrollDown       { focus-column-left; }
          Mod+WheelScrollUp         { focus-column-right; }
          Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
          Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }
          Mod+Shift+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
          Mod+Shift+WheelScrollUp   cooldown-ms=150 { focus-workspace-up; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
          XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioPause       allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
          XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
          XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }
        }
    '';
  };
}
