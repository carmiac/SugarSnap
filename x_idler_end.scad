include <ss_parms.scad>
use <x_end_base.scad>
use <Libs.scad>

x_idler_end();

module x_idler_end(){
	translate([0,0,x_base_thickness/2])
	difference(){
		union(){
			x_end_base();
			// idler mount
			translate([x_base_width/2 - 0.1, -x_base_length/2, -x_base_thickness/2])
				cube(size=[yi_width, x_base_length, (1.7/2) * inch  + 4 + 5 + x_base_thickness]);
		}
		// idler hole
		translate([(x_base_width + yi_width)/2,0,(1.7/2) * inch + x_base_thickness/2])
			teardrop(radius=4,  length = yi_width + 1, angle=90);
	}
}
