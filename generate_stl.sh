#!/bin/bash
set -ex

if [ $# -eq 0 ]
then
    flatpak run org.openscad.OpenSCAD -o /home/cody/3D\ Printing/espresso-drier/output/espresso_drier.stl /home/cody/3D\ Printing/espresso-drier/src/espresso_drier.scad
elif [ $1 = 'base' ]
then
    flatpak run org.openscad.OpenSCAD -o /home/cody/3D\ Printing/espresso-drier/output/espresso_drier_base.stl /home/cody/3D\ Printing/espresso-drier/src/parts/printable/printable_base.scad
elif [ $1 = 'cover' ]
then
    flatpak run org.openscad.OpenSCAD -o /home/cody/3D\ Printing/espresso-drier/output/espresso_drier_cover.stl /home/cody/3D\ Printing/espresso-drier/src/parts/printable/printable_cover.scad
fi
