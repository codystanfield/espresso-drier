// TODO: not all of these are actually needed in multiple files, just pulled them out when I split up the parts files

// Generic wiggle room. I know there are better names, fight me.
wiggle = 1;
rounding_faces = 50;

base_x_len = 200;
base_y_len = base_x_len * 2 / 3;    // TODO: probably going to want a direct measurement
base_z_len = 15;
base_radius = 2;
base_shell_thickness = 5;
base_shell_z_len = base_z_len * 2;

cover_x_len = base_x_len;
cover_y_len = base_y_len;
cover_z_len = base_z_len;
cover_radius = base_radius;

pillar_side = 15;
pillar_height = 100;

cover_notch_hole_side = pillar_side * 2 / 3;
cover_notch_hole_depth = cover_z_len * 2 / 3;

cover_z_point = pillar_height;

// Give the peg a bit of wiggle room in the hole
peg_side = cover_notch_hole_side - wiggle;
peg_height = pillar_height + cover_notch_hole_depth - wiggle;

base_points = [
    [0, 0, base_radius],
    [base_x_len, 0, base_radius],
    [base_x_len, base_y_len, base_radius],
    [0, base_y_len, base_radius],
];