include <Libs.scad> 
include <ss_parms.scad>
use <strut_dummies.scad>

libEcho=false;

top_side_strut(); 

module top_side_strut(){
	union(){
		// main body
		cube(size=[ys_length, ys_width, ys_height]);
		// dovetails
		translate([0, 6.75, ys_height/2]) 
			mirror([1,0,0]) 
				dovetail(male = true, height = ys_height);
		translate([0,  ys_width - 6.75, ys_height/2]) 
			mirror([1,0,0]) 
				dovetail(male = true, height = ys_height);
		translate([ys_length, 6.75, ys_height/2]) 
			dovetail(male = true, height = ys_height);
		translate([ys_length,  ys_width - 6.75, ys_height/2])
			dovetail(male = true, height = ys_height);
	}
}

