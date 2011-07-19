/*
 * Parameters for SugarSnap RepRap 
 *  Copyright (C) 2011  Adam Milner
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
*/

include <mcad/units.scad>

/*** Primary Configuration ***/
rod_diameter = 8; // outer diamter of the smooth rods
rod_length = 350; // length of the smooth rods
rod_tol = 0.15; // tolerance added to rod holes for shrinkage
slot_tolerence = 0.45; // tolerence for slot connectors
idler_pulley_radius = 15; // outer radius, including flange of the idler pulleys
bearing_tol = rod_tol; // tolerence added to bearing pockets for shrinkage

/*** End Struts ***/
es_length = 80; // strut body length
es_width = 30;	// strut body width
es_height = 7; // strut body thickness
es_teardrops = false; // include teardrop holes
es_td_radius = 9; // teardrop hole radius
es_num_td = 2;	// number of teardrops
es_td_space = 12; // space between teardrops 

/*** Base Struts ***/
bs_length = 50; // strut body length
bs_width = 30;	// strut body width
bs_height = 7; // strut body thickness
bs_teardrops = true; // include teardrop holes
bs_td_radius = 9; // teardrop hole radius
bs_num_td = 1;	// number of teardrops
bs_td_space = 12; // space between teardrops 

/*** Y Rod Support Struts ***/
ys_length = 30; // strut body length
ys_width = bs_width;	// strut body width
ys_height = bs_height; // strut body thickness
ys_foot = true;	// use a foot on the y rod support
ys_foot_width = 8;	// foot width
ys_rod_diameter = rod_diameter; // outer diameter of the y-rod, plus some shrinkage
ys_rod_wall = 3;
ys_rod_length = 15;
ys_rod_tol = rod_tol;
ys_rod_sink = ys_height / 2; //rod countersink into the body 

/*** Y Motor Strut Struts ***/
ym_length = 100; // strut body length
ym_width = bs_width;	// strut body width
ym_height = bs_height; // strut body thickness
ym_mount_width = 5; // width of the motor mount

/*** Y Idler Strut ***/
yi_bolt = 8; // Y idler bolt
yi_width = 10; // Y idler support width



/*** Bottom Vertex ***/
bv_width = es_height; // vertex thickness
bv_radius = 31; // radius of the vertex
bs_sink = es_height/3; // how far to countersink the y supporting base struts into the vertex
bs_outset = 10; // outset of the y supporting base struts from the center of the vertex
bv_tolerance = slot_tolerence; // shrinkage tolerence for the strut slots

/*** Top Vertex ***/
tv_rod_diameter = ys_rod_diameter; // outer diameter of the x-rod, plus some shrinkage
tv_rod_wall = ys_rod_wall;
tv_rod_length = ys_rod_length;
tv_rod_spacing = 35; // space between the inside edges of the x-rods
tv_rod_lift = 0; // center of x rods above center of vertex semi-circle
tv_top_height = tv_rod_diameter/2 + tv_rod_wall + tv_rod_lift + 5; // vertex body height above bottom half circle
tv_rod_sink = es_height/2;
tv_rod_tol = rod_tol;

/*** X Motor Mount ***/
x_dt_space = 20; // spacing between the X motor mount dovetails

/*** Y Carriage ***/
yc_width = ym_length + 2 * ys_length; // width (x direction) of the y carriage
yc_length = 90; // length in the y direction of the y carriage
yc_thick = 5; // thickness of the Y carriage frame pieces
yc_frame_width = 25; // width of the Y carriage frame pieces
yc_thickness = 5; // thickness of the Y carriage frame pieces
yc_platform_mount_height = 5; // height of the build platform  mounts above the Y carriage
yc_platform_mount_diameter = yc_frame_width; // diameter of the build platform mounts
yc_magnet_diameter = 5; // diameter of the build platform mounting magnets
yc_magnet_thickness = 3; // thickness of the build platform mounting magnets
yc_clip_wall = 1; // wall thickness for the belt clip
yc_clip_length = 10; // clamping length of the belt clip
yc_belt_width = 5; // width of the y belt, plus some slack
yc_belt_thickness = 2; // thickness of the y belt
y_belt_outset = 15; // distance of inner side of belt from center

/*** Z Motor Mount and Idler ***/

z_bearing_diameter = 22; // 608 bearing
z_bearing_width = 7; // 608 bearing
z_pocket_wall = 5; // wall thickness for the bearing pockets
z_rod_bore_diameter = 16; // 15 for the M8 nut, plus a little wiggle room
z_motor_slide = 10; // length of adjustment slide for belt tension
z_motor_mount_width = 1.7*inch; // wide enough for a NEMA 17
z_idler_mount_width = z_bearing_diameter + z_pocket_wall * 2;
z_mount_thick = 5; 
z_motor_mount_length = 1.7 * inch + z_motor_slide + 5 + z_bearing_diameter + 10;
z_idler_length = z_bearing_diameter + 10;
z_mount_lift = 10; // bottom of the z mounts above the bottom of the end stuts

/*** Z smooth rod mounts ***/
z_rod_mount_width = 30;