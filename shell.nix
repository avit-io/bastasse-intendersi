{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    texlive.combined.scheme-full
    ghostscript
    python3
    perl
  ];

  shellHook = ''
    echo "📄 LaTeX development environment"
    echo "texlive: $(pdflatex --version | head -1)"
  '';
}
