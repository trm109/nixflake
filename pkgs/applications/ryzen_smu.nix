{ stdenv, lib, linux, pahole, sources }: 

stdenv.mkDerivation {
  inherit (sources.ryzen_smu) src version;
  pname = let
    pname = "ryzen-smu";
  kernel-name = builtins.tryEval "${pname}-${linux.version}";
  in if kernel-name.success then kernel-name.value else pname;

  sourceRoot = "source";

  nativeBuildInputs = [ pahole ];
  kernelVersion = linux.modDirVersion;
  modules = [ "ryzen-smu" ];
  makeFlags = kernelMakeFlags linux;
  enableParallelBuilding = true;

  installPhase = ''
    install -Dm644 -t $out/lib/modules/$kernelVersion/kernel/drivers/ ryzen_smu.ko
    '';

  meta.platforms = lib.platforms.linux;
};
