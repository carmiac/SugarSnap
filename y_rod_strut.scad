include <Libs.scad> 
include <ss_parms.scad>

libEcho=false;

foot_length = bv_radius - ys_width/2;

y_rod_strut();

module y_rod_strut(){
		union(){
			cube(size=[ys_length, ys_width, ys_height]);
			translate([0, 6.75, ys_height/2]) mirror([1,0,0]) dovetail(male = true, height = ys_height);
			translate([0,  ys_width - 6.75, ys_height/2]) mirror([1,0,0]) dovetail(male = true, height = ys_height);
			translate([ys_length, 6.75, ys_height/2]) dovetail(male = true, height = ys_height);
			translate([ys_length,  ys_width - 6.75, ys_height/2]) dovetail(male = true, height = ys_height);
			translate([ys_length / 2, ys_width / 2, ys_height + ys_rod_length / 2])
			difference(){
				cylinder(r=ys_rod_diameter / 2 + ys_rod_wall, h=ys_rod_length+ 0.01, center=true, $fn=resolution(ys_rod_diameter));  
				cylinder(r=ys_rod_diameter / 2, h=ys_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));  
			}
			if (ys_foot){
				translate([ys_length/2, -1 * foot_length,0]) slot([ys_foot_width, 0.1 + foot_length, ys_height],true,false);     
			}
		}
}

