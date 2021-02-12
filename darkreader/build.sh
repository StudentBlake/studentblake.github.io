#!/bin/bash -x

# Clone darkreader repo to darkreader-src folder
git clone https://github.com/darkreader/darkreader.git darkreader-src --depth 1

# Zip source repo
zip -r darkreader-src.zip darkreader-src/

# Build Dark Reader extension
cd darkreader-src
npm install
npm run build
cd ..

# Clean nightly folder
rm -rf nightly
mkdir nightly

# Move source zip, Chrome, and Firefox builds to nightly folder
mv darkreader-src.zip nightly/
mv darkreader-src/build.zip nightly/build-chrome.zip
mv darkreader-src/build-firefox.xpi nightly/

# Cleanup before commit
rm -rf darkreader-src/
