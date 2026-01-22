# Resume

Copied from [Timmy Chan's data-science-tech-resume-template](https://github.com/TimmyChan/data-science-tech-resume-template) (OFFICIAL PUBLIC OVERLEAF TEMPLATE). Intended to change the format to my own liking

Todos:

- [x] Add a Makefile to automate the process
- [ ] Change the format to my own liking
- [ ] Add a cover letter template
- [ ] Make it more modular

## Requirements

By default, the resume is generated using [`tectonic`](https://tectonic-typesetting.github.io). You can use any other Latex compiler if you want. The project includes a `Makefile` for build automation, but you can also update it to use your preferred compiler.

## Usage

1. Install `tectonic` or any other Latex compiler
2. Clone the repository
3. Edit the content files in `src/` (`resume.tex`, `personal.tex`, `sections/*.tex`)
4. Run `make` or directly run `tectonic -X build` (or your preferred compiler) to generate the PDF
5. The generated PDF will be in the `build/` folder

The `make clean` command can be used to remove the generated files

## Folder Structure

All the files are in the `src` folder. The main files are:

- `resume.tex`: Main file that contains the content of the resume
- `PKResume.sty`: Contains all the formatting and style information for the resume
- `resume.pdf`: The output PDF file
