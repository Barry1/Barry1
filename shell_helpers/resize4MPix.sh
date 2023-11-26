#!/bin/sh
for a in *.jpg; do
	convert "$a" -resize "4000000@" "${a%.jpg}_res4MPix.jpg"
done
