include <Libs.scad>
libEcho = false;

nema_17_mount();

module nema_17_mount(support_height = 54, td = true, td_rotate = 0)
{
	$fs = 0.1;

	wall_thickness = 5;
	motor_width = 42;
	frame_width = motor_width + (wall_thickness + 1)*2;
	bolt = 4;
	height = 25;
	
	//these are all the mount point holes.
	x1 = -wall_thickness;
	y1 = wall_thickness*2;
	x2 = frame_width+wall_thickness;
	y2 = wall_thickness*2;
	x3 = -wall_thickness;
	y3 = frame_width-wall_thickness*2;
	x4 = frame_width + wall_thickness;
	y4 = frame_width-wall_thickness*2;
	
	//center the whole thing in X
	translate([-frame_width/2, 0, 0])
	{
		difference()
		{
			//build the main unit.
			union()
			{
				//structure
				cube([wall_thickness, support_height, frame_width]); //front face
				cube([frame_width, wall_thickness, frame_width]); //left face
				translate([frame_width-wall_thickness, 0, 0])     //right face
					cube([wall_thickness, support_height, frame_width]);
			}

			//nema 17 mount
			rotate([90, 0, 0])
			{
				translate([frame_width/2+0.5, height, -wall_thickness])
				{
					translate([15.5, 15.5, -0.5])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([-15.5, 15.5, -0.5])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([15.5, -15.5, -0.5])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([-15.5, -15.5, -0.5])
						cylinder(r=bolt/2, h=wall_thickness+1);
					translate([0, 0, -0.5])
						cylinder(r=11.5, h=wall_thickness+1);
					translate([-11.5, 0, -0.5])
						cube([23, frame_width, wall_thickness+1]);
				}
			}

			//back slant cutaway
			translate([0, 0, frame_width+wall_thickness])
				rotate([45, 0, 0])
					translate([-frame_width, 0, -frame_width*2])
						cube(size=[frame_width*4, frame_width*2, frame_width*4]);

			// teardrop hole
			if (td){
				translate([25, (1/3) * frame_width, (1/3) * frame_width])
					rotate([td_rotate, 0, 0])
						teardrop(radius=10,  length = 100, angle=90);
			}
			
		}
	}
}
