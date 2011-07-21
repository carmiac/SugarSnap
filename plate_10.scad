use <top_middle_strut.scad>
use <top_side_strut.scad>
preview = true;

translate([-45, 15, 0])
	top_middle_strut();
translate([-5, -38, 0])
	rotate([0,0,90])
		top_side_strut();
translate([35, -38, 0])
	rotate([0,0,90])
		top_side_strut();
	
	
if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}