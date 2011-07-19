use <Libs.scad>
include <ss_parms.scad>
use <end_strut.scad>
use <strut_dummies.scad>
libEcho = false;

top_vertex();


module vertex_body(){
	union(){
		difference(){
			//lower body semicircle
			translate([0,0, es_height/2])
				cylinder(r = bv_radius, h = es_height, center = true);
			translate([-1.25 * bv_radius, 0.1, -1])
				cube([bv_radius * 2.5, bv_radius +2, es_height * 2]);
			}
		// top half of vertex
		translate([-bv_radius, 0, 0])
			cube([bv_radius * 2, tv_top_height, es_height]);
	}
}

module top_vertex(){
	union(){
		difference(){
			vertex_body();
			// end strut flats and female dovetails
			rotate(a = [0,0,60])
				translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
					es_dummy();
			rotate(a = [0,0,120])
				translate([-es_length - (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),- es_width/2, -0.01])
					es_dummy();		
				
			// Z Rod Mount dovetails
			translate([-z_rod_mount_width/2 + 6.75, tv_top_height - z_rod_mount_thick/2, 0])
				rotate(a = [0,-90,90])
					dovetail(male = false, height = z_rod_mount_thick + 0.02);
			translate([z_rod_mount_width/2 - 6.75, tv_top_height - z_rod_mount_thick/2, 0])
				rotate(a = [0,-90,90])
					dovetail(male = false, height = z_rod_mount_thick + 0.02);
					
			// base strut mounting
			rotate(a = [0,0,180])
				translate([bs_height, -ts_lift-bs_width/2, bv_width]) 
					rotate(a = [0,-90,0])
						bs_dummy();
		}
			
		// male dovetails
		rotate(a = [0,0,60])
			translate([- (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),  -es_width/2 + 6.75, es_height/2]) 
				mirror([1,0,0])
					dovetail(male = true, height = es_height);
		rotate(a = [0,0,120])
			translate([- (sqrt(pow(bv_radius,2) - pow(es_width/2,2))),  -es_width/2 + 6.75, es_height/2]) 
				mirror([1,0,0])
					dovetail(male = true, height = es_height);
	}
}


module top_vertex_b(){
	mirror()
		top_vertex();
}