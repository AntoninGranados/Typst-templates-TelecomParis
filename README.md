# Typst templates for Telecom Paris

> [!NOTE]
> This was made specifically for Telecom Paris students, but it can be easily adapted for other universities and most of the files don't even specify the university.

## Content
This repository contains multiple Typst ([Typst Docs](https://typst.app/docs/)) templates for taking course notes or creating reports. It was made specifically for Télécom Paris, but it can be used for other universities with a few modifications.


## Usage
### Project integration
See the `./templates_examples/` folder for implementation examples. In general, your document should look something like this:
```typst
#import "PATH/TO/THE/TEMPLATE.typ": *

#show: TEMPLATE_NAME.with(
  template_parameter_1: "value 1",
  template_parameter_2: [value 2],
  template_parameter_3: lorem(100),
)

BODY
```

### Compilation
These templates should be at the root of your notes folder.

To compile a file, you should be at the root of the repository (i.e., where the templates are) and run this command:
```bash
typst compile PATH/TO/YOUR/FILE.typ --root .
```

If you want to be in watch mode, run:
```bash
typst watch PATH/TO/YOUR/FILE.typ --root .
```

> [!TIP]
> You can also run the command from the file's location by adjusting the `--root` flag to point to the root of the repository. But in my experience, this can cause issues with some files.
