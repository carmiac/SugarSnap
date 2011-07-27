use <y_motor_strut.scad>
use	<z_motor_mount.scad>
preview = false;

translate([-48, 10.75, 0])
	y_motor_strut();
translate([42, -5, 0])
	rotate([0,0,180])
		z_motor_mount();
	
if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}