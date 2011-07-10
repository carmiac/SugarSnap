include <Libs.scad> 
include <ss_parms.scad>

libEcho=false;
rod_test = false;

translate([-40,5,0])
	dt_test(0.950);
	
translate([10,5,0])
	dt_test(0.925);

translate([-40,-35,0])
	dt_test(0.900);

translate([10,-35,0])
	dt_test(0.875);
	
	
module dt_test(scale = 0.975){
		difference(){
			union(){
				cube(size=[ys_length, ys_width, ys_height]);
				translate([0, 6.75, ys_height/2]) mirror([1,0,0]) 
					dovetail(male = true, height = ys_height, fit_scale = scale);
				translate([0,  ys_width - 6.75, ys_height/2]) mirror([1,0,0]) 
					dovetail(male = true, height = ys_height, fit_scale = scale);
	
				if (rod_test){
					translate([ys_length / 2, ys_width / 2, ys_height + ys_rod_length / 2])
						difference(){
							cylinder(r=ys_rod_diameter / 2 + ys_rod_wall, h=ys_rod_length+ 0.01, center=true, $fn=resolution(ys_rod_diameter));  
							cylinder(r=ys_rod_diameter / 2, h=ys_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));  
						}
				}
			}
			translate([ys_length, 6.75, ys_height/2]) 
				mirror([1,0,0])
					dovetail(male = false, height = ys_height+ 0.01);
			translate([ys_length,  ys_width - 6.75, ys_height/2]) 
				mirror([1,0,0])
					dovetail(male = false, height = ys_height+ 0.01);
		}
}