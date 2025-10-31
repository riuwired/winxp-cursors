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

          # Copy all cursor files (no extension)
          cp -r cursors/* $out/share/icons/WinXP/cursors/

          # Copy index.theme
          cp index.theme $out/share/icons/WinXP/

          cd $out/share/icons/WinXP/cursors

          # Create symlinks for X11 standard names
          # Default pointer
          ln -sf default_arrow default
          ln -sf default_arrow left_ptr
          ln -sf default_arrow arrow
          ln -sf default_arrow top_left_arrow

          # Link/pointer (hand)
          ln -sf default_link pointer
          ln -sf default_link hand
          ln -sf default_link hand1
          ln -sf default_link hand2
          ln -sf default_link pointing_hand

          # Text/beam
          ln -sf default_beam text
          ln -sf default_beam xterm
          ln -sf default_beam ibeam

          # Busy/wait
          ln -sf default_busy wait
          ln -sf default_wait left_ptr_watch
          ln -sf default_wait half-busy

          # Move - THIS IS THE IMPORTANT ONE for Super+mouse1
          ln -sf default_link move
          ln -sf default_link fleur
          ln -sf default_link size_all
          ln -sf default_link all-scroll

          # Cross/precision
          ln -sf default_cross cross
          ln -sf default_cross crosshair
          ln -sf default_cross tcross

          # Not allowed
          ln -sf default_no not-allowed
          ln -sf default_no forbidden
          ln -sf default_no no-drop
          ln -sf default_no circle

          # Help
          ln -sf default_helpsel help
          ln -sf default_helpsel question_arrow
          ln -sf default_helpsel whats_this

          # Pen/pencil
          ln -sf default_pen pencil
          ln -sf default_pen draft

          # Person
          ln -sf default_person person

          # Pin
          ln -sf default_pin pin

          # Resize cursors
          ln -sf default_size1 size_ver
          ln -sf default_size1 v_double_arrow
          ln -sf default_size1 sb_v_double_arrow
          ln -sf default_size1 n-resize
          ln -sf default_size1 s-resize
          ln -sf default_size1 ns-resize

          ln -sf default_size2 size_fdiag
          ln -sf default_size2 fd_double_arrow
          ln -sf default_size2 nw-resize
          ln -sf default_size2 se-resize
          ln -sf default_size2 nwse-resize

          ln -sf default_size3 size_hor
          ln -sf default_size3 h_double_arrow
          ln -sf default_size3 sb_h_double_arrow
          ln -sf default_size3 e-resize
          ln -sf default_size3 w-resize
          ln -sf default_size3 ew-resize

          ln -sf default_size4 size_bdiag
          ln -sf default_size4 bd_double_arrow
          ln -sf default_size4 ne-resize
          ln -sf default_size4 sw-resize
          ln -sf default_size4 nesw-resize

          ln -sf default_up up_arrow
        '';

        meta = {
          description = "Windows XP cursor theme for Linux";
          platforms = nixpkgs.lib.platforms.linux;
        };
      };
    });
  };
}
