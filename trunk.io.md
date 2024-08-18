---
title: trunk.io
date: 11.01.2023
author: Dr. Bastian Ebeling
---

## Installation

Following steps from <https://docs.trunk.io/docs/install> interactive one can run `curl https://get.trunk.io -fsSL | bash` or without questions `curl https://get.trunk.io -fsSL | bash -s -- -y`.

## Initialization in a repo

The steps from <https://docs.trunk.io/docs/initialize-trunk-in-a-git-repo> lead to.

## Configuration

Most config is done in the file `.trunk/trunk.yaml`.
I often use trunk to validate my python programs.
You might find something similar to

```yaml
runtimes:
  enabled:
    - go@1.21.0
    - node@18.12.1
    - python@3.10.6
actions:
```

in your file.

But what if you quickly want to replace all your trunk usages to work with python >= 3.11?
Unfortunately you need to supply the full version - and only can use from a limited set.
trunk uses the distributions available from <https://github.com/indygreg/python-build-standalone/releases>.

First, you need to qualify the python version complete - meaning `>=3.11.0` and then put it into the file.
But could that be simplified?

YES: Here is, what did the trick for me:

```sh
sed --in-place=.sedbackup --regexp-extended 's/(.*- python@)(.*)/\13.11.8/g' trunk.yaml
```

If you want to do that recursivly on every `.trunk/trunk.yaml` file, the following command might help:

```sh
find . -wholename "*/.trunk/trunk.yaml" -not -path "*.venv*" -print -execdir sed --in-place=.sedbackup --regexp-extended 's/(.*- python@)(.*)/\13.11.8/g' trunk.yaml \{\} \;
```

This is also explained in <regexr.com/84sni>.

For more details on RegExp see <https://regex101.com/> or <https://regexr.com/> or <>.
