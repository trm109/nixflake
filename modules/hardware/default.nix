{ ... }:
{
  imports = [
    #./asus # For Asus devices
    ./audio
    ./bluetooth
    ./network
    #./nvidia # For devices with NVIDIA GPUs
    #./printer # For devices with printing capabilities.
  ];
}
