use <Libs.scad>
use <MCAD/motors.scad>
include <ss_parms.scad>
 

libEcho=false;

sd = 1.0;
	
y_motor_strut();
//motor_mount(width = 5);
module motor_mount(width = 5){

	rotate([90,0,90])
	linear_extrude(height = width)
		difference(){
			square(size=[1.7 * inch, 2*(ym_height+sd)+1.7 * inch], center=true);
			stepper_motor_mount(17,slide_distance=sd, mochup=false, tolerance=0.5);
		}
}
module y_motor_strut(){
	foot_length = 1.7 * inch +  bv_radius - ym_width/2;
	difference(){
		union(){
			// main body
			cube(size=[ym_length, ym_width, ym_height]);
			// motor mount
			translate([ym_length/2 + y_belt_outset - 2 - ym_mount_width, ym_width/2, ym_height + (2*sd+1.7 * inch)/2])
					motor_mount(ym_mount_width);
			// foot
			translate([ym_length/2 + y_belt_outset - 2 - ym_mount_width, -ym_width/2, 0]){
				cube(size=[ym_mount_width, bv_radius, ym_height + 1]);

			}
		}
		translate([ym_length, 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([ym_length, ym_width - 6.75, ym_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* ym_height);
		translate([0,  ym_width- 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
		translate([0, 6.75, ym_height/2]) dovetail(male = false, height = 1.1* ym_height);
	}
} 


