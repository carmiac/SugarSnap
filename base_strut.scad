include <Libs.scad>
include <ss_parms.scad>
use <mcad/triangles.scad>

libEcho=false;

peg_width = bs_width / 4;

module base_strut(){
	difference(){
		union(){
			// body
			translate([-bs_sink, 0, 0]) 
				cube(size=[bs_length + bs_sink, bs_width, bs_height]);
			// mounting pegs
			translate([-1 * bv_width, 0, 0]) 
				cube(size=[bv_width - bs_sink +0.1, peg_width, bs_height]);
			translate([-1 * bv_width, bs_width - peg_width , 0]) 
				cube(size=[bv_width - bs_sink + 0.1, peg_width, bs_height]);
			// support cube
			translate([-bs_sink, (bs_width-peg_width)  / 2, bs_height- 0.1])
				cube(size=[bs_sink + 0.5 * bs_td_space, peg_width, bs_height]);

		}
		// female dovetails
		translate([bs_length, 6.75, bs_height/2]) mirror([1,0,0]) 
			dovetail(male = false, height = 1.1* bs_height);
		translate([bs_length,  bs_width - 6.75, bs_height/2]) mirror([1,0,0]) 
			dovetail(male = false, height = 1.1* bs_height);
		// teardrop hole
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
