#!/bin/bash

die()
{
	echo "PyQt qt_versioning.sh: $*" >&2
	exit 1
}

[ $# -eq 3 ] || die "Invalid arguments"

action="$1"
qtincdir="$2"
tmpfile="$3"

cp -f "$qtincdir/QtCore/qglobal.h" "$tmpfile" || die "cp failed"
echo "int QT_VERSION_IS = QT_VERSION;" >> "$tmpfile" || die "patching failed (1)"
echo "int QT_EDITION_IS = QT_EDITION;" >> "$tmpfile" || die "patching failed (2)"
# First resolve all preprocessor macros
cpp -x c++ -traditional-cpp "-I$qtincdir" "$tmpfile" > "$tmpfile.processed" || die "CPP failed"

if [ "$action" = "version" ]; then
	raw="$(grep -e 'QT_VERSION_IS' "$tmpfile.processed" | cut -d'=' -f2 | cut -d';' -f1)"
elif [ "$action" = "edition" ]; then
	raw="$(grep -e 'QT_EDITION_IS' "$tmpfile.processed" | cut -d'=' -f2 | cut -d';' -f1)"
else
	die "Invalid action"
fi
# We use python to evaluate the arithmetic C++ expression. Languages are similar
# enough in that area for this to succeed.
python -c "print \"%d\" % ($raw)" || die "C++ evaluation failed"

exit 0
