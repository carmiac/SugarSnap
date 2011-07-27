include <ss_parms.scad>
use <end_strut.scad>

z_motor_strut();
  
module z_motor_strut(){
	translate([0,es_width,0]) rotate([180,0,0]) mirror([0,0,1])
	difference(){
		union(){
			// strut body
			end_strut();
			// mount support
			translate([10,z_mount_lift - 5, es_height - .1])
				cube(size = [es_length-20,5,es_height]);
		}
		// mounting slots
		translate([es_length/2 - (z_bearing_diameter/2 + z_pocket_wall) - slot_tolerence/2, z_mount_lift, -0.5])
				cube(size = [10 + slot_tolerence, z_mount_thick + slot_tolerence, es_height + 1]);
		translate([es_length - 5 - (z_bearing_diameter/2 + z_pocket_wall) - slot_tolerence/2, z_mount_lift, -0.5])
				cube(size = [10 + slot_tolerence, z_mount_thick + slot_tolerence, es_height + 1]);
		translate([es_length/2 - (z_rod_mount_width/2) + 6.75, es_width - es_height/2, 0])
			rotate([0,-90,-90])
				dovetail(male = false, height = 1.1* es_height);
		translate([es_length/2 + (z_rod_mount_width/2) - 6.75, es_width - es_height/2, 0])
			rotate([0,-90,-90])
				dovetail(male = false, height = 1.1* es_height);
	}
}