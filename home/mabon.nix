{ lib, ... }:
let
  wallpaper1 = "~/nixos/wallpaper/side.jpg";
  wallpaper2 = "~/nixos/wallpaper/main.jpg";
in
{
    home = {
        username = "arthezia";
        homeDirectory = "/home/arthezia";
        stateVersion = "23.11"; # Please read the comment before changing.
    };

    imports = [
        ./home.nix
    ];

    programs.hyprlock.settings.background.path = wallpaper1;

    services.hyprpaper.settings = {
        preload = [
            "${wallpaper1}"
            "${wallpaper2}"
        ];

        wallpaper = [
            "eDP-1,${wallpaper1}"
            "HDMI-A-1,${wallpaper2}"
        ];
    };

    programs.waybar.settings.mainbar.modules-right = ["battery"];

    wayland.windowManager.hyprland.settings = {
        input.sensitivity = lib.mkForce 1;
        exec-once = [
            "xrandr --output eDP-1 --primary"
            "xrandr --output HDMI-A-1 --primary"
        ];
        workspace = [
            "1, monitor:eDP-1"
            "2, monitor:eDP-1"
            "3, monitor:eDP-1"
            "4, monitor:HDMI-A-1"
            "5, monitor:HDMI-A-1"
            "6, monitor:HDMI-A-1"
            "7, monitor:eDP-1"
            "8, monitor:eDP-1"
            "9, monitor:eDP-1"
        ];
        monitor = [
            ",highrr,auto,1"
            "Unknown-1,disable"
            "eDP-1,preferred,0x0,1"
            "HDMI-A-1,preferred,-1920x0,1"
        ];

    };
    programs.vscode.userSettings."workbench.colorTheme"= lib.mkForce "Tokyo Night Storm";
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
