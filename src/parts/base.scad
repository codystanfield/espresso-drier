include <../../lib/Round-Anything/polyround.scad>
include <../constants.scad>

module base() {
    module base_tray() {
        union() {
            // base
            linear_extrude(base_z_len)
            polygon(polyRound(base_points, rounding_faces));

            // rim
            // linear_extrude(base_shell_z_len)
            extrudeWithRadius(base_shell_z_len, r2=1, fn=15) {
                shell2d(-base_shell_thickness, minIR=base_radius) {
                    polygon(polyRound(base_points, rounding_faces));

                    // gridpattern(memberW = 1, sqW = 5, iter = 50, r = 0);
                }
            }
        }
    }

    module pillar(single_corner_radius=base_radius) {
        union() {
            // pillar
            linear_extrude(pillar_height)
            polygon(polyRound([
                [0, 0, single_corner_radius],
                [pillar_side, 0, 0],
                [pillar_side, pillar_side, 0],
                [0, pillar_side, 0],
            ], rounding_faces));

            // peg
            peg_gap = (pillar_side - peg_side) / 2;
            linear_extrude(peg_height)
            translate([peg_gap, peg_gap, 0])
            square(peg_side);
        }
    }

    union() {
        base_tray();

        // pillars
        // bottom-left
        pillar();

        // bottom-right
        translate([base_x_len, 0, 0])
        rotate([0, 0, 90])
        pillar();

        // top-right
        translate([base_x_len, base_y_len])
        rotate([0, 0, 180])
        pillar();

        // top-left
        translate([0, base_y_len])
        rotate([0, 0, 270])
        pillar();

        // bottom-middle
        translate([base_x_len / 2, 0, 0])
        pillar(single_corner_radius=0);

        // top-middle
        translate([base_x_len / 2, base_y_len - pillar_side, 0])
        pillar(single_corner_radius=0);
    }
}
