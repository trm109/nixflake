{ pkgs, home-manager, username, ... }:
{
  #----- Home Manager Config -----
  home-manager.users.${username} = {

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };
    programs.chromium.enable = true;
  };

  #----- System Configuration -----
  #programs = {
  #};
  programs = {
    chromium = {
      enable = true;
      extraOpts = {
        "BrowserSignin" = 1;
        "SyncDisabled" = false;
        #"PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "en-US" ];
      };
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
    #firefox.enable = true;
  };
}
