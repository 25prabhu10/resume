# Resume and Cover Letter Templates

Personal resume and cover-letter source files built using [Timmy Chan's data-science-tech-resume-template](https://github.com/TimmyChan/data-science-tech-resume-template) (OFFICIAL PUBLIC OVERLEAF TEMPLATE). Intended to change the format to my own liking

## Requirements

By default, the resume is generated using [`tectonic`](https://tectonic-typesetting.github.io/book/latest/index.html). You can use any other Latex compiler if you want. The project includes a `Makefile` for build automation

## Usage

1. Install `tectonic` or any other Latex compiler
2. Clone the repository
3. Edit the content files in `src/`:
   - Main resume content: `src/resume.tex`
   - Personal information: `src/data/personal-info.tex`
   - Section content: `src/sections/*.tex`
   - Styling: `src/pkresume.sty`

4. Build the resume to generate the PDF:

   ```bash
   make

   # or build preserving intermediate files and logs
   make TEX_DEBUG=1

   # or use tectonic but requires 'Tectonic.toml' configuration
   tectonic -X build src/resume.tex

   # or without config file
   tectonic -X compile src/resume.tex --outfmt pdf --outdir build
   ```

5. The generated PDF will be in the `build/` folder as `resume.pdf`

### Building Resume Variants

This project supports multiple resume variants for different purposes:

```bash
# build all available resume variants (defined in Makefile)
make all-variants

# build specific variant by name (e.g. 'resume-dev')
make [variant-name]

# build variant using variables (for variants not defined in Makefile)
make TEX_INPUT="name.tex" TEX_OUTPUT="name.pdf"
```

### Build Cover Letter

1. Edit the content files in `src/`:
   - Main cover letter structure: `src/cover-letter.tex`
   - Personal information: `src/data/personal-info.tex`
   - Cover letter information: `src/data/cover-letter-info.tex`
   - Cover letter content: `src/sections/cover-letter/body.tex`
   - Styling: `src/pkcoverletter.sty`

2. Build the cover-letter to generate the PDF:

   ```bash
   make cover-letter

   # or build preserving intermediate files and logs
   make TEX_DEBUG=1 cover-letter

   # or use tectonic but requires 'Tectonic.toml' configuration
   tectonic -X build src/cover-letter.tex

   # or without config file
   tectonic -X compile src/cover-letter.tex --outfmt pdf --outdir build
   ```

## Other Commands

### Linting LaTeX Files

Check LaTeX files for common errors and style issues using [chktex](https://www.nongnu.org/chktex/):

```bash
# run chktex on all .tex and .sty files
make lint

# or check specific files
chktex -q -wall -n3 -n22 -n30 src/resume.tex
```

### Formatting LaTeX Files

Automatically format all LaTeX files using [latexindent.pl](https://latexindentpl.readthedocs.io/en/latest/index.html):

```bash
# format all LaTeX files with latexindent
make format

# check formatting without modifying files
make check-format

# or format specific file
latexindent -l -w -s -m -c .backups src/resume.tex
```

### Removing Generated Files

Remove all generated files and build artifacts:

```bash
make clean
```

## Example Variants

This resume project includes example variants for different purposes:

- **resume.tex**: Main/generic resume
- **resume-dev.tex**: Developer-focused resume with technical skills emphasis
- **resume-mgmt.tex**: Management-focused resume with leadership emphasis

Each variant uses the same styling and structure but highlights different aspects of your experience.
