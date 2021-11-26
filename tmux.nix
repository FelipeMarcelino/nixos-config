{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = false;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = false;
    escapeTime = 0;
    newSession = true;
    shortcut = "a";
    extraConfig = ''
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      unbind i
      bind-key i set -g status

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' ''\'''\' 'select-pane - L' }
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' ''\'''\' 'select-pane -D' }
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' ''\'''\' 'select-pane -U' }
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' ''\'''\' 'select-pane -R' }

      bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' ''\'''\' 'select-pane -L'
      bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' ''\'''\' 'select-pane -D'
      bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' ''\'''\' 'select-pane -U'
      bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' ''\'''\' 'select-pane -R'

    '';
  };
}
