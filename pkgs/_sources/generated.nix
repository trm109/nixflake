# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  ryzen_smu = {
    pname = "ryzen_smu";
    version = "e61177d0ddaebfaeca52094b20a2289287a0838b";
    src = fetchgit {
      url = "https://gitlab.com/leogx9r/ryzen_smu.git";
      rev = "e61177d0ddaebfaeca52094b20a2289287a0838b";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-n4uWikGg0Kcki/TvV4BiRO3/VE5M6/KopPncj5RQFAQ=";
    };
    date = "2023-06-16";
  };
}