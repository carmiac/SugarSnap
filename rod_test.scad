use <Libs.scad>
include <ss_parms.scad>
use <top_vertex.scad>

libEcho = false;

preview = true;

if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}

module bv_test(tol = 0.5){
	union(){
		difference(){
			//main body
			cube(size=[90, bs_width + 6, 3]);
			// base strut mounting tests
			for ( i = [0 : 4 ]) {
				translate([(i+1) * (bv_width * 2 + 3), 3, bv_width]) 
					rotate(a = [0,-90,0])
						bs_dummy(tol = 0.15 * (i + 1));
			}
		}
	}
}