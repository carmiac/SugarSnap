include <Libs.scad>
include <ss_parms.scad>

libEcho=false;

end_strut();

module end_strut(){
	difference(){
		union(){
			cube(size=[es_length, es_width, es_height]);
			translate([0, 6.75, es_height/2]) mirror([1,0,0]) dovetail(height = es_height, male=true);
			translate([es_length,  es_width- 6.75, es_height/2]) dovetail(height = es_height, male=true);
		}
		translate([es_length, 6.75, es_height/2]) mirror([1,0,0]) dovetail(male = false, height = 1.1* es_height);
		translate([0,  es_width- 6.75, es_height/2]) dovetail(male = false, height = 1.1* es_height);
		/*
		if (es_teardrops) {
			for ( i = [0 : es_num_td - 1 ]) {
				translate([es_td_space + es_td_radius +  i * (2.5 * es_td_radius + es_td_space),  es_width / 2, es_height/2])
				 rotate(righty(90))
					 teardrop(radius=es_td_radius,  length = 1.1* es_height, angle=90);	
			}
		}
		*/
	}
}


