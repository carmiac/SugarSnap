use <top_vertex.scad>

preview = true;

translate([16, -18, 0])
	rotate([0,0,45])
		top_vertex();
translate([-19, +15, 0])
	rotate([0,0,-135])
		top_vertex_b();	


if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}