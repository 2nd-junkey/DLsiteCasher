#!/bin/bash

cd "$1"
SOURCE="$PWD"
echo "$SOURCE"
OUTPUTPATH="$(mktemp -d)"
echo "$OUTPUTPATH"
find -mindepth 2 -maxdepth 2 -type d | while read -r dname
do
	# echo "$dname"
	SOURCEPATH="$SOURCE/$dname"

	cd "$SOURCEPATH"
	mv -v * "$OUTPUTPATH/"
	git init --bare

	cd "$OUTPUTPATH"
	git init
	git config core.autocrlf false
	find . -type d -empty -exec touch "{}/.gitkeep" \;
	git add .
	git commit -m init
	git remote add origin "$SOURCEPATH"
	git push --set-upstream origin master
	rm -vfr *
	rm -vfr ./.*
done

cd "$SOURCE"
rm "$OUTPUTPATH"

exit $?

