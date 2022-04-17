include <../../lib/Round-Anything/polyround.scad>
include <../constants.scad>

module cover() {
    module base() {
        polyRoundExtrude(base_points, length=cover_z_len, r1=3, r2=0, fn=rounding_faces);
    }

    module notch_hole() {
        notch_hole_gap = (pillar_side - cover_notch_hole_side) / 2;

        // TODO: should really create a function for this
        linear_extrude(cover_notch_hole_depth)
        translate([notch_hole_gap, notch_hole_gap, 0])
        square(cover_notch_hole_side);
    }

    // base with notch holes removed
    difference() {
        base();

        // post holes
        // bottom-left
        notch_hole();

        // bottom-right
        translate([cover_x_len, 0, 0])
        rotate([0, 0, 90])
        notch_hole();

        // top-right
        translate([cover_x_len, cover_y_len])
        rotate([0, 0, 180])
        notch_hole();

        // top-left
        translate([0, cover_y_len])
        rotate([0, 0, 270])
        notch_hole();

        // bottom-middle
        translate([cover_x_len / 2, 0, 0])
        notch_hole();

        // top-middle
        translate([cover_x_len / 2, cover_y_len - pillar_side, 0])
        notch_hole();
    }
    

    // part holes
};

cover();
