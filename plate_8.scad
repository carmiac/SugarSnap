use <z_idler_mount.scad>
use <z_motor_strut.scad>
use <y_rod_strut.scad>

preview = true;

translate([-47, 10, 0])
	z_idler_mount();
translate([-43, -41, 0])
	z_motor_strut();
translate([-3, 15, 0])
	rotate([0,0,00])
		y_rod_strut();	
	
if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}