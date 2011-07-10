use <Libs.scad>
include <ss_parms.scad>
use <end_strut.scad>
use <base_strut.scad>
use <y_rod_strut.scad> 
libEcho = false;

preview = false;

module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}

if (preview) 
	ShowPegGrid(1.0);

translate([-40,10,0])
	end_strut();
	

translate([-25,-25,0])
		base_strut();
