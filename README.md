# Resume

Built using [Timmy Chan's data-science-tech-resume-template](https://github.com/TimmyChan/data-science-tech-resume-template) (OFFICIAL PUBLIC OVERLEAF TEMPLATE). Intended to change the format to my own liking

Todos:

- [ ] Add a cover letter template

## Requirements

By default, the resume is generated using [`tectonic`](https://tectonic-typesetting.github.io/book/latest/index.html). You can use any other Latex compiler if you want. The project includes a `Makefile` for build automation.

### Additional Tools (Optional but Recommended)

#### chktex (Linting)

For checking LaTeX files for common errors and style issues:

**Linux (Debian/Ubuntu):**

```bash
sudo apt-get install chktex
```

**Linux (Arch):**

```bash
sudo pacman -S chktex
```

**Linux (Fedora):**

```bash
sudo dnf install chktex
```

**macOS (Homebrew):**

```bash
brew install chktex
```

#### latexindent (Formatting)

For automatic formatting of LaTeX files:

**Installation via Perl CPAN:**

```bash
cpan App::latexindent
```

**macOS (Homebrew):**

```bash
brew install latexindent
```

## Usage

1. **Edit the content files:**
   - Main resume content: `src/resume.tex`
   - Personal information: `src/personal_info.tex`
   - Section content: `src/sections/*.tex`
   - Styling: `src/PKResume.sty`

2. **Build the resume:**

   ```bash
   make

   # or build preserving intermediate files and logs
   make TEX_DEBUG=1

   # or use tectonic but requires 'Tectonic.toml' configuration
   tectonic -X build src/resume.tex

   # or without config file
   tectonic -X compile src/resume.tex --outfmt pdf --outdir build
   ```

3. **Find the output:**
   - The generated PDF will be in the `build/` folder as `resume.pdf`

### Building Variants

This project supports multiple resume variants for different purposes:

```bash
# Build all available resume variants (defined in Makefile)
make all-variants

# Build developer-focused resume
make resume-dev

# Build management-focused resume
make resume-mgmt

# Build variant using variables
make TEX_INPUT="name.tex" TEX_OUTPUT="name.pdf"
```

## `make` Commands

### Linting LaTeX Files

Check LaTeX files for common errors and style issues using [chktex](https://www.nongnu.org/chktex/):

```bash
make lint               # Run chktex on all .tex and .sty files

# or
chktex -q -wall -n3 -n22 -n30 src/*.tex src/sections/*.tex  # Check specific files
```

### Formatting LaTeX Files

Automatically format all LaTeX files using [latexindent.pl](https://latexindentpl.readthedocs.io/en/latest/index.html):

```bash
make format             # Format all LaTeX files with latexindent

make check-format       # Check formatting without modifying files

# or
latexindent -l -w -s -m -c .backups src/resume.tex  # Format specific file
```

### Cleanup

Remove all generated files and build artifacts:

```bash
make clean
```

## Project Variants

This resume project includes several variants tailored for different purposes:

- **resume.tex**: Main/generic resume
- **resume-dev.tex**: Developer-focused resume with technical skills emphasis
- **resume-mgmt.tex**: Management-focused resume with leadership emphasis

Each variant uses the same styling and structure but highlights different aspects of your experience.
