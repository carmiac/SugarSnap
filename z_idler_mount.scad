include <ss_parms.scad>
use <Libs.scad>
use <MCAD/motors.scad>

z_idler_mount();

module z_idler_mount(){
	difference(){
		union(){
			// main body
			cube(size=[z_bearing_diameter + z_pocket_wall * 2, z_bearing_diameter + z_pocket_wall * 2, z_mount_thick]);
			// bearing mount
			translate([z_bearing_diameter/2 + z_pocket_wall, z_bearing_diameter/2 + z_pocket_wall, z_mount_thick -0.1])
				tube(r=z_bearing_diameter/2 + z_pocket_wall, thickness = z_pocket_wall-bearing_tol, height=z_bearing_width+0.1, center=false, outline=false);
			//mounting tabs
			translate([0,-es_height,0])
				cube(size = [10, es_height + 0.1, z_mount_thick]);
			translate([z_bearing_diameter + z_pocket_wall * 2-10, -es_height,0])
				cube(size = [10, es_height + 0.1, z_mount_thick]);
		}
		// rod bore
		translate([z_bearing_diameter/2 + z_pocket_wall, z_bearing_diameter/2 + z_pocket_wall, -0.5])
			cylinder(r = z_rod_bore_diameter/2, h = z_mount_thick + 1);
	}
}