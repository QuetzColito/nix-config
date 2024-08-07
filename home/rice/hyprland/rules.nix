{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      #"blur, ^(gtk-layer-shell)$"
      #"blur, ^(launcher)$"
      "xray 0, ^(launcher)$"
      # "ignorezero, ^(gtk-layer-shell)$"
      "xray 1, ^(gtk-layer-shell)$"
      "ignorezero, ^(launcher)$"
      "blur, notifications"
      "ignorezero, notifications"
      "blur, bar"
      "ignorezero, bar"
      "ignorezero, ^(gtk-layer-shell|anyrun)$"
      "blur, ^(gtk-layer-shell|anyrun)$"
      "noanim, launcher"
      "noanim, bar"
      "noanim, ^(steam_app.*)$"
    ];
    windowrulev2 = [
      # only allow shadows for floating windows
      "noshadow, floating:0"
      "tile, class:^DesktopEditors$"

      # OWOPACITY
      "opacity 0.85, class:codium-url-handler"
      "forcergbx, class:codium-url-handler"
      "noblur, class:Alacritty"
      "noblur, class:^kitty$"
      "noblur, class:^foot$"
      "opacity 0.85, title:^(.*Thunar.*)$"
      "forcergbx, title:^(.*Thunar.*)$"
      "opacity 0.85, class:^file-roller$"
      "forcergbx, class:^file-roller$"
      "opacity 0.95, title:^(.*Discord.*)$"
      "forcergbx, title:^(.*Discord.*)$"
      "opacity 0.9, class:^steam$"
      "forcergbx, class:^steam$"
      "opacity 0.95, class:^(YouTube Music)$"
      "forcergbx, class:^(YouTube Music)$"
      "opacity 0.8 0.8 1, class: firefox"
      "opacity 1 override 1 override 1 override ,title:^(.*YouTube — Mozilla Firefox)|(.*Crunchyroll.* — Mozilla Firefox)$"


      # imported stuff
      "idleinhibit focus, class:^(mpv)$"
      "idleinhibit focus,class:foot"
      "idleinhibit fullscreen, class:^(firefox)$"

      # couldnt get it to work, but keeping it here just in case
      "float, class:^(awakened-poe-trade)$"
      "xray 0, class:^(awakened-poe-trade)$"
      "noblur, class:^(awakened-poe-trade)$"

      "float, class:^(org.gnome.Loupe)$"
      "float, class:^(vlc)$"
      "float, class:^(xdg-desktop-portal-gtk)$"
      "float, class:^(moe.launcher.the-honkers-railway-launcher)$"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      "float,class:udiskie"

      #"workspace special silent,class:^(pavucontrol)$"

      "float, class:^(imv)$"
      "noinitialfocus, title:^(Steam)$"

      # throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      "workspace 1, class:^(vesktop)$"
      "workspace 1, class:^(YouTube Music)$"
      "workspace 6, class:^(steam_app.*)$"
      "workspace 9, title:^(Steam)$"
      "workspace 5, class:codium-url-handler"
    ];
    workspace = [
        "6, gapsout:0, rounding:false, bordersize:0"
    ];
  };
}
