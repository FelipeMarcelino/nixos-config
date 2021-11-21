{ config, pkgs, lib, ... }:

let
  modifier_button = "Mod1";
in
{

  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession";

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = modifier_button;
      keybindings = lib.mkOptionDefault {
        "${modifier_button}+Return" = "exec --no-startup-id alacritty -t 'code'";
        "${modifier_button}+comma" = "kill";
        "${modifier_button}+d" = "exec --no-startup-id rofi -show drun";
        "${modifier_button}+h" = "focus left";
        "${modifier_button}+l" = "focus right";
        "${modifier_button}+k" = "focus up";
        "${modifier_button}+j" = "focus down";
        "${modifier_button}+Shift+h" = "move left";
        "${modifier_button}+Shift+l" = "move right";
        "${modifier_button}+Shift+k" = "move up";
        "${modifier_button}+Shift+j" = "move down";
        "${modifier_button}+c" = "split h";
        "${modifier_button}+v" = "split v";
      };
      fonts = {
        names = [ "Fura Code Nerd Font Mono" ];
        size = 11.0;
      };
      gaps = {
        inner = 5;
        outer = 5;
        smartGaps = true;
        smartBorders = "on";
      };
      window = {
        hideEdgeBorders = "smart";
        border = 5;
      };
      floating = {
        border = 5;
        criteria = [
          {
            class = "Pavucontrol";
          }
        ];
      };
      startup = [
        { command = "autorandr -c"; notification = false; }
        { command = "alacritty -t 'spt' -e spt"; notification = false; }
        { command = "slack"; notification = false; }
        { command = "discord"; notification = false; }
        # { command = "systemctl --user restart polybar"; always = true; notification = false; }
      ];
      assigns = {
        "1: code" = [{ title = "code"; }];
        "2: web" = [{ class = "^Brave-browser$"; }];
        "3: msg" = [{ class = "^Slack$"; } { class = "^discord$"; }];
        "4: media" = [{ title = "^spt$"; }];
      };
      workspaceOutputAssign = [
        { output = "HDMI-0"; workspace = "1: code"; }
        { output = "DVI-D-0"; workspace = "2: web"; }
        { output = "HDMI-0"; workspace = "3: msg"; }
        { output = "DVI-D-0"; workspace = "4: media"; }
        { output = "HDMI-0"; workspace = "5: email"; }
        { output = "DVI-D-0"; workspace = "6: reader"; }
      ];
    };
  };
}
