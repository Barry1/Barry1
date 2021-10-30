pyexe=$(which python3)

$pyexe -m ensurepip
$pyexe -m pip install --upgrade pip

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | $pyexe - --git https://github.com/python-poetry/poetry.git@master

poetry self update
