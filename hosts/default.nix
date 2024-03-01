{ hostname, ... }:
{
  imports = [
    ./${hostname}
    ./locale-config
  ];
}
