use <Libs.scad>
include <ss_parms.scad>

z_rod_top_mount();

module z_rod_top_mount(){
	difference(){
		union(){
			// body
			cube(size=[z_rod_mount_width, rod_diameter + 2*(rod_wall +rod_tol) , z_rod_mount_thick]);
			// dovetails
			translate([6.75,0,z_rod_mount_thick/2])
				rotate([0,0,-90])
					dovetail(male = true, height = z_rod_mount_thick);
			translate([z_rod_mount_width-6.75,0,z_rod_mount_thick/2])
				rotate([0,0,-90])
					dovetail(male = true, height = z_rod_mount_thick);
			// rod mount
			translate([15, rod_tol + rod_diameter / 2 + rod_wall,z_rod_mount_thick+(rod_mount_length+5)/2])
				cylinder(r=rod_tol + rod_diameter / 2 + rod_wall, h=rod_mount_length+ 5.01, center=true, $fn=resolution(rod_diameter));
		}
		// rod hole
		translate([15, rod_tol + rod_diameter / 2 + rod_wall,z_rod_mount_thick])
			cylinder(r=rod_tol + rod_diameter / 2, h=rod_mount_length+ z_rod_mount_thick+1, center=false, $fn=resolution(rod_diameter));
	}
}