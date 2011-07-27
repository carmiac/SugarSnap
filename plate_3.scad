use <base_vertex.scad>
use <z_rod_top_mount.scad>

preview = false;

//left side
translate([-18, 10, 0])
	base_vertex_d();
translate([-32,-38,0])	 
	z_rod_top_mount();	
	
// right side
translate([18, -12, 0])
	base_vertex_c();
translate([5,26,0])	 
	z_rod_top_mount();

if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}