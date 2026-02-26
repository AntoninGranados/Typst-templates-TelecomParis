# Typst templates for Telecom Paris

> [!NOTE]
> This was made specifically for Telecom Paris students, but it can be easily adapted for other universities and most of the files don't even specify the university.

## Content
This repository contains multiple Typst ([Typst Docs](https://typst.app/docs/)) templates to take course notes or create reports. It was made specifically for Telecom Paris but can be used for any other universities.


## Usage
These templates should be at the root of your notes folder. See the `./templates_examples/` folder for usage examples.

To compile a file, you should be at the root of the repository (ie. where the templates are) and run this command:
```bash
typst compile PATH/TO/YOUR/FILE.typ --root .
```

If you want to be in watch mode, run:
```bash
typst watch PATH/TO/YOUR/FILE.typ --root .
```

> [!TIP]
> You can also run where the file is located by adjusting the `--root` flag to point to the root of the repository. But in my experience this can cause issues with some of the files.
