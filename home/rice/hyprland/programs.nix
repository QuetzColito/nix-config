{
  pkgs,
  ...
} : {
    home.packages = with pkgs; [
        xorg.xrandr
        wf-recorder
        brightnessctl
        slurp
        grim
        hyprpicker
        grimblast
        bibata-cursors
        wl-clip-persist
        wl-clipboard
        xclip
        # pngquant
        cliphist
        playerctl
        pamixer
        pavucontrol
        socat
        (writeShellScriptBin
          "handle_monitor_connect"
          ''
            handle() {
              case $1 in monitoradded*)
                hyprctl dispatch moveworkspacetomonitor "1 1"
                hyprctl dispatch moveworkspacetomonitor "2 1"
                hyprctl dispatch moveworkspacetomonitor "4 1"
                hyprctl dispatch moveworkspacetomonitor "5 1"
              esac
            }

            socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/\$\{HYPRLAND_INSTANCE_SIGNATURE\}/.socket2.sock" | while read -r line; do handle "$line"; done
          '')
        (writeShellScriptBin
          "pauseshot"
          ''
            ${hyprpicker}/bin/hyprpicker -r -z &
            picker_proc=$!

            ${grimblast}/bin/grimblast save area - | tee ~/pics/ss$(date +'screenshot-%F') | wl-copy

            kill $picker_proc
          '')
        (writeShellScriptBin
          "pauseshotarea"
          ''
            ${hyprpicker}/bin/hyprpicker -r -z &
            picker_proc=$!

            grim -g \"$(slurp)\" - | wl-copy

            kill $picker_proc
          '')
    ];
}
