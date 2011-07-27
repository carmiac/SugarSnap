use <y_rod_strut.scad>

preview = false;

translate([-34, 10, 0])
	y_rod_strut();
translate([2, -9, 0])
	rotate([0,0,180])
		y_rod_strut();
translate([18, 20,0])
	rotate([0,0,-90])
		y_rod_strut();
	
	
if (preview) 
	ShowPegGrid(1.0);
	
module ShowPegGrid(Size) {
 
 for (x=[-5:5])
  for (y=[-5:5])
   translate([x*10,y*10,Size/2])
    cube(Size,center=true);
 
}