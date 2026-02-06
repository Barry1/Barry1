#!/bin/sh
pipx install pytest
pipx inject pytest pytest-cov pytest-sugar pytest-bandit pytest-black pytest-colordots pytest-monkeytype pytest-mypy pytest-pyright pytest-beartype pytest-asyncio
