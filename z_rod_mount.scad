use <Libs.scad>
include <ss_parms.scad>

z_rod_mount();

module z_rod_mount(){
	difference(){
		union(){
			// body
			cube(size=[z_rod_mount_width, rod_diameter + 2*(tv_rod_wall +rod_tol) , es_height]);
			// dovetails
			translate([6.75,0,es_height/2])
				rotate([0,0,-90])
					dovetail(male = true, height = es_height);
			translate([z_rod_mount_width-6.75,0,es_height/2])
				rotate([0,0,-90])
					dovetail(male = true, height = es_height);
			// rod mount
			translate([15, rod_tol + rod_diameter / 2 + tv_rod_wall,es_height+(tv_rod_length+5)/2])
				cylinder(r=rod_tol + rod_diameter / 2 + tv_rod_wall, h=tv_rod_length+ 5.01, center=true, $fn=resolution(rod_diameter));
		}
		// rod hole
		translate([15, rod_tol + rod_diameter / 2 + tv_rod_wall,-1])
			cylinder(r=rod_tol + rod_diameter / 2, h=tv_rod_length+ es_height+1, center=false, $fn=resolution(rod_diameter));
	}
}