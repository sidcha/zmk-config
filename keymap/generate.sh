#!/bin/bash

if [[ ! -d .venv ]]; then
	python3 -m venv .venv
	source .venv/bin/activate
	pip install keymap_drawer
else
	source .venv/bin/activate
fi

keymap -c ./keymap/keymap_config.yaml parse \
	--columns 10 \
	--zmk-keymap ./config/boards/shields/chocofi/chocofi.keymap \
	--base-keymap ./keymap/keymap_base.yaml \
	--output ./keymap/keymap.yaml

keymap -c ./keymap/keymap_config.yaml draw \
	--select-layers default sym nav fun \
	--qmk-keyboard chocofi \
	--output ./keymap/keymap.svg \
	./keymap/keymap.yaml
