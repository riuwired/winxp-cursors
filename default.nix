{
  stdenv,
  pkgs,
  lib,
  fetchzip,
}: let
  themeName = "winxp-cursors";
  themeSrc = pkgs.fetchFromGitHub {
    owner = "riuwired";
    repo = "winxp-cursors";
    rev = "b77d7bc1a592c88200c646bd184d8bd8fc5a2e13";
    hash = "sha256-bTwOICKj5Va19uZXwmEEgcZPwOLcqWoV7qpafFrUJ+4=";
  };
in
  stdenv.mkDerivation {
    pname = "winxp-cursor-theme";
    version = "1.0";

    src = themeSrc;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r ${themeName} $out/share/icons/${themeName}
    '';

    meta = with lib; {
      description = "WinXP Cursor for linux";
      homepage = "https://github.com/riuwired/winxp-cursors";
      license = licenses.unfree;
      platforms = platforms.linux;
    };
  }
