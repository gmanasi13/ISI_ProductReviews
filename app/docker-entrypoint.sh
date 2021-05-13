#!/bin/sh
#set -e
set -x
export FLASK_APP=app.py

case "$1" in
	deploy)
		flask run --host=0.0.0.0
		;;
	test )
		python3 test_isi.py
		;;
esac
