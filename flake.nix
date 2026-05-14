{
  description = "Bastasse Intendersi - LaTeX document";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/25.11";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs:
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              (texlive.withPackages (ps: with ps; [ scheme-full latexmk ]))
              ghostscript
              python3
              perl
              glibcLocales
            ];

            LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
            LANG = "en_US.UTF-8";
            LC_ALL = "en_US.UTF-8";

            shellHook = ''
              echo "📄 LaTeX development environment"
              echo "texlive: $(pdflatex --version | head -1)"
              echo "latexmk: $(latexmk -version | head -1)"
            '';
          };
        }
      );
    };
}

