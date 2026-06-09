---
title: Hints for processing PDF-files
author: Dr. Bastian Ebeling
date: 22.12.2022
---

## Extract pictures

With the help of the tool `pdfimages` (part of the package [poppler-utils](http://poppler.freedesktop.org/)) one can extract embedded images.
Just use the following command:

```bash
pdfimages -p -all PDF_FILE_NAME.pdf IMAGE_NAME_PREFIX
```

The options mean the following:

- `-p` leads to the page number beeing within the file name
- `-all` leads to extraction as far as possible to their original file formats

## Extract embedded files

With the help of the tool `pdfdetach` (part of the package [poppler-utils](http://poppler.freedesktop.org/)) one can extract embedded files from PDFs.

## convert PDF pages to images

```bash
for a in *.pdf ; do pdftoppm -jpeg "$a" "${a%.*}" ; pdftoppm -png "$a" "${a%.*}" ; done
```
