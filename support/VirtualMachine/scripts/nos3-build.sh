#!/bin/bash
#
# Convenience script for NOS3 simulator development
#

xterm -hold -T "NOS3 Build" -rv -e '
# Update the following path for shared folders if in use
DIR=/home/nos3/nos3
cd $DIR

mkdir ~/Desktop/nos3-build
cd ~/Desktop/nos3-build

cmake $DIR -DBUILD_FLIGHT=0 -DBUILD_SIMULATOR=YES

make mission-install  # cFE apps, etc
make install          # Simulators

echo "Done!"
'

# You can add:  "-DSKIP_VERSION=YES" to the cmake line if the build
# is slow on your machine... but don't do it by default... we will forget to
# take it out later and that would be bad!

# You can add:  "-DBUILD_FLIGHT=0" if you do not have the avr32-gcc cross
# compiler installed.  The cross compiler is needed to build the flight
# target version of the flight software; however, it is not needed to 
# build the Linux version of the flight software.

# If you encounter errors, you can add '-hold' immedately following 
# the 'xterm' call to leave the window open for debugging!