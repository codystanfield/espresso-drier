include <parts/base.scad>
include <parts/cover.scad>

base();

// Remove the + 20 to place the cover on the post pegs
translate([0, 0, cover_z_point+20])
cover();

