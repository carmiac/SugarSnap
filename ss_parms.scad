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

/*** End Struts ***/
es_length = 80; // strut body length
es_width = 30;	// strut body width
es_height = 10; // strut body thickness
es_teardrops = true; // include teardrop holes
es_td_radius = 9; // teardrop hole radius
es_num_td = 2;	// number of teardrops
es_td_space = 12; // space between teardrops 

/*** Base Struts ***/
bs_length = 50; // strut body length
bs_width = 30;	// strut body width
bs_height = 10; // strut body thickness
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
ys_rod_diameter = (3/8) * inch + 0.05; // outer diameter of the y-rod, plus some shrinkage
ys_rod_wall = 3;
ys_rod_length = 15;

/*** Y Motor Strut Struts ***/
ym_length = 100; // strut body length
ym_width = 30;	// strut body width
ym_height = 10; // strut body thickness

/*** Bottom Vertex ***/
bv_width = es_height; // vertex thickness
bv_radius = 31; // radius of the vertex
bs_sink = es_height/3; // how far to countersink the y supporting base struts into the vertex
bs_outset = 10; // outset of the y supporting base struts from the center of the vertex
bv_tolerance = 0.25; // shrinkage interference tolerence for the holes

/*** Top Vertex ***/
tv_rod_diameter = ys_rod_diameter; // outer diameter of the x-rod, plus some shrinkage
tv_rod_wall = ys_rod_wall;
tv_rod_length = ys_rod_length;
tv_rod_spacing = 35; // space between the inside edges of the x-rods
tv_rod_lift = 0; // center of x rods above center of vertex semi-circle
tv_top_height = tv_rod_diameter/2 + tv_rod_wall + tv_rod_lift + 5; // vertex body height above bottom half circle
tv_rod_sink = 5;

/*** X Motor Mount ***/
x_dt_space = 20; // spacing between the X motor mount dovetails







