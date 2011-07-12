use <MCAD/teardrop.scad>
use <MCAD/math.scad>

sarrus_link(length = 80, width = 40, depth = 5, truss_width = 6, hinge_radius = 1.5, hinge_wall = 3, hinge_clearance = 1, num_hinges = 3);
//hinge(1.5,3,10);

module sarrus_link(length, width, depth, truss_width, hinge_radius, hinge_wall, hinge_clearance, num_hinges) {
	body_length = length - 2 * (hinge_wall + hinge_radius);
	union(){
		// main body
		main_body(body_length, width, depth, truss_width);
		// left side hinges
		
		for ( i = [0 : num_hinges-1]) {
			translate([-(hinge_radius + hinge_wall),i * width/num_hinges ,0])
				hinge(hinge_radius, hinge_wall, (width/(2*num_hinges)) - hinge_clearance/2);
		}
		// right side hinges
		for ( i = [0 : num_hinges-1]) {
			translate([length-(hinge_radius + hinge_wall),(width+ hinge_clearance/2- (width/(2*num_hinges)))-(i * width/num_hinges) ,0])
				mirror([1,0,0])
					hinge(hinge_radius, hinge_wall, (width/(2*num_hinges)) - hinge_clearance/2);
		}
	}
}

module hinge(hole_radius, wall, depth){
	difference(){
		union(){
			translate([0,depth,wall + hole_radius])
			rotate([0,90,-90])
			{
				// hex body
				cylinder(r = hole_radius + wall,, h = depth, $fn=6);
				// mounting square
				cube(size=[hole_radius + wall, 0.01 + hole_radius + wall, depth]);
			}
		}
		// teardrop hole
		translate([0,depth/2,wall + hole_radius])
			rotate([0,0,90])
				teardrop(radius=hole_radius,  length = 1.1* depth, angle=90);
	}
}
module main_body(length, width, depth, truss_width){
	union(){
		// body block
		difference(){
			cube(size=[length, width, depth]);
			translate([truss_width, truss_width, -0.5]) 
				cube(size=[length - 2 * truss_width, width - 2 * truss_width, depth+1]);
		}
		truss(length, width, depth, truss_width);
	}
}

module truss(length, width, depth, truss_width){
	intersection(){
		cube(size=[length, width, depth]);
		union(){
		rotate([0,0,atan((width/length))])
			translate([0,-truss_width/2,0])
				cube(size=[length* 1.5, truss_width, depth]);
		translate([0,width,0])
			rotate([0,0,-atan((width/length))])
				translate([0,-truss_width/2,0])
					cube(size=[length* 1.5, truss_width, depth]);		
		}
    }
}