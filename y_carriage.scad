use <Libs.scad>
include <ss_parms.scad>
use <belt_clip.scad>

libEcho=false;

y_carriage();
translate([yc_width/4, yc_length/2,0])
	belt_retainer(belt_width = yc_belt_width, depth = yc_clip_length , mount_height = yc_belt_thickness + yc_thick, wall = yc_clip_wall);
//y_carriage_b();

module y_carriage(){
	difference(){
		union(){
			// main body
			cube(size = [yc_width/2, yc_length, yc_thick]);
			// platform mounts
			translate([yc_platform_mount_diameter/2, yc_platform_mount_diameter/2, yc_thick - 0.01])
				cylinder(r = yc_platform_mount_diameter/2, h = yc_platform_mount_height);
			translate([yc_platform_mount_diameter/2, yc_length - yc_platform_mount_diameter/2, yc_thick - 0.01])
				cylinder(r = yc_platform_mount_diameter/2, h = yc_platform_mount_height);
			// male dovetails
			translate([yc_width/2,6.75,yc_thick/2])
				dovetail(male = true, height = yc_thick);
			translate([yc_width/2,yc_length-yc_frame_width+6.75,yc_thick/2])
				dovetail(male = true, height = yc_thick);
		}
		// center cutout
		translate([yc_frame_width,yc_frame_width,-0.5])
			cube(size = [yc_width/2, yc_length - 2 * yc_frame_width, yc_thick+1]);
		// female dovetails
		translate([yc_width/2,yc_frame_width-6.75,yc_thick/2 ])
			mirror([1,0,0])
				dovetail(male = false, height = yc_thick+1);
		translate([yc_width/2,yc_length-6.75,yc_thick/2])
			mirror([1,0,0])
				dovetail(male = false, height = yc_thick+1);
		// magnet mounts
		translate([yc_platform_mount_diameter/2, yc_platform_mount_diameter/2, yc_thick+yc_platform_mount_height-yc_magnet_thickness-0.5])
				cylinder(r = rod_tol + yc_magnet_diameter/2, h = yc_magnet_thickness+1);
		translate([yc_platform_mount_diameter/2, yc_length - yc_platform_mount_diameter/2, yc_thick+yc_platform_mount_height-yc_magnet_thickness-0.5])
				cylinder(r = rod_tol + yc_magnet_diameter/2, h = yc_magnet_thickness+1);
		// belt clamp slots
		translate([yc_width/2 - y_belt_outset, (yc_frame_width-yc_clip_length)/2, -0.5])
			cube(size = [2*yc_clip_wall + bv_tolerance, yc_clip_length + bv_tolerance, yc_thick+1]);
		translate([yc_width/2 - y_belt_outset - yc_belt_width, (yc_frame_width-yc_clip_length)/2, -0.5])
			cube(size = [2*yc_clip_wall + bv_tolerance, yc_clip_length + bv_tolerance, yc_thick+1]);
		translate([yc_width/2 - y_belt_outset, yc_length-(yc_frame_width/2) -(yc_clip_length)/2, -0.5])
			cube(size = [2*yc_clip_wall + bv_tolerance, yc_clip_length + bv_tolerance, yc_thick+1]);
		translate([yc_width/2 - y_belt_outset - yc_belt_width, yc_length-(yc_frame_width/2) -(yc_clip_length)/2, -0.5])
			cube(size = [2*yc_clip_wall + bv_tolerance, yc_clip_length + bv_tolerance, yc_thick+1]);
	}
}