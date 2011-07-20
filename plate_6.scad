use <y_idler_strut.scad>
use <end_strut.scad>
use <z_idler_strut.scad>

preview = true;

translate([-43, 18, 0])
	z_idler_strut();
translate([-43, -14.5, 0])
	y_idler_strut();
translate([-43, -47, 0])
	end_strut();

if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}