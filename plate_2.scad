use <base_vertex.scad>
use <z_rod_mount.scad>

preview = false;

translate([-17, 18, 0])
	base_vertex();
translate([32, -18, 0])
	base_vertex();
translate([15,30,0])	 
	z_rod_mount();
translate([-45,-35,0])	 
	z_rod_mount();	


if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}