#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
URL="https://raw.githubusercontent.com/octobanana/parg/refs/heads/master/include/parg.hh"

# Download the release
if [ ! -f "parg.hh" ]; then
  echo "Downloading parg.hh from $URL ..."
  curl -L "$URL" -o "parg.hh"
  echo ""
fi
}


# Test the project
test() {
echo "Running 01-basic.cxx ..."
clang++ -std=c++17 -I. examples/01-basic.cxx        && ./a && echo -e "\n"
echo "Running 02-parse-string.cxx ..."
clang++ -std=c++17 -I. examples/02-parse-string.cxx && ./a && echo -e "\n"
echo "Running 03-advanced.cxx ..."
clang++ -std=c++17 -I. examples/03-advanced.cxx     && ./a && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
