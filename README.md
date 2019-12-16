
# Overview

Tooling for generating OBP's PDF and HTML readers from metadata.

This suite installs the relevant processing tools, and runs them on a
set of three files:

* `book.pdf`
* `book.json`

and yields the conventional HTML pages and image output (in odd locations).

To install:

```
    ./setup
```

To run:
```
    ./run prefix
```

Where `prefix` is the common name for your book files, e.g., `Wolfthal-Pogroms_Ukraine`, entails that you have files `Wolfthal-Pogroms_Ukraine.json`,
`Wolfthal-Pogroms_Ukraine.pdf`

# To do

Generate the JSON file directly from a metadata database. Ultimately the
invocation ought to look something like this:
```
    ./run 10.11647/OBP.0125
```

## Run with docker
```
docker run --rm \
  -v /path/to/local.pdf:/ebook_automation/pdf_file.pdf \
  -v /path/to/local.json:/ebook_automation/pdf_file.json \
  -v /path/to/output:/ebook_automation/pdf_to_book_reader/output \
  openbookpublishers/obp-gen-pdfreader
```

Alternatively you may clone the repo, build the image using `docker build . -t some/tag` and run the command above replacing `openbookpublishers/obp-gen-pdfreader` with `some/tag`.

## DEV
### Submodules
External projects are managed via _git submodules_. **pdf_to_book_reader** module can be updated with confidence, whereas the other two projects require to specific branches/commits to allow `obp-gen-readers` to work properly. In particular:
 -  **PDF-Mine** needs to track the `obp` branch;
 -  **pdfminer** head needs to be `14fd0fd2d6ef4e709731377decc6a8c119e5e9d6`.

Failing to meet this requirements will break `obp-gen-readers`. Please, check [this earlier version](https://github.com/OpenBookPublishers/obp-gen-readers/blob/f730a287ec80b4c808c1d2d36ccd12d27a7c7aba/setup) of the setup script if problems arise.
