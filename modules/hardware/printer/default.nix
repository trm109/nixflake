{
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  #UTech Printer
  hardware.printers = {
    ensurePrinters = [
      {
	name = "UTech_Printer";
	location = "CARE_Center";
	deviceUri = "lpd://129.22.99.235/queue";
	model = "drv:///sample.drv/generic.ppd";
      }
    ];
  };
}
