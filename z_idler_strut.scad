include <ss_parms.scad>
use <end_strut.scad>

z_idler_strut();
  
module z_idler_strut(){
	difference(){
		union(){
			// strut body
			end_strut();
			// mount support
			translate([es_length/2 - (z_bearing_diameter + z_pocket_wall * 2)/2,z_mount_lift - 5, es_height-0.1])
				cube(size = [z_bearing_diameter + z_pocket_wall * 2,5,es_height]);
		}
		// mounting slots
		translate([es_length/2 - (z_bearing_diameter/2 + z_pocket_wall) - slot_tolerence/2, z_mount_lift, -0.5])
				cube(size = [10 + slot_tolerence, z_mount_thick + slot_tolerence, es_height + 1]);
		translate([es_length/2 - 10 + (z_bearing_diameter/2 + z_pocket_wall) - slot_tolerence/2, z_mount_lift, -0.5])
				cube(size = [10 + slot_tolerence, z_mount_thick + slot_tolerence, es_height + 1]);
		// smoth rod mount dovetails
		translate([es_length/2 - (z_rod_mount_width/2) + 6.75, es_width, es_height/2])
			rotate([0,0,-90])
				dovetail(male = false, height = 1.1* es_height);
		translate([es_length/2 + (z_rod_mount_width/2) - 6.75, es_width, es_height/2])
			rotate([0,0,-90])
				dovetail(male = false, height = 1.1* es_height);
	}
}