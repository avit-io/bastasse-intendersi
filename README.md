# Bastasse Intendersi

Un documento LaTeX realizzato con **ClassicThesis** e **ArsClassica**, in lingua italiana.

## Compilazione

### Con Nix (consigliato)

#### Opzione 1: Usando shell.nix (più semplice)

```bash
mkdir -p _build
nix-shell shell.nix --command "pdflatex -interaction=nonstopmode -output-directory=_build main.tex"
```

O con direnv (.envrc già presente):
```bash
direnv allow
pdflatex -interaction=nonstopmode -output-directory=_build main.tex
```

#### Opzione 2: Usando flake.nix (vanilla, senza dipendenze aziendali)

```bash
mkdir -p _build
nix develop --command pdflatex -interaction=nonstopmode -output-directory=_build main.tex
```

**Risultato:** Il PDF compilato si trova in `_build/main.pdf`

### Senza Nix

Assicurati di avere installato:
- `texlive` con `scheme-full` (comprende tutti i package necessari)
- `ghostscript` (opzionale, per processamento di immagini)

Poi:

```bash
mkdir -p _build
pdflatex -interaction=nonstopmode -output-directory=_build main.tex
```

## Struttura del progetto

```
.
├── flake.nix          # Configurazione Nix con environment LaTeX
├── flake.lock         # Lock file per dipendenze Nix
├── main.tex           # Documento principale
├── _build/            # Output della compilazione (PDF e file intermedi)
└── README.md          # Questo file
```

## Output

Il file compilato si trova in:

```
_build/main.pdf
```

## Note

- Il documento usa lo stile **ClassicThesis** di André Miede
- Personalizzazioni di **ArsClassica** di Lorenzo Pantieri
- Configurazione per stampa fronte singolo (oneside)
- Lingua: italiano

## Troubleshooting

Se `pdflatex` non trova i package LaTeX richiesti:

1. Assicurati di avere `texlive.combined.scheme-full` installato
2. Se usi Nix, ricrea l'ambiente: `nix flake update && nix develop`
3. Controlla che il file `main.tex` sia nel percorso corretto
