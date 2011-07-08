use <Libs.scad>
include <ss_parms.scad>
use <nema_17_mount.scad>

libEcho=false;

x_motor_mount();

module x_motor_mount(){
	union(){
		rotate([90,0,0])
			nema_17_mount(td = true, td_rotate = -90);
		translate([-x_dt_space,0,2.5])
			rotate([0,0,90])
				dovetail(male = true, height = 5);
		translate([x_dt_space,0,2.5])
			rotate([0,0,90])
				dovetail(male = true, height = 5);
		translate([0,0,2.5])
			rotate([0,0,90])
				dovetail(male = true, height = 5);
	}
} 