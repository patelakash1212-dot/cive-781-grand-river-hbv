#!/bin/bash

set -e

cp ./Irondequoit.rvp model/Irondequoit.rvp

cd model

./Raven.exe Irondequoit -o output/

cd ..

exit 0

