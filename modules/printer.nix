{ pkgs, ... }:

{
  services.printing = {
    enable = true;

    drivers = with pkgs; [
      brlaser
    ];
  };

  hardware.printers = {
    ensureDefaultPrinter = "Brother_DCP_1610W";

    ensurePrinters = [
      {
        name = "Brother_DCP_1610W";
        location = "Home";
        description = "Brother DCP-1610W";

        deviceUri =
          "usb://Brother/DCP-1610W%20series?serial=E75660H5N806553";

        model = "drv:///brlaser.drv/br1610.ppd";

        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
  };
}
