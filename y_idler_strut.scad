use <Libs.scad>
include <ss_parms.scad>
 

libEcho=false;

sd = 1.0;


y_idler_strut();

module y_idler_strut(){
	difference(){
		union(){
			// main body
			cube(size=[ym_length, ym_width, ym_height]);
			// idler mount 
			translate([ym_length/2 + y_belt_outset - 2 - ym_mount_width, 0, ym_height - 0.01])
				cube(size=[yi_width, ym_width, idler_pulley_radius + 15]);
		}
		// dovetails
		translate([ym_length, 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([ym_length, ym_width - 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([0,  ym_width- 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
		translate([0, 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
		// idler hole
		translate([ym_length/2 + y_belt_outset +0.5- ym_mount_width/2, ym_width/2 , ym_height + idler_pulley_radius + 5])
			teardrop(radius=4,  length = yi_width + 1, angle=90);	
	}
} 


