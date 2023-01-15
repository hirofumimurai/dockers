#!/bin/bash

docker run --rm -v $(pwd):/app -w /app  python:3-slim python $1
