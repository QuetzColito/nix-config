{
  ...
} : {
    # This is what sane defaults looks like o.o
    programs.foot = {
        enable = true;
    };

    home.sessionVariables = {
        TERMINAL = "foot";
    };
}
