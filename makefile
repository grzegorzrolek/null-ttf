# Makefile for Null the TrueType font project directory
# Copyright 2012 Grzegorz Rolek


TAGS = cmap glyf head hhea hmtx loca maxp name post

Null.ttf: $(addsuffix .xml, $(TAGS))
	for TABLE in $?; do ftxdumperfuser -d $$TABLE -g -t $$(basename -s .xml $$TABLE) $@; done

test:
	@ftxvalidator -T Null.ttf | less
