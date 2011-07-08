use <Libs.scad>
include <ss_parms.scad>

peg_width = bs_width / 4;
					
module es_dummy(){
	union(){
		cube([es_length, es_width, es_height + 0.05]);
		translate([es_length, es_width - 6.75, es_height/2])
			dovetail(male = false, height = es_height + 0.05);
	}
}

module bs_dummy(){
	union(){
		// body
		translate([-bs_sink, 0, 0]) 
			cube(size=[bs_length + bs_sink, bs_width+bv_tolerance, bs_height+bv_tolerance]);
		// mounting pegs
		translate([-bv_width-0.1, 0, 0]) 
			cube(size=[bv_width - bs_sink +0.5, peg_width+bv_tolerance, bs_height+bv_tolerance]);
		translate([-bv_width-0.1, bs_width - peg_width , 0]) 
			cube(size=[bv_width - bs_sink + 0.5, peg_width+bv_tolerance, bs_height+bv_tolerance]);
		// support cube
		translate([-bs_sink, (bs_width-peg_width)  / 2, bs_height- 0.1])
			cube(size=[bs_sink + 0.5 * bs_td_space, peg_width+bv_tolerance, bs_height+bv_tolerance]);
	}
}