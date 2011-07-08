use <Libs.scad>
include <ss_parms.scad>
use <end_strut.scad>

libEcho = false;

base_vertex();


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
module base_vertex(){
	union(){
		difference(){
			//main body
			translate([0,0, es_height/2])
				cylinder(r = bv_radius, h = es_height, center = true);
			// end strut flats and female dovetails
			translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
				es_dummy();
			rotate(a = [0,0,-60]){
				translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
					es_dummy();
			}
			// base strut mounting
			rotate(a = [0,0,180])
				translate([-bs_outset + bs_height/2, -bs_width/2, bv_width]) 
					rotate(a = [0,-90,0])
						bs_dummy();
		}
		// male dovetails
		translate([- (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),  -es_width/2 + 6.75, es_height/2]) 
			mirror([1,0,0])
				dovetail(male = true, height = es_height);
		rotate(a = [0,0,-60])
			translate([- (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),  -es_width/2 + 6.75, es_height/2]) 
				mirror([1,0,0])
					dovetail(male = true, height = es_height);
	}
}