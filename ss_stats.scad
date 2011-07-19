include <ss_parms.scad>


echo("***** Sugar Snap Configuration Stats *****");
echo("******************************************");
echo("****** Primary Size Configuration ********");
echo(str("Smooth Rod Diameter: ", rod_diameter ));
echo(str("Y Smooth Rod Length: ", y_rod_length));
echo(str("X Inner Length: ", x_length));
echo(str("Frame Strut Thickness: ", strut_thick)); // thickness of the frame struts
echo(str("Frame Strut Width: ", strut_width)); // width of the frame struts
echo(str("Top Strut Lift: ", ts_lift));
echo(str("Base Vertex Radius: ", bv_radius));
echo(str("Idler Pulley Radius: ", idler_pulley_radius));
echo("******* Tolerence Configuration **********");
echo(str("rod_tol: ", rod_tol));
echo(str("slot_tolerence: ", slot_tolerence));
echo(str("bearing_tol: ", bearing_tol));
echo("*** Derived Lengths and Measurements  ****");
echo(str("End Strut Length: ", es_length));
echo(str("Base Strut Length: ", bs_length));
echo(str("Base Strut Outset: ", bs_outset));
echo(str("Y Carriage Width: ", yc_width));
echo(str("Z Smooth Rod Length: ", (y_rod_length * sqrt(3) / 2) + 
									(tv_top_height - z_rod_mount_thick) +	
									-es_width/2 + rod_mount_length + z_rod_mount_thick
										));
 
// avoid a top level object error
cube(size = 1, center = false);