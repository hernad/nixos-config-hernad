{ config, pkgs, ... }:

{
  bring-out.siteName = "sa1";
  #bring-out.staticIPv4.defaultGateway = "10.0.99.254";
  bring-out.cnameTarget = "sa1.site.staging.bring-out.me.";
}