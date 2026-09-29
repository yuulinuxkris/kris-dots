{ pkgs, ... }:

{

  services.tailscale.enable = true;

  services.pipewire.extraConfig.pipewire."92-rates" = {
  "context.properties" = {
    "default.clock.rate" = 48000;
    "default.clock.allowed-rates" = [ 44100 48000 ];
    };
  };

  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart =
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };
}
