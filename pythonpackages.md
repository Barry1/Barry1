# Python Packages of interest

This is just a small list of packages, which are interesting (for me). Most of them are also found within my [GitHub Stars](https://github.com/Barry1?language=python&tab=stars).

- [Python Packages of interest](#python-packages-of-interest)
  - [List](#list)
  - [Description](#description)
    - [black](#black)
    - [darker](#darker)
    - [hvplot](#hvplot)
    - [matplotlib](#matplotlib)
    - [pandera](#pandera)
    - [pipdeptree](#pipdeptree)
    - [pip-tools](#pip-tools)
    - [poetry](#poetry)
    - [psutil](#psutil)
    - [SQLAlchemy](#sqlalchemy)
    - [tqdm](#tqdm)
    - [uncertainties](#uncertainties)
    - [vaex](#vaex)
  - [Tips and Tricks](#tips-and-tricks)

## List

| Packagename                                | Group        |
| :----------------------------------------- | :----------- |
| [SQLAlchemy](pythonpackages.md#SQLAlchemy) | Database     |
| [dask](pythonpackages.md#dask)             | Dataframe    |
| [pandas](pythonpackages.md#pandas)         | Dataframe    |
| [pandera](pythonpackages.md#pandera)       | Dataframe    |
| [vaex](pythonpackages.md#vaex)             | Dataframe    |
| [black](pythonpackages.md#black)           | Formatting   |
| [darker](pythonpackages.md#darker)         | Formatting   |
| \[uncertainties\]                          | Math         |
| [pip-tools](pythonpackages.md#pip-tools)   | OS           |
| [pipdeptree](pythonpackages.md#pipdeptree) | OS           |
| [poetry](pythonpackages.md#poetry)         | OS           |
| [psutil](pythonpackages.md#psutil)         | OS           |
| [bokeh](pythonpackages.md#bokeh)           | Plot         |
| [hvplot](pythonpackages.md#hvplot)         | Plot         |
| [matplotlib](pythonpackages.md#matplotlib) | Plot         |
| [tqdm](pythonpackages.md#tqdm)             | Progress Bar |

## Description

### black

The uncompromising Python code formatter.

[Homepage](https://black.readthedocs.io/en/stable/) [Repository](https://github.com/psf/black)

### darker

Apply Black formatting only in regions changed since last commit.

[Homepage](about:blank) [Repository](https://github.com/akaihola/darker)

### hvplot

A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews.

[Homepage](https://hvplot.holoviz.org/) [Repository](https://github.com/holoviz/hvplot)

### matplotlib

plotting with Python

[Homepage](about:blank) [Repository](https://github.com/matplotlib/matplotlib)

### pandera

A light-weight and flexible validation package for pandas data structures.

[Homepage](https://pandera.readthedocs.io/) [Repository](https://github.com/pandera-dev/pandera)

### pipdeptree

Command line utility to show dependency tree of packages.

[Homepage](about:blank) [Repository](https://github.com/naiquevin/pipdeptree)

### pip-tools

A set of tools to keep your pinned Python dependencies fresh. I most often use the following calls

```bash
python -m pip install --upgrade pip setuptools
python -m piptools compile --rebuild
python -m pip install --upgrade -r requirements.txt
```

[Homepage](about:blank) [Repository](https://github.com/jazzband/pip-tools)

### poetry

Python dependency management and packaging made easy. [Homepage](https://python-poetry.org/) [Repository](https://github.com/python-poetry/poetry)

### psutil

Cross-platform lib for process and system monitoring in Python.

[Homepage](about:blank) [Repository](https://github.com/giampaolo/psutil)

### SQLAlchemy

The Python SQL Toolkit and Object Relational Mapper

SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL. SQLAlchemy provides a full suite of well known enterprise-level persistence patterns, designed for efficient and high-performing database access, adapted into a simple and Pythonic domain language.

[Homepage](http://www.sqlalchemy.org/) [Repository](https://github.com/sqlalchemy/sqlalchemy/)

### tqdm

A Fast, Extensible Progress Bar for Python and CLI.

[Homepage](https://tqdm.github.io/) [Repository](https://github.com/tqdm/tqdm)

### uncertainties

The uncertainties package is a free, cross-platform program that transparently handles calculations with numbers with uncertainties (like \(3.14±0.01\)). It can also yield the derivatives of any expression.

[Homepage](https://uncertainties.readthedocs.io/) [Repository](https://github.com/lebigot/uncertainties)

### vaex

Out-of-Core hybrid Apache Arrow/NumPy DataFrame for Python, ML, visualize and explore big tabular data at a billion rows per second.

[Homepage](https://vaex.io/) [Repository](https://github.com/vaexio/vaex)

## Tips and Tricks

Sometimes packages - especially under windows are hard to compile. A good adress for (unofficial) precompiled wheels to install via pip is located at [Unofficial Windows Binaries for Python Extension Packages](https://www.lfd.uci.edu/~gohlke/pythonlibs "by Christoph Gohlke, Laboratory for Fluorescence Dynamics, University of California, Irvine")
