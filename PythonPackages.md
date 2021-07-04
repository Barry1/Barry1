# Python Packages of interest

This is just a small list of packages, which are interesting (for me).
Most of them are also found within my [GitHub Stars](https://github.com/Barry1?language=python&tab=stars).

## List

| Packagename               | Group        |
| ------------------------- | ------------ |
| [SQLAlchemy](#SQLAlchemy) | Database     |
| [dask](#dask)             | Dataframe    |
| [pandas](#pandas)         | Dataframe    |
| [vaex](#vaex)             | Dataframe    |
| [black](#black)           | Formatting   |
| [darker](#darker)         | Formatting   |
| [pip-tools](#pip-tools)   | OS           |
| [psutil](#psutil)         | OS           |
| [bokeh](#bokeh)           | Plot         |
| [hvplot](#hvplot)         | Plot         |
| [matplotlib](#matplotlib) | Plot         |
| [tqdm](#tqdm)             | Progress Bar |

## Description

### black

The uncompromising Python code formatter.

[Homepage](https://black.readthedocs.io/en/stable/)
[Repository](https://github.com/psf/black)

### darker

Apply Black formatting only in regions changed since last commit.

[Homepage](about:blank)
[Repository](https://github.com/akaihola/darker)

### hvplot

A high-level plotting API for pandas, dask, xarray, and networkx built on HoloViews.

[Homepage](https://hvplot.holoviz.org/)
[Repository](https://github.com/holoviz/hvplot)

### matplotlib

plotting with Python

[Homepage](about:blank)
[Repository](https://github.com/matplotlib/matplotlib)

### pip-tools

A set of tools to keep your pinned Python dependencies fresh.
I most often use the following calls

```bash
python -m pip install --upgrade pip setuptools
python -m piptools compile --rebuild
python -m pip install --upgrade -r requirements.txt
```

[Homepage](about:blank)
[Repository](https://github.com/jazzband/pip-tools)

### psutil

Cross-platform lib for process and system monitoring in Python.

[Homepage](about:blank)
[Repository](https://github.com/giampaolo/psutil)

### SQLAlchemy

The Python SQL Toolkit and Object Relational Mapper

SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL. SQLAlchemy provides a full suite of well known enterprise-level persistence patterns, designed for efficient and high-performing database access, adapted into a simple and Pythonic domain language.

[Homepage](http://www.sqlalchemy.org/)
[Repository](https://github.com/sqlalchemy/sqlalchemy/)

### tqdm

A Fast, Extensible Progress Bar for Python and CLI.

[Homepage](https://tqdm.github.io/)
[Repository](https://github.com/tqdm/tqdm)

### vaex

Out-of-Core hybrid Apache Arrow/NumPy DataFrame for Python, ML, visualize and explore big tabular data at a billion rows per second.

[Homepage](https://vaex.io/)
[Repository](https://github.com/vaexio/vaex)
