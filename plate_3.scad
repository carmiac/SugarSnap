use <base_vertex.scad>
use <z_rod_top_mount.scad>

preview = true;

translate([-30, 18, 0])
	base_vertex_b();
translate([25, -18, 0])
	base_vertex_b();
translate([15,30,0])	 
	z_rod_top_mount();
translate([-45,-35,0])	 
	z_rod_top_mount();	


if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}