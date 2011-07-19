include <ss_parms.scad>
use <Libs.scad>
use <MCAD/motors.scad>

z_motor_mount();

module z_motor_mount(){
	difference(){
		union(){
			// main body
			cube(size=[z_motor_mount_length, z_motor_mount_width, z_mount_thick]);
			// bearing mount
			translate([z_bearing_diameter/2 + z_pocket_wall, z_bearing_diameter/2 + z_pocket_wall, z_mount_thick -0.1])
				tube(r=z_bearing_diameter/2 + z_pocket_wall, thickness = z_pocket_wall-bearing_tol, height=z_bearing_width+0.1, center=false, outline=false);
			//mounting tabs
			translate([0,-es_height,0])
				cube(size = [10, es_height + 0.1, z_mount_thick]);
			translate([es_length/2 - 5, -es_height,0])
				cube(size = [10, es_height + 0.1, z_mount_thick]);
		}
		// rod bore
		translate([z_bearing_diameter/2 + z_pocket_wall, z_bearing_diameter/2 + z_pocket_wall, -0.5])
			cylinder(r = z_rod_bore_diameter/2, h = z_mount_thick + 1);
		// motor mount
		translate([z_motor_mount_length + 5 - z_motor_slide - 1.7*inch/2,z_motor_mount_width/2,-0.5])
			rotate([0,0,90])
				linear_extrude(height = z_mount_thick + 1)
					stepper_motor_mount(17,slide_distance=z_motor_slide, mochup=false, tolerance=0.25);
	}
}