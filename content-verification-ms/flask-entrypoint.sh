#!/usr/bin/env bash
PORT=$1
flask run --host=0.0.0.0 --port=$PORT
flask db upgrade
