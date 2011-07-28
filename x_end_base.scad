use <Libs.scad>
include <ss_parms.scad>

x_end_base();

module x_end_base(){
	difference(){
		union(){
			// base
			cube(size = [x_base_width, x_base_length, x_base_thickness], center = true);
			// nut tube
			translate([0, -z_rod_separation/2, -x_base_thickness/2])
				cylinder(r = z_nut_diameter/2 + rod_wall , h = x_nut_carrier_height, $fn=6);
			// bushing mount
			translate([0, z_rod_separation/2 - rod_wall/2 - 0.1, (x_slide_height-x_base_thickness)/2])
				cube(size = [x_slide_width + 2 * rod_wall, x_slide_width + rod_wall, x_slide_height], center = true);
		}
		// x rods
		translate([x_rod_distance/2, 0, 0])
			rotate([0,0,90])
				teardrop(radius=rod_tol + rod_diameter / 2,  length = x_base_length + 2, angle=90, center = true);
		translate([-x_rod_distance/2, 0, 0])
			rotate([0,0,90])
				teardrop(radius=rod_tol + rod_diameter / 2,  length = x_base_length + 2, angle=90, center = true);
		// bushing space
		translate([0, z_rod_separation/2, (x_slide_height-x_base_thickness)/2 ])
				cube(size = [x_slide_width, x_slide_width, x_slide_height + 2], center = true);
		// Z supporting nut
		translate([0, -z_rod_separation/2, -x_base_thickness/2 - 1])
			cylinder(r = z_nut_diameter/2, h = z_nut_height + 1, $fn=6);
		// Z tensioning nut tube
		translate([0, -z_rod_separation/2, -x_base_thickness/2 + z_nut_height + rod_wall * 2])
			cylinder(r = z_nut_diameter/2, h = x_nut_carrier_height - z_nut_height - rod_wall * 2 + 1, $fn=6);
		// Z threaded rod drill out starter hole
		translate([0, -z_rod_separation/2, -x_base_thickness/2 + z_nut_height + rod_wall])
			cylinder(r = threaded_rod_diameter/2, h = rod_wall + 1);
			
	}
}