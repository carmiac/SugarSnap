use <Libs.scad>
include <ss_parms.scad>
use <nema_17_mount.scad>

libEcho=false;
foot_length = bv_radius - ym_width/2;

y_motor_strut();

module y_motor_strut(){
	difference(){
		union(){
			cube(size=[ym_length, ym_width, ym_height]);
			translate([ym_length/2, 0, ym_height - 0.01])
				nema_17_mount(support_height = ym_width, td = false);
		}
		translate([ym_length, 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([ym_length, ym_width - 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([0,  ym_width- 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
		translate([0, 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
	}
} 


