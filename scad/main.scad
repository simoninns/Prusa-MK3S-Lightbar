/************************************************************************

	main.scad
    
	Prusa MK3S dual-light bar
    Copyright (C) 2020 Simon Inns
	
    This file is part of MK3S_Lightbar.
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

// Includes code from:
// PRUSA iteration4
// Z axis top holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Rendering quality
$fn=10;

// Variables for customiser

// Set either to true for generating output suitable for export
// Set both to false to generated output to show the overall object
// including the non-printable aluminium profile

/* [Checkbox] */

// Render left arm for printing
stl_left = false;
// Render right arm for printing
stl_right = false;

include <nextec_profile.scad>;
include <lightbar_alu.scad>;

// Start of modules ----

module z_top_base()
{
    translate([0,-5,0]) cube([8,45,16]); // plate touching the base
    translate([0,-5,0]) cube([33,3.6,12]); // plate touching the base
    translate([0,-5,-5]) cube([38,45,10]); // plate touching the base
    translate([25+4.3,3.2,5]) rotate([0,0,0]) cylinder(h = 2.5, r=7, $fn=60);
}

module z_top_fancy()
{
    // Corner cutouts
    translate([0.5,0.5,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);    

    // frame side angle
    translate([-13,40+5+10.2,-5]) rotate([0,0,-45-0]) translate([0,0,-1]) cube([30,30,51]);
    translate([8,28,-5]) translate([0,0,-1]) cube([50,50,51]);       

    // cut to shape
    translate([4,-1,12]) rotate([0,0, 0]) translate([0,-5,0]) cube([30,50,30]);          
    translate([6,0,12]) rotate([0,-45, 0]) translate([0,-5,0]) cube([30,50,30]);
    translate([8,3.9,10]) rotate([0,-45, 0]) translate([0,-5,0]) cube([30,50,30]);

    // nice edges
    translate([38-2.5,-5+2.5,-3]) rotate([0,0,-45-90]) translate([-15,0,-3]) cube([30,30,51]);         
    translate([-10,49,3.2]) rotate([45,0,0]) translate([-15,0,-1]) cube([50,20,20]);         
    
    // outer corner
    translate([35,26,-3]) rotate([0,0,-45])    translate([-15,0,-3]) cube([30,30,51]);
    translate([0,0,5]) rotate([45+180,0,0]) rotate([0,0,-45+90]) translate([0,0,-15]) cube([30,30,30]);

    // Stiffner cut out
    translate([33,-1,7.5]) rotate([0,-45,0]) translate([0,-5,0]) cube([30,50,30]);
    
    // side cut out
    translate([-6,-5,-8.55]) rotate([45,0,0])  cube([50,5,5]);
    translate([-6,-5,-5.5]) rotate([0,45,0])  cube([5,50,5]);
}

module z_top_holes()
{
    // Screw holes frame
    translate([-1,10,10])      rotate([0,90,0]) cylinder(h = 20, r=1.6, $fn=30);
    translate([-1,10+20,10])   rotate([0,90,0]) cylinder(h = 20, r=1.6, $fn=30);

    // Screw heads
    translate([4,10,10]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10-3.1,10]) cube([10,6.2,10]);
    translate([4,10+20,10])  rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+20-3.1,10]) cube([10,6.2,10]);

    // Z rod holder
    translate([25+4.3,3,0.6]) rotate([0,0,0]) cylinder(h = 50, r=4.05, $fn=50);
    translate([25+4.3,3,3.4]) rotate([0,0,0]) cylinder(h = 4.2, r2=4.3, r1=4.05, $fn=50);
    
    // material saving cut
    translate([16,10,-6]) rotate([0,0,0]) cylinder(h = 50, r=8, $fn=6);  
    translate([16,28,-6]) rotate([0,0,0]) cylinder(h = 50, r=8, $fn=6);  

    // z screw hole
    translate([25+4.3,3+17,3]) rotate([0,0,0]) cylinder(h = 50, r=5.8, $fn=15); // screw hole
    translate([25+4.3,3+17,0.6]) rotate([0,0,0]) cylinder(h = 50, r=5.8, $fn=15); // screw hole
    translate([25+4.3-1,3,0.6]) cube([2,15,8]); // it's bit up because it helps with printing
    
    //selective infill
    translate([36.5,1.5,0.5]) cube([0.1,20,3.5]);    
    translate([10,-3,0.5]) cube([22,0.1,3.5]);  
    translate([3,1,0.5]) cube([18,0.1,3.5]);    
    translate([1.5,19,0.5]) cube([21,0.1,3.5]); 
 
}

// offset should be zero if part should be rendered as joined
// to the arm.  Setting separ to true will seperate the part
// ready for export
module z_top_right(offset, separ){
    translate([0,offset,5]) {
        translate([139,0,-5]) {
            rotate([90,0,0]) {
                mirror([0,0,1]) {
                    holder(separ);
                    arm();
                }
            }
        }

        difference()
        {
            z_top_base();
            z_top_fancy();
            z_top_holes();
            //version
            translate([12,-1.5,10]) rotate([90,180,180]) linear_extrude(height = 0.6) 
            { text("R2",font = "helvetica:style=Bold", size=4, halign = "center", valign = "bottom"); }
        }
    }
}

// offset should be zero if part should be rendered as joined
// to the arm.  Setting separ to true will seperate the part
// ready for export
module z_top_left(offset, separ){
    translate([0,offset,5]) mirror([0,1,0]) {
        translate([139,0,-5]) {
            rotate([90,0,0]) {
                mirror([0,0,1]) {
                    holder(separ);
                    arm();
                }
            }
        }

        difference() {
            z_top_base();
            z_top_fancy();
            z_top_holes();
            //version
            translate([19,-1,10]) rotate([90,180,0]) linear_extrude(height = 0.6) 
            { text("R2",font = "helvetica:style=Bold", size=4, halign = "center", valign = "bottom"); }
        }
    }
}

// Start of main function ----

// Format output for visualisation (not for exporting STLs)
if (stl_left == false && stl_right == false) {
    // Final parts
    color("DarkOrange") {
        z_top_left(80 + 290, false);
        z_top_right(5, false);
    }

    // Include the lightbar itself
    color("Silver") {
        translate([174,10,14]) {
            rotate([90,20,180]) {
                alu_profile(355);

                translate([-40,0,0]) {
                    alu_profile(355);
                }
            }
        }
    }
} else if (stl_left == true && stl_right == false) {
    z_top_left(0, true);
} else if (stl_right == true && stl_left == false) {
    z_top_right(0, true);
} else {
    z_top_left(-7, true);
    z_top_right(7, true);
}
