#!/bin/bash
hugo --cleanDestinationDir -d docs
git add .
git commint -m $1
git push -u origin main