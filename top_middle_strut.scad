use <Libs.scad>
include <ss_parms.scad>
 

libEcho=false;

sd = 1.0;


top_middle_strut();

module top_middle_strut(){
	difference(){
		// main body
		cube(size=[ym_length, ym_width, ym_height]);
		// dovetails
		translate([ym_length, 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([ym_length, ym_width - 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([0,  ym_width- 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
		translate([0, 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);

	}
} 


