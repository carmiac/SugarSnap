use <Libs.scad>
include <ss_parms.scad>
use <end_strut.scad>
use <strut_dummies.scad>
libEcho = false;

top_vertex();

	
module rod_mount(){
	difference(){
		cylinder(r=tv_rod_diameter / 2 + tv_rod_wall, h=tv_rod_length+ 0.01, center=true, $fn=resolution(ys_rod_diameter));  
		cylinder(r=tv_rod_diameter / 2, h=tv_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));  
	}
}

module vertex_body(){
	union(){
		difference(){
			//lower body semicircle
			translate([0,0, es_height/2])
				cylinder(r = bv_radius, h = es_height, center = true);
			translate([-1.25 * bv_radius, 0.1, -1])
				cube([bv_radius * 2.5, bv_radius * 2.5, es_height * 2]);
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
			// X-Rod countersinks
			translate([-tv_rod_spacing/2, tv_rod_lift, es_height + tv_rod_length/2 - tv_rod_sink])
				cylinder(r=tv_rod_diameter / 2, h=tv_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));
			translate([tv_rod_spacing/2, tv_rod_lift, es_height + tv_rod_length/2 - tv_rod_sink])
				cylinder(r=tv_rod_diameter / 2, h=tv_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));
				
			// Motor Mount dovetails
			translate([0,tv_top_height,-0.01])
				rotate(a = [0,-90,90])
					dovetail(male = false, height = 5);
			translate([x_dt_space,tv_top_height,-0.01])
				rotate(a = [0,-90,90])
					dovetail(male = false, height = 5);
			translate([-x_dt_space,tv_top_height,-0.01])
				rotate(a = [0,-90,90])
					dovetail(male = false, height = 5);
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
					
		// X Rod Mounts
		translate([-tv_rod_spacing/2, tv_rod_lift, es_height + tv_rod_length/2 - 0.1])
			rod_mount();
		translate([tv_rod_spacing/2, tv_rod_lift, es_height + tv_rod_length/2 - 0.1])
			rod_mount();
	}
}


module top_vertex_b(){
	mirror()
		top_vertex();
}