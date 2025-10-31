{
  description = "Windows XP cursor theme";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.stdenv.mkDerivation {
        pname = "winxp-cursors";
        version = "1.0";

        src = ./.;

        installPhase = ''
          mkdir -p $out/share/icons/WinXP/cursors

          cp cursors/*.cur $out/share/icons/WinXP/cursors/

          cp index.theme $out/share/icons/WinXP/

          cd $out/share/icons/WinXP/cursors

          # Default pointer
          ln -sf default_arrow.cur default
          ln -sf default_arrow.cur left_ptr
          ln -sf default_arrow.cur arrow
          ln -sf default_arrow.cur top_left_arrow

          # Link/pointer (hand)
          ln -sf default_link.cur pointer
          ln -sf default_link.cur hand
          ln -sf default_link.cur hand1
          ln -sf default_link.cur hand2
          ln -sf default_link.cur pointing_hand

          # Text/beam
          ln -sf default_beam.cur text
          ln -sf default_beam.cur xterm
          ln -sf default_beam.cur ibeam

          # Busy/wait
          ln -sf default_busy.cur wait
          ln -sf default_wait.cur left_ptr_watch
          ln -sf default_wait.cur half-busy

          # Move
          ln -sf default_move.cur move
          ln -sf default_move.cur fleur
          ln -sf default_move.cur size_all
          ln -sf default_move.cur all-scroll

          # Cross/precision
          ln -sf default_cross.cur cross
          ln -sf default_cross.cur crosshair
          ln -sf default_cross.cur tcross

          # Not allowed
          ln -sf default_no.cur not-allowed
          ln -sf default_no.cur forbidden
          ln -sf default_no.cur no-drop
          ln -sf default_no.cur circle

          # Help
          ln -sf default_helpsel.cur help
          ln -sf default_helpsel.cur question_arrow
          ln -sf default_helpsel.cur whats_this

          # Pen/pencil
          ln -sf default_pen.cur pencil
          ln -sf default_pen.cur draft

          # Person
          ln -sf default_person.cur person

          # Pin
          ln -sf default_pin.cur pin

          # Resize cursors
          ln -sf default_size1.cur size_ver
          ln -sf default_size1.cur v_double_arrow
          ln -sf default_size1.cur sb_v_double_arrow
          ln -sf default_size1.cur n-resize
          ln -sf default_size1.cur s-resize
          ln -sf default_size1.cur ns-resize

          ln -sf default_size2.cur size_fdiag
          ln -sf default_size2.cur fd_double_arrow
          ln -sf default_size2.cur nw-resize
          ln -sf default_size2.cur se-resize
          ln -sf default_size2.cur nwse-resize

          ln -sf default_size3.cur size_hor
          ln -sf default_size3.cur h_double_arrow
          ln -sf default_size3.cur sb_h_double_arrow
          ln -sf default_size3.cur e-resize
          ln -sf default_size3.cur w-resize
          ln -sf default_size3.cur ew-resize

          ln -sf default_size4.cur size_bdiag
          ln -sf default_size4.cur bd_double_arrow
          ln -sf default_size4.cur ne-resize
          ln -sf default_size4.cur sw-resize
          ln -sf default_size4.cur nesw-resize

          ln -sf default_up.cur up_arrow
        '';

        meta = {
          description = "Windows XP cursor theme for Linux";
          platforms = nixpkgs.lib.platforms.linux;
        };
      };
    });
  };
}
