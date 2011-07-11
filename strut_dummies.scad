use <Libs.scad>
include <ss_parms.scad>

peg_width = bs_width / 4;

bs_dummy();

module es_dummy(){
	union(){
		cube([es_length, es_width, es_height + 0.05]);
		translate([es_length, es_width - 6.75, es_height/2])
			dovetail(male = false, height = es_height + 0.05);
	}
}

module bs_dummy(tol = bv_tolerance){
	union(){
		// body
		translate([-bs_sink, 0, 0]) 
			cube(size=[bs_length + bs_sink, bs_width+tol, bs_height+tol]);
		// mounting pegs
		translate([-bv_width-0.1, 0, 0]) 
			cube(size=[bv_width - bs_sink +0.5, peg_width+tol, bs_height+tol]);
		translate([-bv_width-0.1, bs_width - peg_width , 0]) 
			cube(size=[bv_width - bs_sink + 0.5, peg_width+tol, bs_height+tol]);
		// support cube
		translate([-bs_sink, (bs_width-peg_width)  / 2, bs_height- 0.1])
			cube(size=[bs_sink + 0.5 * bs_td_space, peg_width+tol, bs_height+tol]);
	}
}

module rod_mount(tol = 0.1){
	difference(){
		cylinder(r=tol + tv_rod_diameter / 2 + tv_rod_wall, h=tv_rod_length+ 0.01, center=true, $fn=resolution(ys_rod_diameter));  
		cylinder(r=tol + tv_rod_diameter / 2, h=tv_rod_length + 0.1, center=true, $fn=resolution(ys_rod_diameter));  
	}
}