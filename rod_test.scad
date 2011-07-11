include <ss_parms.scad>
use <strut_dummies.scad>

libEcho = false;

translate([-40,-5,0])
	rod_test();


preview = false;

if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}

module rod_test(tol = 0.5){
	union(){
		//main body
		cube(size=[80, ys_rod_diameter + ys_rod_wall + 6, 3]);
		// base strut mounting tests
		for ( i = [1 : 4 ]) {
			translate([ -5 + i * (ys_rod_diameter + 2 *ys_rod_wall + 3), (ys_rod_diameter + ys_rod_wall + 6)/2, ys_rod_length/2 + 2.99]) 
					rod_mount(tol = 0.15 * (i+1));
		}
	}
}
