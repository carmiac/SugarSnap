use <Libs.scad>
include <ss_parms.scad>
use <end_strut.scad>
use <strut_dummies.scad>
libEcho = false;

base_vertex();

module base_vertex(){
	union(){
		difference(){
			//main body
			translate([0,0, es_height/2])
				cylinder(r = bv_radius, h = es_height, center = true);
			translate([-bs_outset + 1.5 * bs_height + 3, -bv_radius-0.5, -0.5]) 
				cube([bv_radius+1, 2*bv_radius+1, es_height+1]);
			// end strut flats and female dovetails
			translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
				es_dummy();
			rotate(a = [0,0,-60]){
				translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
					es_dummy();
			}
			// base strut mounting
			rotate(a = [0,0,180])
				translate([-bs_outset, -bs_width/2, bv_width]) 
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

module base_vertex_b(){
	mirror()
		base_vertex();
}