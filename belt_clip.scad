use <MCAD/triangles.scad>
include <ss_parms.scad>

belt_retainer(5,7,7,1);

module belt_retainer(belt_width, depth, mount_height, wall){
	t_hyp = 4 * wall + belt_width;
	t_side = sqrt(pow(t_hyp,2)/2);
	difference(){
		union(){
			cube(size = [belt_width + 2*wall, mount_height + wall + 0.01, depth]);
			translate([wall + belt_width/2, t_hyp/2 + wall +  mount_height ,0])
				rotate([0,0,-135])
					a_triangle(45, t_side, depth);
		}
		translate([wall, wall,-0.5])
			cube(size = [belt_width, 3 * mount_height, depth + 1]);
	}
}