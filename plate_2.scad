use <base_vertex.scad>
use <z_rod_mount.scad>

preview = false;

translate([-28, 8, 0])
	base_vertex_b();
translate([30, -15, 0])
	base_vertex_a();
translate([10,25,0])	 
	z_rod_mount();
translate([-40,-40,0])	 
	z_rod_mount();	


if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}