{ config, pkgs, ... }:
{
  services.polybar = {
    enable = false;
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      iwSupport = true;
      nlSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };
    script = ''
      # Terminate already running bar instances
      # killall -q polybar

      # killall doesn't seem to kill the scripts started by the bar.
      # So, the following ways work better
      # kill $(ps aux | grep 'polybar' | awk '{print $2}')  >/dev/null 2>&1
      kill -9 $(pgrep -f 'polybar') >/dev/null 2>&1

      polybar-msg cmd quit >/dev/null 2>&1

      # Wait until the processes have been shut down
      while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

      # Launch bar1 and bar2
      polybar top &
    '';
    config = {
      "bar/top" = {
        monitor = "\${env:MONITOR:HDMI-0}";
        width = "95%";
        height = "3%";
        modules-center = "date";
        offset-x = 160;
        offset-y = 8;
        font-0 = "Fira Code Nerd Font Mono:size=10";
        override-redirect = true;
        wm-restack = "i3";
        tray-transparent = false;
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d.%m.%y";
        time = "%H:%M";
        label = "%time%  %date%";
      };
    };
  };
}
