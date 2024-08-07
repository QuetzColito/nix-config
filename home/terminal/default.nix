{
  pkgs,
  ...
} : {
    imports = [
        ./zsh.nix
        ./yazi.nix
    ];


    programs = {

        git = {
            enable = true;

            extraConfig = {
                init.defaultBranch = "main";

                user = {
                    email = "stefan.lahne@gmx.de";
                    name = "Stefan Lahne";
                };
            };
        };

        oh-my-posh = {
            enable = true;
            enableZshIntegration = true;
            settings = import ./ohmyposh.nix;
        };

        zellij = {
            enable = true;
        };
    };

    home.packages = with pkgs; [
        starship
        btop
        cmatrix
        sl
        jq
        python3
        fastfetch
        pandoc
        texliveSmall
        gnumake
        zip
        unar
        imagemagick
        lazygit
        ffmpeg
        fzf
        fd
    ];
}
