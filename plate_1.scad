use <base_strut.scad>

preview = false;

translate([-18, -32, 0])
	rotate([0,0,90])
		base_strut();
translate([15, -32, 0])
	rotate([0,0,90])
		base_strut();
translate([48, -32, 0])
	rotate([0,0,90])
		base_strut();
	


if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}
