{ lib, config, pkgs, hostType, ... }:
let 
  cfg = config.modules.apps.browser;
in
{
  options.modules.apps.browser = {
    enable = lib.mkEnableOption "Enables browser" // {
      default = if hostType == "desktop" then true
	else if hostType == "server" then false
	else true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      chromium
    ];
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
    };
  };
}
