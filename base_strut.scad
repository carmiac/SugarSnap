include <Libs.scad>
include <ss_parms.scad>
use <mcad/triangles.scad>

libEcho=false;

peg_width = bs_width / 4;

module base_strut(){
	difference(){
		union(){
			cube(size=[bs_length, bs_width, bs_height]);
			translate([-1 * bv_width, 0, 0]) cube(size=[bv_width + 0.1, peg_width, bs_height]);
			translate([-1 * bv_width, bs_width - peg_width , 0]) cube(size=[bv_width + 0.1, peg_width, bs_height]);
			translate([0, (bs_width + bs_height) / 2, bs_height- 0.1])
			rotate(forward(90))
				a_triangle(30, 0.9 * bs_td_space, bs_height);
		}
		translate([bs_length, 6.75, bs_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* bs_height);
		translate([bs_length,  bs_width - 6.75, bs_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* bs_height);
		if (bs_teardrops) {
			for ( i = [0 : bs_num_td - 1 ]) {
				translate([bs_td_space + bs_td_radius +  i * (2.5 * bs_td_radius + bs_td_space),  bs_width / 2, bs_height/2])
				 rotate(righty(90))
					 teardrop(radius=bs_td_radius,  length = 1.1* bs_height, angle=90);	
			}
		}
	}
}

base_strut();
