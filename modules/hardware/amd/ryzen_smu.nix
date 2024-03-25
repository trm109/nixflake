# ryzen_smu.nix
# https://github.com/leogx9r/ryzen_smu

## git clone https://gitlab.com/leogx9r/ryzen_smu.git
## cd ryzen_smu
## 
## make
## sudo insmod ryzen_smu.ko
{
  lib,
    stdenv,
    fetchzip,
}:

stdenv.mkDerivation {
  pname = "hello";
  version = "2.12.1";

  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
    sha256 = lib.fakeSha256;
  };
}
