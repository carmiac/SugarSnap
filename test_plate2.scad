use <Libs.scad>
include <ss_parms.scad>
use <base_vertex.scad>
use <y_rod_strut.scad>

libEcho = false;

preview = false;

if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}
translate([15,15,0])
	base_vertex();
	
translate([-10,-40,0])
	rotate(a=[0,0,90])
		y_rod_strut();